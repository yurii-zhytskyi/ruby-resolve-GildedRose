# Gilded Rose in Ruby

## Original resources

- [Original Repository](https://github.com/emilybache/GildedRose-Refactoring-Kata)
- [Original Task](https://github.com/emilybache/GildedRose-Refactoring-Kata/blob/main/GildedRoseRequirements.md)
- [Original Ruby Code](https://github.com/emilybache/GildedRose-Refactoring-Kata/tree/main/ruby)

## Installation

1. Install [`ruby`](https://www.ruby-lang.org/en/downloads/):

2. Install [`gems`](https://rubygems.org/):

```shell
gem install rspec
```

Or you can use [`Bundler`](https://bundler.io/):

```shell
gem install bundler
bundler install
```

### Run the spec tests from the Command-Line

```shell
rspec spec/gilded_rose_spec.rb
```

## Run the TextTest fixture from the Command-Line

For e.g. 10 days:

```shell
ruby texttest_fixture.rb 10
```

You can compare _original_ and _updated_ fixture output after adding logic for **Conjured** items. For example, you can use [`meld`](https://meldmerge.org/) tool:

```shell
meld original_fixture_output.txt updated_fixture_output.txt
```

You should make sure the command shown above works when you execute it in a terminal before trying to use TextTest (see below).

## Run the TextTest approval test that comes with this project

There are instructions in the [TextTest Readme](../texttests/README.md) for setting up TextTest. You will need to specify the Ruby executable and interpreter in [config.gr](../texttests/config.gr). Uncomment these lines:

```text
executable:${TEXTTEST_HOME}/ruby/texttest_fixture.rb
interpreter:ruby
```
