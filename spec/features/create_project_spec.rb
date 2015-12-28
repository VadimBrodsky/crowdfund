describe 'Createing a project' do
  it 'shows the create a project form' do
    visit new_project_url

    expect(find_field('Name').value).to eq(@project.name)
    expect(find_field('Description').value).to eq('')
    expect(find_field('Target pledge amount').value).to eq('')
    expect(find_field('Website').value).to eq('')
    expect(find_field('project[pledging_ends_on(1i)]').value).to eq('')
    expect(find_field('project[pledging_ends_on(2i)]').value).to eq('')
    expect(find_field('project[pledging_ends_on(3i)]').value).to eq('')
  end

  it 'creates the project and shows it' do
    project = Project.create(project_attributes)
    visit new_project_url

    fill_in 'Name', with: project.name
    fill_in 'Description', with: project.description
    fill_in 'Target pledge amount', with: project.target_pledge_amount
    fill_in 'Website', with: poject.website

    click_button 'Create Project'

    expect(current_path).to eq(project_path)
    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
    expect(page).to have_text(project.target_pledge_amount)
  end
end