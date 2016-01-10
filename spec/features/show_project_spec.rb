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

  it 'shows the project team members' do
    visit project_path(@project)

    expect(page).to have_text(@project.team_members)
  end

  it 'shows the project image' do
    visit project_path(@project)

    expect(page).to have_selector("img[src$='#{@project.image_file_name}']")
  end

  it 'shows the amount outstanding with a pledge link if the project is not funded' do
    @project.pledges.create!(pledge_attributes(amount: 25.00))
    visit project_path(@project)

    expect(page).to have_link('Pledge!')
    expect(page).to have_link('Only $75.00 left!')
    expect(page).not_to have_text('Funded!')
  end

  it "shows 'Funded' without a pledge link if the project is funded" do
    @project.pledges.create!(pledge_attributes(amount: 200.00))
    visit project_path(@project)

    expect(page).to have_text('Funded')
    expect(page).not_to have_text('Pledge!')
  end
end
