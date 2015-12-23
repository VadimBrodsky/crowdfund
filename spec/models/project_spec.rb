describe 'A project' do
  it 'has expired if the pleding ends on date is in the past' do
    project = Project.new(pledging_ends_on: 5.days.ago)

    expect(project.ended?).to eq(true)
  end

  it 'has not expired if the pledging ends on date is in the future' do
    project = Project.new(pledging_ends_on: 3.days.from_now)

    expect(project.ended?).to eq(false)
  end
end
