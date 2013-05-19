---
layout: post
title: "Cannot use $this as lexical variable"
---

Since the beginning of version 5.3, PHP introduced Closures. People familiar with JavaScript might refer to them as `anonymous functions`. These closures allow you to do something like this:

{% highlight php %}
<?php

$to_execute = function() {
	print 'Hello World';
};

$to_execute();

?>
{% endhighlight %}

In my example I wanted to do certain action before and after I called a function. This action required access to the `$this` variable to access to scope which holds the database class. I tried the following code:

{% highlight php %}
<?php

$to_execute = function() use ($this) {
	$this->display('Hello World');
};

$to_execute();

?>
{% endhighlight %}

This resulted in: `Fatal error: Cannot use $this as lexical variable` -- After spending some time on Google I found out this *is* actually possible, but not yet fully implemented until PHP version 5.4. You can use the following workaround:

{% highlight php %}
<?php

$reference_variable = $this;
$to_execute = function() use ($reference_variable) {
	$reference_variable->display('Hello World');
};

$to_execute();

?>
{% endhighlight %}

Hope this'll save you some time, as it sure helped me.
