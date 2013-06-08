fuckyeah
========

fuckyeah is a Ruby implemenation of the popular [FuckYeah jQuery plugin](http://github.com/artpolikarpov/fuckyeah).

Getting started
---------------

Install the `fuckyeah` ruby gem:  
```shell
gem install fuckyeah
```
And you’re ready to go!

Examples
--------

fuckyeah is incredibly easy to use.  
Every single bit of code becomes better after using it, just take a look.

**Before:**
```ruby
n = gets.to_i
a = [1, 1]

(n-2).times do 
  a << a[-1] + a[-2]
end; puts a[-1]
```

Nobody cares about your Fibonacci numbers, you dumbass!

**After:**
```ruby
require 'fuckyeah'

n = gets.fuckyeah.to_i
a = [1, 1]

(n-2).fuckyeah.times do 
  a.fuckyeah << a[-1] + a[-2]
end; puts a[-1]
```

It’s the Ruby style, for sure. Fuck yeah.
