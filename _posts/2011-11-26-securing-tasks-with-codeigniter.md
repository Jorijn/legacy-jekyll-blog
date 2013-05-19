---
layout: post
title: "Securing tasks with CodeIgniter"
---

When you are developing large web-applications you often have to run several tasks asynchronously. For example: deleting old sessions or synchronizing data from external data sources.

When you're using CodeIgniter securing these tasks can be accomplished fairly easily. Most people tend to run their tasks through either the web browser or using `curl` or `wget` from the command line. Controllers in CodeIgniter can be run from the CLI as well. Normally you would run a task like `/controller_name/method_name`. When using the CLI you can do this like this:

<?prettify?>
	$ /usr/bin/php index.php controller_name method_name

The advantage to this method of calling your code is that people actually need shell access to run your code, thus eliminating the need of implementing special ip- or key-based authentication.

When using this approach, don't forget that CodeIgniter doesn't disallow access using the web browser by default. Luckily there is a helper which aids you in doing this yourself. Lets have a look at my constructor:

<?prettify?>
	<?php

	public function __construct()
	{
		parent::__construct();

		// lets see if we are actually run from the command line
		if ($this->input->is_cli_request() === false)
		{
			show_error('Access denied.', 403);
		}
	}

When you implement your constructor like this, CodeIgniter will deny access using the web browser and return HTTP code 403 -- access denied.
