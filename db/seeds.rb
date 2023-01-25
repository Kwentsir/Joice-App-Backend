# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts 'creating user'
User.create!(email: 'user@email.com', password: 'password', password_confirmation: 'password', role: 'user')
puts 'user created'

puts 'creating voice'
Voice.create!(user_id: 1, file_name: 'voice1', voice_file: 'voice1', date: '2021-05-01')
Voice.create!(user_id: 1, file_name: 'voice2', voice_file: 'voice2', date: '2021-05-02')
puts 'voice created'

puts 'creating journal'
Journal.create!(user_id: 1, voice_id: 1, file_name: 'journal1', transcribed_text: 'journal1', date: '2021-05-01')
Journal.create!(user_id: 1, voice_id: 2, file_name: 'journal2', transcribed_text: 'journal2', date: '2021-05-02')
puts 'journal created'
