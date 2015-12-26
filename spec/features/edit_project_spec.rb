describe 'Editing a project' do

  before(:all) do
    @project = Project.create(project_attributes)
  end

  after(:all) do
    @project.destroy
  end

  it 'shows the editing form' do
    visit edit_project_url(@project)

    expect(find_field('Name').value).to eq(@project.name)
    expect(find_field('Description').value).to eq(@project.description)
    expect(find_field('Target pledge amount').value).to eq(@project.target_pledge_amount.to_s)
    expect(find_field('Website').value).to eq(@project.website)
    # expect(find_field('Pledging ends on').value).to eq(@project.pledging_ends_on)
  end

  it 'updates the project shows the updated details' do
    visit edit_project_url(@project)
    fill_in 'Name', with: 'Updated Project Title'
    click_button 'Update Project'

    expect(current_path).to eq(project_path(@project))
    expect(page).to have_text('Updated Project Title')
  end

end
