describe 'Creating a new pledge' do
  it 'save the pledge if its valid' do
    project = Project.create(project_attributes)

    visit project_url(project)
    click_link 'Pledge!'
    expect(current_url).to eq(new_project_pledge_url(project))

    fill_in 'Name', with: 'Scrooge McDuck'
    fill_in 'Email', with: 'scrooge@mcduck.com'
    select '100.00', from: 'pledge_amount'
    fill_in 'Comment', with: 'No man is poor who can do what he likes to do once in a while!'
    click_link 'Create Pledge'

    expect(current_url).to eq(project_pledges_url(project))
    expect(page).to have_text('Scrooge McDuck')
    expect(page).to have_text('$100.00')
    expect(page).to have_text('Thanks for Pledging!')
  end

  it 'does not save the pledge if its invalid' do
    project = Project.create(project_attributes)

    visit new_project_pledge_url(project)

    expect { click_button 'Create Pledge' }.not_to change(Pledge, :count)
    expect(page).to have_text('error')
  end
end
