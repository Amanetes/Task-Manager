# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!(
  first_name: 'Joey',
  last_name: 'Logano',
  email: 'foo@bar.com',
  password: 'foobar',
  password_confirmation: 'foobar'
)

7.times do
  password = 'foobar'
  User.create!(
    first_name: Faker::Name.unique.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.safe_email,
    password:,
    password_confirmation: password
  )
end

statuses = ['Новый', 'В работе', 'Выполнено']

statuses.each do |status|
  TaskStatus.create!(
    name: status
  )
end
