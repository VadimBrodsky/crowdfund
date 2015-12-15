# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create(name: 'Music Video', description: 'Super aweome music video', target_pledge_amount: 30000.00)
Project.create(name: 'Hacker Keyboard', description: 'Mechanical switches for the hackers', target_pledge_amount: 12000.00)
Project.create(name: 'Code Editor', description: 'Interactive REPL editor with battaries', target_pledge_amount: 20000.00)
Project.create(name: 'JavaScript MVC Framework', description: 'The one framework to rule them all', target_pledge_amount: 90000.00)
