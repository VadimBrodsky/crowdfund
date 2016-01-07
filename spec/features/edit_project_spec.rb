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
    expect(find_field('project[pledging_ends_on(1i)]').value).to eq(@project.pledging_ends_on.year.to_s)
    expect(find_field('project[pledging_ends_on(2i)]').value).to eq(@project.pledging_ends_on.month.to_s)
    expect(find_field('project[pledging_ends_on(3i)]').value).to eq(@project.pledging_ends_on.day.to_s)
  end

  it 'updates the project shows the updated details' do
    visit edit_project_url(@project)
    fill_in 'Name', with: 'Updated Project Title'
    click_button 'Update Project'

    expect(current_path).to eq(project_path(@project))
    expect(page).to have_text('Updated Project Title')
    expect(page).to have_text('Project Successfully Updated!')
  end

  it 'does not update the project if it\'s invalid' do
    project = Project.create(project_attributes)

    visit edit_project_url(project)
    fill_in 'Name', with: ' '
    click_button 'Update Project'

    expect(page).to have_text('error')
  end
end
