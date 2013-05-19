---
layout: post
title: "Combining styles and scripts with Apache"
---

Modern browsers allow four concurrent requests to any domain. This should be enough but common practice points out that this often slows large websites down significantly. Lets have a look at my own [portfolio](http://www.jorijn.com/) which perfectly demonstrates this bad example. Don't worry, I'll change this eventually.

<?prettify?>
	<!-- javascripts -->
	<script src="jquery.js"></script>
	<script src="website.js"></script>
	<script src="jquery.fancybox-1.3.4.pack.js"></script>
	<script src="jquery.mousewheel-3.0.4.pack.js"></script>

	<!-- styles -->
	<link rel="stylesheet" href="reset.css">
	<link rel="stylesheet" href="website.css">
	<link rel="stylesheet" href="jquery.fancybox-1.3.4.css">

The browser will fetch the first four scripts and will wait until they're downloaded to the cache before attempting the styles. All assets on the same domain count towards this limit.

### How do we improve this?

This is simple. In the root directory of your website open up your `.htaccess`. Append the following lines:

<?prettify?>
	<FilesMatch "\.combined\.(js|css)$">
	        Options +Includes
	        SetOutputFilter INCLUDES
	</FilesMatch>

Now, create a new file named `scripts.combined.js` or perhaps `homepage.combined.js` with this content:

<?prettify?>
	<!--#include file="libraries/jquery-1.7.min.js" -->
	<!--#include file="custom/script1.js" -->
	<!--#include file="custom/script2.js" -->
	<!--#include file="custom/script3.js" -->
	<!--#include file="custom/script4.js" -->

Apache will now serve `scripts.combined.js` with all those files combined.
