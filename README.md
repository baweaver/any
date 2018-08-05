# Any

Any is a simple gem. When you compare it against anything, it's always true.

This is a play at Scala's Any type, mostly used for pattern matching type
techniques.

* https://docs.scala-lang.org/tour/unified-types.html
* https://www.scala-lang.org/api/2.12.3/scala/Any.html

## Usage

Note that I'm using Qo here. If these two issues are
added in Ruby 2.6+ it'll enable us to do this without
the need for Qo:

Hash#===  - https://bugs.ruby-lang.org/issues/14869
Array#=== - https://bugs.ruby-lang.org/issues/14916

I've commented on each to note this.

For now, I will leave Qo in the specs so that we don't
have a hard dependency on 2.6+, especially considering
that at the time of writing this it's still in development.

```ruby
require 'qo' # gem install qo @ v0.3.0

case ['Foo', 25]
when Qo[/^F/, Any] then true
else false
end
# => true

case {id: 1, name: 'foo', age: 42}
when Qo[id: Any, name: /^f/, age: Any] then true
else false
end
# => true

case {id: 1, name: 'foo'}
when Qo[id: Any, name: /^f/, age: Any] then true
else false
end
# => false
```

Qo behaves much like the proposals, except in that it's permissive
for Arrays of mismatched lengths and works with Objects.

In 2.6+, assuming the two above are accepted, you could do this:

```ruby
case ['Foo', 25]
when [/^F/, Any] then true
else false
end
# => true

case {id: 1, name: 'foo', age: 42}
when {id: Any, name: /^f/, age: Any} then true
else false
end
# => true

case {id: 1, name: 'foo'}
when {id: Any, name: /^f/, age: Any} then true
else false
end
# => false
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'any'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install any

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/baweaver/any. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Any project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/baweaver/any/blob/master/CODE_OF_CONDUCT.md).
