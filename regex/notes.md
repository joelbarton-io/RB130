# regex

# intro

- 'regex' (final form) => 'pattern' (indiv components of regex)
- "a string of characters between `/ /`


# basic matching

- alphanumerics: `'mississippi'.match?(/ss/)` => `true`
- case sensitive by default
- `'string'.match('s')` (note we use `'s'`; still works)
- `'string'.match?(/s/)` (note we use `'s'`; still works) => `true`

# special characters (non-alphas)

- "some of those have special meaning in a pattern and require specialized treatment; some don't"
- **META - CHARACTERS** : `$ ^ * + ? . ( ) [ ] { } | \ /`
  - have special meaning
  - match one of these ^ as a literal? => *escape* with `\`

- want to detect a space? use: `/[ ]/` || `/ /`
- want to detect a `.`? use: `/\./`

# concatenation

- the amount of concatonations we can perform is only limited by A) hardware B) the human-readability of our code; if it's too hard to read, it should be broken apart!

# alternation ???

- a way to construct a regex that matches one of several sub-patterns
- `/(cat|rabbit|dog)/` `cat`, `rabbit`, `dog` are the sub-patterns of the regex

# control character escapes

- NOT EVERYTHING THAT LOOKS LIKE A CONTROL CHARACTER ESCAPE IS GENUINE!!!
```ruby
text = " \t \n \r"
# => " \t \n \r"
text.match?(/\t/)
# => true
```

# case (default= sensitive)

- need case-insensitive? => `/characters/i`

challenge: `(blue|black)berry` to only write `berry` once; use `(|)` for prefixes


---------------------------------------------------------------------------
---------------------------------------------------------------------------


# character classes

- use a list of characters between `[ ]`; matches a single occurence of any chr
- useful for input validation like `/[12345]/` or `/[ynYN]/`
- come inhandy when you need case-insensitivity
  - `/[Hh]oover/` matches `Hoover` or `hoover` !

- should group characters by type (digits/ uppercase/ lowercase/ etc...)
  - aids readability
  - can be used in concert with concatenation! `/[abc][12]/` first? + second?
- **IMPORTANT** inside a character class (`[here]`) some meta-characters behave like like their normal *literal* counterparts (`/abc/`)
  - **INSIDE** a chr class, meta-characters: `/[^ \ - [ ]]/`

# range of characters
- `/[a-z0-9]/`, `/[0-9]/`
- **DONT** construct ranges that cover non-alphas

# negated classes
- `/[^]/` `^` negates; all the characters that *dont* match

- ** not sure about this.....if we're using `/[^]/` in a conditional, and whatever is returned is anything other than `nil` or `false`, the conditional will be evaluated since what is returned is a `Match` object or a boolean (`match?` => `true`)

# any character

- if we need **any** character -> `/./` is what we use
  - shortcut for a character class; doesnt occur within `[]`
  - doesn't highlight the invisible `\n` characters!
  - `/[.]/` -> inside `[]`, `.` is literal

# whitespace

- `\s` -> whitespace characters ` ` (space, tab, vertical tab, carriage return, line feed, form feed)
  - `/\s/` == `/[ \t\v\r\n\f]/`
- `\S` -> non-whitespace characters

- `/\s...\s/` => any 3 characters with whitespace on either side

# digits and hex digits

- `\d \D \h \H`

# word characters

- all alphabetic characters (a-z, A-Z), all decimal digits (0-9), and underscore (_)
- there isn't a letters character class shortcut

---------------------------------------------------------------------------
---------------------------------------------------------------------------

# anchors

- ensure that a regex matches a string at a specific location
  - beginning || end || end-of-line || word || non-word boundary
- `^` and `$` are **anchors**; they afix a regex match to the beginning or ending
- `^` forces a pattern to match at the beginning; disregards diff positioned matches
- `$` is the reverse
- combined, they combine functionality; match must be at beginning and end of string

# lines vs strings

- **** newlines are funky w/r/t `^` and `$`

# start/end of string

`\A \Z \z`

# word boundaries

- `\b \B` **DONT WORK INSIDE OF CHARACTER CLASSES**
  - occurs between any pair of characters, one of which is a word chr, one which is not
- inside a chr class, `\b` refers to the backspace character

^(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)$
^(A|The) [a-zA-Z][a-zA-Z][a-zA-Z][a-zA-Z] (dog|cat)$


---------------------------------------------------------------------------
---------------------------------------------------------------------------

# quantifiers

- all of the below look to the immediate left of self

# zero or more

- `_*` where `_` can be any character and `*` checks either zero or more of said character. Zero is very literal!; can search for 'zero' characters (empty)
- if `*` precedes a `(_xd..)`; it treats the entire '()' as pattern (singular)

# one or more

- " " always at least one
- never matches empty like `*` does
- `(x)+` vs `x+`

# zero or one

- `?`
- usecase: matching a date which may or may not contain `-` separators

`\b\d\d\d\d[-|\/]?\d\d[-|\/]?\d\d` matches for all of them below
```ruby
"
20170111
2017-01-11
2017-0111
201701-11
2017/01/11
"
```

# ranges

- p{m} matches precisely m occurrences of the pattern p.
- p{m,} matches m or more occurrences of p.
- p{m,n} matches m or more occurrences of p, but not more than n.

# greedy vs lazy

- ^ previous quantifiers are **greedy!**; always match longest possible

# weird

- `^https?:\S*$` vs `^https?:\/\/\S*$`; produce same match

- `/^\s*https?:\/\/\S*\s*$/` vs `/^\s*?https?:\/\/\S*$/`

- 