# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'digest'

users = []
posts = []

# Populate users
# demo users for interactions
(1..5).each do |i|
    display_name = "Demo User #{i}"
    email = "demo#{i}@bb.biz"
    password_digest = Digest::MD5.hexdigest "demo#{i}"
    user = User.new(email: email, display_name: display_name, password_digest: password_digest)
    if user.save
        users.push(user)
    end
end

# generic users
15.times do
    display_name = Faker::FunnyName.unique.name
    email = Faker::Internet.email(name: display_name).downcase
    user = User.new(email: email, display_name: display_name)
    if user.save
        users.push(user)
    end
end

# Populate posts
50.times do
    user_id = users.sample.id
    body = Faker::Quote.famous_last_words
    active = [true,true,true,true,false].sample
    post = Post.new(user_id: user_id, body: body, active: active)
    if post.save
        posts.push(post)
    end
end

#Populate comments
200.times do
    user_id = users.sample.id
    post_id = posts.sample.id
    body = Faker::Movie.quote
    Comment.create(user_id: user_id, post_id: post_id, body: body)
end
