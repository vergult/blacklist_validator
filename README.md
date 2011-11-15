Installation
------------

Add this line to your Gemfile:

    gem 'blacklist_validator'

Then run:

    bundle install

Usage
-----

Add the following to one of your models:

    validates :name, blacklist: true

You can also modify the default message ("is blacklisted") if validation fails:

    validates :name, blacklist: { message: "is not part of the whitelist" }

Blacklist file
--------------

You can create a blacklist.yml file in the config directory of your Rails application if you need to overload the one used by this gem.

I18n
----

If you use I18n, the default key to translate is :blacklisted. So if you add to your User model:

    validates :name, blacklist: true

You can translate (or overload) the default message via for e.g. using activerecord (in english): "en.activerecord.errors.models.user.attributes.name.blacklisted"

Tests
-----

    cd test
    ruby blacklist_validator_test.rb
