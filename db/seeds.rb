# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create!([
  {
    name: 'Music Video',
    description: 'Super aweome music video',
    target_pledge_amount: 30_000.00,
    website: 'http://www.music.video',
    pledging_ends_on: 20.days.from_now,
    team_members: 'Michael Jackson, Justin Timberlake',
    image_file_name: 'project-a.png'
  },
  {
    name: 'Music Video the SQL',
    description: 'Super aweome music video II',
    target_pledge_amount: 50000.00,
    website: 'http://www.music.video',
    pledging_ends_on: 20.days.from_now,
    team_members: 'Jay-Z, Justin Timberlake',
    image_file_name: 'project-b.png'
  },
  {
    name: 'Ultimate Hacking Keyboard',
    description: 'Mechanical switches for the hackers',
    target_pledge_amount: 200_000.00,
    website: 'https://www.crowdsupply.com/ugl/ultimate-hacking-keyboard',
    pledging_ends_on: 20.days.from_now,
    team_members: 'Palmer Luckey, Elon Musk',
    image_file_name: 'project-c.png'
  },
  {
    name: 'Code Editor',
    description: 'Interactive REPL editor with battaries',
    target_pledge_amount: 20_000.00,
    website: 'http://lighttable.com/',
    pledging_ends_on: 10.days.from_now,
    team_members: 'John Carmack, Tom Preston Warner',
    image_file_name: 'project-d.png'
  },
  {
    name: 'JavaScript MVC Framework',
    description: 'The one framework to rule them all',
    target_pledge_amount: 90_000.00,
    website: 'http://todomvc.com/',
    pledging_ends_on: 900.days.from_now,
    team_members: 'Yehuda Katz, Tom Dale',
    image_file_name: 'project-e.png'
  },
  {
    name: 'iPod Charging Dock',
    description: 'A high quality iPod charging dock made from aircraft aluminum and titanium, be ready for anything!',
    target_pledge_amount: 100_000.00,
    website: 'http://www.adock.com',
    pledging_ends_on: 3.days.ago,
    team_members: 'Steve Jobs, Jony Ive',
    image_file_name: 'project-f.png'
  }
])
