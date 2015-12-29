describe 'Deleting a project' do
  before(:all) do
    @project = Project.create(project_attributes)
  end

  it 'shows the destroy button on the destory page' do
    visit project_path(@project)

    expect(page).to have_text('Delete')
    click_link('Delete')
  end

  it 'destroys the project and shows the project listing without the project' do
    visit project_path(@project)

    click_link('Delete')

    expect(current_url).to eq(projects_url)
    expect(page).not_to have_text(@project.name)
  end
end
