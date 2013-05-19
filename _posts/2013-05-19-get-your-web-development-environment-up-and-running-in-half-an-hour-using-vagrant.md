---
layout: post
title: "Get your Web Development environment up and running in half an hour using Vagrant"
---

As of now I own my late-2011 model MacBook Air 13" for a bit more than a year. I use my laptop each and every day and it tends to get full over time with non-used applications and other "stuff". Since I'm on a SSD and disk space is hard to come by, I decided to clean it up a bit by simply reinstalling the main OS.

Before this -- I had my traditional Apache setup with PHP 5.3 and MySQL. The OS was cluttered with virtual hosts, random gems and other project dependencies. Things got bad pretty quickly in this organized chaos.

Some months ago, I ran across a little piece of software called [Vagrant](http://www.vagrantup.com/). It's basically a wrapper for VirtualBox which makes setting up reproducable development environments a breeze. People can make [boxes](http://www.vagrantbox.es/) which are virtual machine templates.

### Where does this get interesting?

Good question. Some of you and of you may not, have heard of provision with either [Chef](http://www.opscode.com/chef/ "Chef | Opscode") or [Puppet](https://puppetlabs.com/ "Puppet Labs: IT Automation Software for System Administrators"). The combination of these two is really awesome. I suggest reading up a bit on this topic.

### Great, but what do I get?

I forked and tweaked a [repository on GitHub](https://github.com/Jorijn/vagrant-chef "Jorijn/vagrant-chef - GitHub"). It's a Vagrant box containing Ubuntu Lucid 64 bits. It's combined with a Chef configuration which installs the following:

 * XDebug
 * WebGrind
 * MailCatcher
 * Git
 * Subversion
 * LAMP stack (PHP 5.4)
 * SQLite
 * Composer
 * Curl, screen + tmux

### Installation

The best thing is, you only need three components on your main OS for this to work. Install them as following:

* [VirtualBox](https://www.virtualbox.org/wiki/Downloads "Downloads – Oracle VM VirtualBox")
* [Vagrant](http://downloads.vagrantup.com/ "Vagrant - Downloads")
* [Chef Client](http://www.opscode.com/chef/install/ "Install Chef | Opscode")

Then, in the project folder add my repository as a submodule.

{% highlight bash %}
$ git submodule add git@github.com:Jorijn/vagrant-chef.git
{% endhighlight %}

Note; If you don't have Git for this project (although you should!) you can simply export and add it as a subdirectory.

Copy the project configuration file to the root directory.

{% highlight bash %}
$ cp vagrant-chef/vagrant/vagrantfiles/Vagrantfile .
{% endhighlight %}

### Done!

Voila, everything is in place. If you run the following command you're environment will be ready for work after it's done provisioning.

{% highlight bash %}
$ vagrant up
{% endhighlight %}

By default, the box has a host-only network and is available on the IP `10.10.10.10`. I suggest adding `app.local` as a host to your hostfile. Apache is configured to be serving everything under the `public/` directory in your project folder.

### Switching a project

Since there is only one `app.local` you can only have one environment running at the same time. When you're done simply run `vagrant suspend` or `vagrant halt` to shut down the virtuel machine again.
