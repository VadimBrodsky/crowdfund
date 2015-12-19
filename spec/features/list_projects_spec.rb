require 'rails_helper'

describe 'Viewing the list of projects' do
  project1 = Project.create(name: 'Music Video',
    description: 'Super aweome music video',
    target_pledge_amount: 30000.00,
    website: 'http://www.music.video',
    pledging_ends_on: 20.days.from_now)
  project2 = Project.create(name: 'Ultimate Hacking Keyboard',
    description: 'Mechanical switches for the hackers',
    target_pledge_amount: 200_000.00,
    website: 'https://www.crowdsupply.com/ugl/ultimate-hacking-keyboard',
    pledging_ends_on: 20.days.from_now)
  project3 = Project.create(name: 'Code Editor',
    description: 'Interactive REPL editor with battaries',
    target_pledge_amount: 20000.00,
    website: 'http://lighttable.com/',
    pledging_ends_on: 10.days.from_now)
  project4 = Project.create(name: 'JavaScript MVC Framework',
    description: 'The one framework to rule them all',
    target_pledge_amount: 90000.00,
    website: 'http://todomvc.com/',
    pledging_ends_on: 900.days.from_now)
  project5 = Project.create(name: 'iPod Charging Dock',
    description: 'A high quiality iPod charging dock made from aircraft aluminum and titanium, be ready for anything!',
    target_pledge_amount: 100000.00,
    website: 'http://www.adock.com',
    pledging_ends_on: 3.days.ago)

  it 'shows the project namess' do
    visit projects_url
    expect(page).to have_text(project1.name)
    expect(page).to have_text(project2.name)
    expect(page).to have_text(project3.name)
    expect(page).to have_text(project4.name)
    expect(page).to have_text(project5.name)
  end
end
