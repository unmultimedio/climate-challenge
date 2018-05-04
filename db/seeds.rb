# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Destroying base
puts 'Destroying base'
Question.destroy_all
Category.destroy_all
puts 'All base new'

# Categories
puts 'Creating categories...'
Category.create(id: 1, name: 'Water use')
Category.create(id: 2, name: 'Food')
Category.create(id: 3, name: 'Energy')
Category.create(id: 4, name: 'Transportation')
Category.create(id: 5, name: 'Waste')
Category.create(id: 6, name: 'Shelter')
Category.create(id: 7, name: 'Clothing ',)
puts 'Categories created'

# Questions
# Water use
q = Question.create(category_id: 1, question:'My shower (or bath) on a typical day is:')
q.options.create(option: 'No shower/bath', value: 0)
q.options.create(option: 'Short shower 3-4 times a week', value: 25)
q.options.create(option: 'Short shower once a day', value: 50)
q.options.create(option: 'Long shower once a day', value: 70)
q.options.create(option: 'More than one shower a day', value: 90)

q = Question.create(category_id: 1, question:'I flush the toilet')
q = Question.create(category_id: 1, question:'When I brush my teeth')
q = Question.create(category_id: 1, question:'We use water-saving toilets')
q = Question.create(category_id: 1, question:'We use low-flow showerheads')
q = Question.create(category_id: 1, question:'I have a dishwasher')


# Challenges
puts 'Creating challenges...'

puts 'Challenges created'


