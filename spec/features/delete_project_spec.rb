describe 'Deleting a project' do
  before(:all) do
    @project = Project.create(project_attributes(name: 'Test Project'))
  end

  it 'shows the destroy button on the destory page' do
    visit project_path(@project)

    expect(page).to have_text('Delete Project')
    click_link('Delete Project')
  end

  it 'destroys the project and shows the project listing without the project' do
    visit project_path(@project)

    click_link('Delete Project')

    expect(current_url).to eq(projects_url)
    expect(page).not_to have_text(@project.name)
  end
end
