require 'faker'
require 'digest'

# Populate demo users for interactions
(1..5).each do |i|
    password_digest = Digest::MD5.hexdigest "demo#{i}"
    User.create(email: "demo#{i}@bb.biz", display_name: "Demo User #{i}", password_digest: password_digest)
end

15.times do
    display_name = Faker::FunnyName.unique.name
    email = Faker::Internet.email(name: display_name).downcase
    User.create(email: email, display_name: display_name)
end

50.times do
    active = [true,true,true,true,false].sample
    Post.create(user_id: User.all.sample.id, body: Faker::Quote.famous_last_words, active: active)
end

200.times do
    Comment.create(user_id: User.all.sample.id, post_id: Post.all.sample.id, body: Faker::Movie.quote)
end
