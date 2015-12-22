describe 'Viewing the list of projects' do
  before(:all) do
    @project1 = Project.create(
      name: 'Music Video',
      description: 'Super aweome music video',
      target_pledge_amount: 30_000.00,
      website: 'http://www.music.video',
      pledging_ends_on: 20.days.from_now)
    @project2 = Project.create(
      name: 'Ultimate Hacking Keyboard',
      description: 'Mechanical switches for the hackers',
      target_pledge_amount: 200_000.00,
      website: 'https://www.crowdsupply.com/ugl/ultimate-hacking-keyboard',
      pledging_ends_on: 20.days.from_now)
    @project3 = Project.create(
      name: 'iPod Charging Dock',
      description: 'A high quiality iPod charging dock made from aircraft
                    aluminum and titanium, be ready for anything!',
      target_pledge_amount: 100_000.00,
      website: 'http://www.adock.com',
      pledging_ends_on: 3.days.ago)
  end

  after(:all) do
    [@project1, @project2, @project3].each(&:destroy)
  end

  it 'shows the number of projects' do
    visit projects_url

    # expect(page).to have_text("#{Project.count} Projects")
    expect(page).to have_text('3 Projects')
  end

  it 'shows the names' do
    visit projects_url

    expect(page).to have_text(@project1.name)
    expect(page).to have_text(@project2.name)
    expect(page).to have_text(@project3.name)
  end

  it 'shows the description truncated' do
    visit projects_url

    expect(page).to have_text(@project1.description[0..10])
    expect(page).to have_text(@project2.description[0..10])
    expect(page).to have_text(@project3.description[0..10])
  end

  it 'shows the target pledge amount in dollars' do
    visit projects_url

    expect(page).to have_text('$30,000.00')
    expect(page).to have_text('$200,000.00')
    expect(page).to have_text('$100,000.00')
  end

  it 'shows the website adderss' do
    visit projects_url

    expect(page).to have_text(@project1.website)
    expect(page).to have_text(@project2.website)
    expect(page).to have_text(@project3.website)
  end

  it 'shows the end date for pledging' do
    visit projects_url

    expect(page).to have_text(@project1.pledging_ends_on)
    expect(page).to have_text(@project2.pledging_ends_on)
    expect(page).to have_text(@project3.pledging_ends_on)
  end
end
