#!/bin/bash

cd /Users/jorijn/Documents/Blog && jekyll && \
s3cmd --delete-removed --reduced-redundancy --guess-mime-type sync /Library/WebServer/Documents/blog/ s3://blog.jorijn.com/ && \
curl 'http://google.com/webmasters/sitemaps/ping?sitemap=http://blog.jorijn.com/sitemap.xml'

