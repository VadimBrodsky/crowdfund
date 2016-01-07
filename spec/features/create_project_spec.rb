describe 'Createing a project' do
  it 'shows the create a project form' do
    visit new_project_url

    expect(find_field('Name').value).to eq(nil)
    expect(find_field('Description').value).to eq('')
    expect(find_field('Target pledge amount').value).to eq(nil)
    expect(find_field('Website').value).to eq(nil)
    expect(find_field('project[pledging_ends_on(1i)]').value).to eq(Time.now.year.to_s)
    expect(find_field('project[pledging_ends_on(2i)]').value).to eq(Time.now.month.to_s)
  end

  it 'creates the project and shows it' do
    project = Project.create(project_attributes)

    visit new_project_url

    fill_in 'Name', with: project.name
    fill_in 'Description', with: project.description
    fill_in 'Target pledge amount', with: project.target_pledge_amount
    fill_in 'Website', with: project.website

    fill_in 'Team members', with: 'The team members'
    fill_in 'Image file name', with: 'project.png'

    click_button 'Create Project'

    expect(current_path).to eq(project_path(Project.last))
    expect(page).to have_text(project.name)
    expect(page).to have_text(project.description)
  end

  it 'does not save the project if is\'s invalid' do
    visit new_project_url

    expect { click_button 'Create Project' }.not_to change(Project, :count)
    expect(page).to have_text('error')
  end
end
