describe 'Viewing an individual project' do
  before(:all) do
    @project = Project.create(project_attributes(
                                target_pledge_amount: 100.00))
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

  it 'shows the number of days remaining if the pledging end date is in the future' do
    project = Project.create(project_attributes(pledging_ends_on: 5.days.from_now))
    visit project_url(project)

    expect(page).to have_text('5 days remaining')
  end

  it "shows 'All Done!' if the pledging end date is in the past" do
    project = Project.create(project_attributes(pledging_ends_on: 3.days.ago))
    visit project_url(project)

    expect(page).to have_text('All Done!')
  end

  it 'shows the edit button on the project listing' do
    visit project_path(@project)

    expect(page).to have_text('Edit Project')
  end
end
