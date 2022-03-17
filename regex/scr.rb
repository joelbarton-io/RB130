# @type [String]
str =
"
The quick brown fox jumps over the lazy dog.
"

str =~ /lazy/

str.match(/lazy/)

p Regexp.last_match

[].map 