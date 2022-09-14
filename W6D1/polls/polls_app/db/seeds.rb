# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Response.destroy_all
Answerchoice.destroy_all
Question.destroy_all 
Poll.destroy_all
User.destroy_all 


u1 = User.create!(username: 'Markov')
u2 = User.create!(username: 'Bob')
p1 = Poll.create!(title: 'Feeling Poll', author: u1)
q1 = Question.create!(text: 'How are you?', poll: p1)
ac1 = Answerchoice.create!(text: 'Good', question: q1)
ac2 = Answerchoice.create!(text: 'Bad', question: q1)
r1 = Response.create!(respondent: u1, answer_choice: ac1)
r2 = Response.create!(respondent: u2, answer_choice: ac2)