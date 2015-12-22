describe 'Viewing an individual project' do
  before(:all) do
    @project = Project.create(
      name: 'Start-Up Project',
      description: 'A description of a start-up project',
      target_pledge_amount: 100.00,
      pledging_ends_on: 1.day.from_now,
      website: 'http://project-a.com')
  end

  after(:all) do
    @project.destroy
  end

  it 'shows the project name' do
    visit project_url(@project)

    expect(page).to have_text(@project.name)
  end

  it 'shows the project description' do
    visit project_url(@project)

    expect(page).to have_text(@project.description)
  end

  it 'shows the target pledge amount in dollard' do
    visit project_url(@project)

    expect(page).to have_text('$100.00')
  end

  it 'shows the project website' do
    visit project_url(@project)

    expect(page).to have_text(@project.website)
  end

  it 'shows the project end pledge date' do
    visit project_url(@project)

    expect(page).to have_text(@project.pledging_ends_on)
  end
end
