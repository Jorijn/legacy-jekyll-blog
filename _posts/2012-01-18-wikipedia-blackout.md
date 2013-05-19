---
layout: post
title: "Wikipedia Blackout #wikipediablackout"
categories: misc
---

Don't get me wrong, I support the whole thing but it tends to be fairly annoying when you use Wikipedia on a daily basis.

In technical terms, they hid every child under `<body>` and appended a `div` with the SOPA message. I compiled a small bookmarklet which allows you to click or either paste the snippet in your address bar to view their original content.

<?prettify?>
	javascript:(function(){ $('#mw-sopaOverlay').remove(); $('body > *').show(); })();
