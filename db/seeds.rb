# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    {
        email: ENV.fetch('USER_1_EMAIL'),
        password: ENV.fetch('USER_1_PASSWORD'),
        firstname: 'Ben',
        lastname: 'Gelbard'
    },
    {
        email: ENV.fetch('USER_2_EMAIL'),
        password: ENV.fetch('USER_2_PASSWORD'),
        firstname: 'James',
        lastname: 'Hastings'
    }
]

User.create!(users) { |u| puts "created #{u.firstname}" }




