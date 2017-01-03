# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

users = 10.times do
  User.create!({
    username: Faker::Internet.user_name,
    email: Faker::Internet.email,
    password: 'password'
    })
end

Shiba.create!({creator_id: 1, name: Faker::Name.name, url: 'http://i.giphy.com/oYgrGwnblqRCo.gif'})
Shiba.create!({creator_id: 2, name: Faker::Name.name, url: 'http://i.giphy.com/UGjyHBRNheVoc.gif'})
Shiba.create!({creator_id: 3, name: Faker::Name.name, url: 'http://i.giphy.com/8F9XSfgxpti6Y.gif'})
Shiba.create!({creator_id: 4, name: Faker::Name.name, url: 'http://i.giphy.com/nLydpuAFxMsJW.gif'})
Shiba.create!({creator_id: 5, name: Faker::Name.name, url: 'http://i.giphy.com/UX1fquhNEQsLK.gif'})
Shiba.create!({creator_id: 6, name: Faker::Name.name, url: 'http://i.giphy.com/yZXnkuRmXxwys.gif'})
Shiba.create!({creator_id: 7, name: Faker::Name.name, url: 'http://i.giphy.com/nQ8XtX3ctBCkE.gif'})
Shiba.create!({creator_id: 8, name: Faker::Name.name, url: 'http://i.giphy.com/LNeeebLYW8Edq.gif'})
Shiba.create!({creator_id: 9, name: Faker::Name.name, url: 'http://i.giphy.com/CSpwkAqCu46Pe.gif'})
Shiba.create!({creator_id: 10, name: Faker::Name.name, url: 'http://i.giphy.com/ZLPJZsGPvoxG0.gif'})

Match.create!({shiba_one_id: 1, shiba_two_id: 10, creator_id: 1})
Match.create!({shiba_one_id: 2, shiba_two_id: 9, creator_id: 2})
Match.create!({shiba_one_id: 3, shiba_two_id: 8, creator_id: 3})
Match.create!({shiba_one_id: 4, shiba_two_id: 7, creator_id: 4})
Match.create!({shiba_one_id: 5, shiba_two_id: 6, creator_id: 5})
Match.create!({shiba_one_id: 6, shiba_two_id: 5, creator_id: 6})
Match.create!({shiba_one_id: 7, shiba_two_id: 4, creator_id: 7})
Match.create!({shiba_one_id: 8, shiba_two_id: 3, creator_id: 8})
Match.create!({shiba_one_id: 9, shiba_two_id: 2, creator_id: 9})
Match.create!({shiba_one_id: 10, shiba_two_id: 1, creator_id: 10})

Vote.create!({voter_id: 1, shiba_id: 1, match_id: 1})
Vote.create!({voter_id: 2, shiba_id: 1, match_id: 1})
Vote.create!({voter_id: 3, shiba_id: 1, match_id: 1})
Vote.create!({voter_id: 4, shiba_id: 10, match_id: 1})
Vote.create!({voter_id: 5, shiba_id: 10, match_id: 1})
Vote.create!({voter_id: 6, shiba_id: 10, match_id: 1})
Vote.create!({voter_id: 7, shiba_id: 9, match_id: 2})
Vote.create!({voter_id: 8, shiba_id: 9, match_id: 2})
Vote.create!({voter_id: 9, shiba_id: 3, match_id: 3})
Vote.create!({voter_id: 10, shiba_id: 8, match_id: 3})
Vote.create!({voter_id: 9, shiba_id: 8, match_id: 4})
Vote.create!({voter_id: 8, shiba_id: 7, match_id: 4})
Vote.create!({voter_id: 7, shiba_id: 6, match_id: 5})
Vote.create!({voter_id: 6, shiba_id: 5, match_id: 5})
Vote.create!({voter_id: 5, shiba_id: 5, match_id: 6})
Vote.create!({voter_id: 4, shiba_id: 4, match_id: 7})
Vote.create!({voter_id: 3, shiba_id: 3, match_id: 8})
Vote.create!({voter_id: 2, shiba_id: 2, match_id: 9})
Vote.create!({voter_id: 1, shiba_id: 10, match_id: 10})