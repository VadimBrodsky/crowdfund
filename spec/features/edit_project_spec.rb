describe 'Editing a project' do

  before(:all) do
    @project = Project.create(project_attributes)
  end

  after(:all) do
    @project.destroy
  end

  it 'shows the editing form' do
    visit project_edit_url(@project)

    expect(find_field('Name').value).to eq(@project.name)
  end

  it 'updates the project'

  it "shows the project's updated details"
end
