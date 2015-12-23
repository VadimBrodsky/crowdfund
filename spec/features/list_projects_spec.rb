describe 'Viewing the list of projects' do
  before(:all) do
    @project1 = Project.create(project_attributes(
                                 pledging_ends_on: 3.days.from_now,
                                 target_pledge_amount: 30_000.00))
    @project2 = Project.create(project_attributes(
                                 pledging_ends_on: 5.days.from_now,
                                 target_pledge_amount: 200_000.00))
    @project3 = Project.create(project_attributes(
                                 pledging_ends_on: 3.days.ago,
                                 target_pledge_amount: 100_000.00))
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

    expect(page).to have_text('3 days remaining')
    expect(page).to have_text('5 days remaining')
    expect(page).to have_text('All Done!')
  end
end
