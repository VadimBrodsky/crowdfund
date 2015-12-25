describe 'Navigating projects' do
  before(:all) do
    @project = Project.create(project_attributes)
  end

  after(:all) do
    @project.destroy
  end

  it 'allows navigation from the detail page to the listing page' do
    visit project_url(@project)
    click_link 'All Projects'

    expect(current_url).to eq(projects_url)
  end

  it 'allows navigation from the listing page to the detail page' do
    visit projects_url
    click_link @project.name

    expect(current_url).to eq(project_url(@project))
  end

  it 'allows navigation from the detail page to the edit page' do
    visit project_url(@project)
    click_link 'Edit Project'

    expect(current_url).to eq(edit_project_url(@project))
  end
end
