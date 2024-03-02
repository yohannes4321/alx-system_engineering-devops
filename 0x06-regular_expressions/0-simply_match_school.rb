#!/usr/bin/env ruby

# Using Oniguruma regular expression library
regex = /School/

# Accept one argument and pass it to the regular expression matching method
puts ARGV[0].scan(regex).join

