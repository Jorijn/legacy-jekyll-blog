---
layout: post
title: "Using a WordPress shortcode from within a widget"
---

For a project I was doing I needed to offer the flexibility to add buttons to a sidebar. I solved this by creating a shortcode for it. It turns out, WordPress doesn't support shortcodes within widgets.

After some searching I found out you can hook the filter for parsing the shortcodes to the widget hooks.

<?prettify?>
	<?php add_filter('widget_text', 'do_shortcode'); ?>
