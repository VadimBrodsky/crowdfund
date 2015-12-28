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
    visit new_project_url

    fill_in 'Name'
  end
end
