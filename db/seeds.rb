# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create!(name: "mark",
             hashed_password: "291c3a7302fe1eaae309d1726fe6b46275fb83e586321090b5cd23ad6085a10e",
             salt: "701103186731200.9838617824139855")

User.create!(name: "isabella",
             hashed_password: "291c3a7302fe1eaae309d1726fe6b46275fb83e586321090b5cd23ad6085a10e",
             salt: "701103186731200.9838617824139855")

User.create!(name: "shelley",
             hashed_password: "291c3a7302fe1eaae309d1726fe6b46275fb83e586321090b5cd23ad6085a10e",
             salt: "701103186731200.9838617824139855")


Child.delete_all

Child.create!(first_name: "Bella",
              last_name: "St.Godard",
              age: 10,
              allowance: 20.00,
              image_url: "bella.jpg")

Chore.delete_all

Chore.create!(name: "Clean room",
              complete_by: Time.now + 3.days,
              completed: false)

Chore.create!(name: "Unload dishwasher",
              complete_by: Time.now + 2.days,
              completed: false)

Chore.create!(name: "Take out garbage",
              complete_by: Time.now - 2.days,
              completed: true)

Chore.create!(name: "Swiffer",
              complete_by: Time.now,
              completed: false)
