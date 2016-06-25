# Logstash Domain Plugin

This is a plugin for [Logstash](https://github.com/elastic/logstash).

It is fully free and fully open source. The license is Apache 2.0, meaning you are pretty much free to use it however you want in whatever way.

## Documentation
Note that there appears to be a bug in version 1.4.6 of the public_suffix library.  It identifies as 1.4.5 and I needed to manually change it in the gemspec.

This plugin will strip the last part of a URL from mail.google.com to just google.com for example
