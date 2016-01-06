describe 'A project' do
  it 'has expired if the pleding ends on date is in the past' do
    project = Project.create(pledging_ends_on: 5.days.ago)

    expect(project.ended?).to eq(true)
  end

  it 'has not expired if the pledging ends on date is in the future' do
    project = Project.create(pledging_ends_on: 3.days.from_now)

    expect(project.ended?).to eq(false)
  end

  it 'has expired if the pledging ends value is nil or balnk' do
    project = Project.create(pledging_ends_on: nil)

    expect(project.ended?).to eq(true)
  end

  it 'is expired when the pledging date is in the past' do
    project = Project.create(project_attributes(pledging_ends_on: 3.days.ago))

    expect(Project.active).not_to include(project)
  end

  it 'is active when the pledging date is in the future' do
    project = Project.create(project_attributes(pledging_ends_on: 3.days.from_now))

    expect(Project.active).to include(project)
  end

  it 'return the projects in the order of ending-first' do
    project1 = Project.create(project_attributes(pledging_ends_on: 9.days.from_now))
    project2 = Project.create(project_attributes(pledging_ends_on: 6.days.from_now))
    project3 = Project.create(project_attributes(pledging_ends_on: 3.days.from_now))

    expect(Project.active).to eq([project3, project2, project1])
  end

  it 'requires a name'

  it 'requires a description'

  it 'accepts a description up to 500 characters'

  it 'accepts a positive target pledge amount'

  it 'rejects a $0 target pledge amount'

  it 'rejects a negative target pledge amount'

  it 'accepts properly formatted website URLs'

  it 'rejects improperly formatted website URLs'

  it 'accepts properly formatted image file names'

  it 'rejects improperly formatted image file names'
end
