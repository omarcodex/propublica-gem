# ProPublica Ruby gem

### What?
A Ruby wrapper for the ProPublica Congress API.

### Why?
This gem makes it easier for Ruby developers to use the awesome data from ProPublica. The idea is that it will become more accessible to web developers and will make for greater transparency for those concerned with the goings-on of government.

### How?

To get started, include the gem in your file:

* `gem install ProPublica` then use `require 'propublica'` in your program. [NOTE: For collaborating developers, please see `contributing.md`]

* Initialize a controller object with your (given) API key, like so:
`client = ProPublica.new('API_KEY')`

***
`.about` will get you started.

`.config` will let you change API keys.

`.get_house_members(congress_number)` will return a Hash object of all Congressional House members for the session you input (e.g., 115 for 115th Congressional session).

`.get_senate_members(congress_number)` will do the same as above.

`.get_member(congress_id)` will return a hash object of one particular member (whose ID you can lookup through Lib. of Congress).

***


### Who?

This project was started by @omarcodex and he would love for anyone to help out! It's **absolutely a work in progress** and does not claim to be buttery smooth yet!

E-mail: oam@cal.berkeley.edu
