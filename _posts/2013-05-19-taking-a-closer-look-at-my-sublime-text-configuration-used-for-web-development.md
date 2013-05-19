---
layout: post
title: "Taking a closer look at my Sublime Text configuration used for Web Development"
---

To myself, I made the promise to write some more about the things I'm really enthusiastic about. Before this, I wrote about [Vagrant](/2013/05/get-your-web-development-environment-up-and-running-in-half-an-hour-using-vagrant.html "Get your Web Development environment up and running in half an hour using Vagrant") and how it makes my life so much easier. This time I'm writing about my favorite development software, Sublime Text.

![Screenshot Sublime Text 2](/media/2013/05/sublimetext.png)

### You are looking at

I'm using the Laravel color scheme by [Dayle Rees](https://github.com/daylerees/colour-schemes "daylerees/colour-schemes - GitHub"). The font is [Source Code Pro](http://store1.adobe.com/cfusion/store/html/index.cfm?store=OLS-US&event=displayFontPackage&code=1960 "Adobe - Fonts : Source™ Code Pro") by Adobe. Sublime's theme is [Soda](https://github.com/buymeasoda/soda-theme/ "buymeasoda/soda-theme · GitHub").

View my total configuration [right here](/media/2013/05/sublimetext.txt).

You will need the [Sublime Text package manager](http://wbond.net/sublime_packages/package_control "Sublime Package Control â a Sublime Text 2 Package Manager by wbond") to install the following plug-ins. Just CMD+SHIFT+P + install package and search for the name.

### AdvancedNewFile

This one is really awesome although it doesn't do much. By default, when creating a new file Sublime Text takes the file name automatically from the first line writte in the file. This can be annoying sometimes. This plug-in asks you for a name when creating a new file so you can start editing right away.

### Alignment

If you use Sublime a lot, chances are you've heard of this one before. With a simple to remind shortcut (CTRL+CMD+A) you can align just about any piece of code on the `=` character, like this:

{% highlight php %}
<?php $array = array(
	'one'   => 'two'
	'two'   => 'three'
	'three' => 'four'
	); ?>
{% endhighlight %}

### Color Highlighter

When writing CSS, this plug-in highlights the HEX or RGB(A) code with the color specified. Tiny, but useful.

### ColorPicker

I use this a lot when I'm wireframing. From the top of my mind it's CMD+SHIFT+C. Select a color and it's HEX value gets added to your file.

### Dayle Rees Color Schemes

This is by far the best collection of syntax highlighting available. You need this for the Laravel one I'm using.

### Emmet

You remember Zen Coding? This is the new one, better, faster, stronger. How about I just scribble `ul>li*3>a#link-$` end end up with:

{% highlight html %}
<ul>
	<li><a href="" id="link-1"></a></li>
	<li><a href="" id="link-2"></a></li>
	<li><a href="" id="link-3"></a></li>
</ul>
{% endhighlight %}

### Gist

There are these times when I just need to remember this piece of code for later use or when I'm certain I'll be needing this in the future. I can select a piece of code, call the package trigger and paste the public or private Gist URL right away.

### Git

When installed, you can do basic Git commands from the command menu. You can also view the Git status in the status bar of Sublime.

### HtmlTidy

I use this a lot. I'm always moving around code, doing changes and other dangerous stuff which can make code look bad. Run this one and it'll indent and make sure it's tidy and compliant again.

### HyperlinkHelper

This one is used for blogging. Select a piece of text and press CTRL+SHIFT+L and the highlighted text will become a hyperlink, it doesn't even matter what syntax you're using. So far I've seen it working with Textile, Markdown and HTML. It even fetches the document title for you and adds it as the title attribute.

### Inc-Dec-Value

Some people think it's useful, some think it's not. Although I haven't really used it much I can't really make myself remove it because I use it sometimes. When you put your cursor in for example, `23px` -- pressing OPTION+UP will make it `24px`.

### SidebarEnhancements

Sublime's sidebar lacks some normal functions by default. This plug-in adds the Finder context menu to each file so you can perform normal tasks on them from Sublime itself.

### DocBlockr

PHPDoc and Javascript compliant documentation. Here it is! Start with `/**<TAB>` above a function and it'll automatically turn it into something an API doc generator can read.

### SublimeCodeIntel

I couldn't live without this plug-in. It scans your project, auto completes functions, classes and variables in a neat non-intrusive way.

### Theme - Soda

If you look at this software all day, might as well make it look good.

### This should be it

If you think you have any nice additions, be sure to let me know. Hope you like it!
