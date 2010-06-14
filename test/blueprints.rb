# Machinist is so much better for creating fixtures for DataMapper, Sequel and ActiveRecord models
# the machinist_mongo gem adds support for MongoMapper and Mongoid (we'll use Mongoid)

require 'machinist/mongoid'
require 'sham'
require 'faker'

Sham.define do
  owner { Faker::Name.name }
  name  { Faker::Lorem.words(1) }
  title { Faker::Lorem.words }
  body  { Faker::Lorem.sentences }
end

Post.blueprint do
  owner  # looks for Sham.owner
  published_on Date.today
end

Tag.blueprint do
  name
  title
end

Comment.blueprint do
  owner
  body
end
