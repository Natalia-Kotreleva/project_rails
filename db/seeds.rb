# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#answer = Answer.create([body: 'Yes', question_id: question.id])
#category = Category.create([title: 'New'])
#question = Question.create([body: 'How?', test_id: test.id])
#test = Test.create([title: 'Test'])
#user = User.create([name: 'Tom'])
User.find(5).update(type: 'Admin')
