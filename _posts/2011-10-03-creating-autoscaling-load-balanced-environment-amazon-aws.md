---
layout: post
title: "Creating an autoscaling and load balanced environment with Amazon AWS"
---

This was something I needed to do, but with the lack of proper documentation and the incompleteness of the AWS Management Console, I'd figure I'll shed some light on how I accomplished it.

I'm the proper kind of lazy, so I tend to use the Management Console of AWS for just about everything. After setting up the load balancer and manually adding my base instance to it I came to a stop. Amazon AWS does support auto scaling but its well hidden. In fact, you can't find it in the management console. I was pushed back to basic console usage through API tools.

After searching and reading several blog posts and articles about this subject I came to the conclusion this is all very old. The date on which the majority of articles was written dated back to 2009. Since then the crucial part of creating this environment has changed.

I'm going to assume you know your way around AWS and the Management Console.

### Creating a template out of your running machine for duplication

These commands will assume you have your secure certificates placed in `/mnt`. The following command will create a new image from your system and split it up in parts so you can upload it to S3.

{% highlight bash %}
$ ec2-bundle-vol -d /mnt -k /mnt/pk-xxx.pem -c /mnt/cert-xxx.pem -u xxx -r i386
{% endhighlight %}

Upon completion, upload them to a new bucket on S3. The `xxx` should be replaced with your access- and private-key.

{% highlight bash %}
$ ec2-upload-bundle -b bucketnamehere -m /mnt/image.manifest.xml -a 'xxx' -s 'xxx'
{% endhighlight %}

Register your bundle in the AMI menu in the EC2 tab. Location to the manifest should be something like `nameofyourbucket/image.manifest.xml`.

### Register a new load balancer using the Management Console

In the EC2 tab, create a new load balancer and add your instance. This should be pretty straightforward. Give it a proper name since you'll be needing it again in the next steps.

### Executing the commands and creating the scaling policies

Everything is based on a main launch config. This configuration item defines which AMI should be used for replicating and what kind this should be. You'll probably run into the problem that your system can't find the command `as-create-launch-config`. Its part of the [Auto Scaling API tools](http://aws.amazon.com/autoscaling/) from Amazon.

{% highlight bash %}
$ as-create-launch-config autoscale --image-id 'ami-xxxxxxx' --instance-type c1.medium -I accesskey -S 'secretkey' --region eu-west-1
{% endhighlight %}

Next up: Creating a new group which connects your configuration to your load balancer.

{% highlight bash %}
$ as-create-auto-scaling-group cfg-autoscale-group --launch-configuration cfg-autoscale --availability-zones eu-west-1a --min-size 0 --max-size 20 --load-balancers 'loadbalancername' -I accesskey -S 'secretkey' --region eu-west-1
{% endhighlight %}

Please note that I have my minimum size at zero. I have a normal instance running at all time, setting the `min-size` to one would have me running two instances.

Next I'm going to create a policy which basically says "up me one instance". Later on I'll connect this to CloudWatch.

{% highlight bash %}
$ as-put-scaling-policy policy-up --auto-scaling-group cfg-autoscale-group --adjustment=1 --type ChangeInCapacity --cooldown 300 -I accesskey -S 'secretkey' --region eu-west-1
{% endhighlight %}

Lets do the same for downscaling.

{% highlight bash %}
$ as-put-scaling-policy policy-up --auto-scaling-group cfg-autoscale-group --adjustment=-1 --type ChangeInCapacity --cooldown 300 -I accesskey -S 'secretkey' --region eu-west-1
{% endhighlight %}

### Done!

Thats it. When you completed all of the above commands you should be able to connect these policies to CloudWatch alarms. I have my up scaling policy bound to an average of 70% CPU usage for at least five minutes.

