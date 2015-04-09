# Contracts::Rspec

Plugin for [contracts.ruby](https://github.com/egonSchiele/contracts.ruby/) that fixes issues with rspec-mocks.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'contracts-rspec'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install contracts-rspec

## Usage

Just `require 'contracts/rspec'` and `include Contracts::RSpec::Mocks` into your example group and you will be able to use enhanced `instance_double`:

```ruby
require 'contracts'
require 'contracts/rspec'

class Example
  include Contracts

  Contract Something => Any
  def do_something(something)
    something.do
  end
end

RSpec.describe Example do
  # If you not include this, you will get ContractError, telling you
  # that `RSpec::Mocks::InstanceVerifyingDouble` is not a `Something`.
  include Contracts::RSpec::Mocks

  subject(:example) { Example.new }
  let(:something) { instance_double(Something) }

  it "works" do
    expect { example.do_something(something) }.not_to raise_error
  end
end
```

## How it works

When you `include Contracts::RSpec::Mocks`, you basically make your `instance_double` calls additionally stub out `:is_a?` message, when received with specified class to return true. Which makes contract succeed.

You can do it yourself simply:

```ruby
something = instance_double(Something)
allow(something).to receive(:is_a?).with(Something).and_return(true)
```

This library only provides a shortcut.

## Contributing

1. Fork it ( https://github.com/waterlink/contracts-rspec/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
