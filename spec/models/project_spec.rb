describe 'A project' do
  it 'has expired if the pledging ends on date is in the past' do
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

  it 'requires a name' do
    project = Project.new(name: '')
    project.valid?
    expect(project.errors[:name].any?).to eq(true)
  end

  it 'requires a description' do
    project = Project.new(description: '')
    project.valid?
    expect(project.errors[:description].any?).to eq(true)
  end

  it 'accepts a description up to 500 characters' do
    long_description = 'x' * 501
    project = Project.new(description: long_description)
    project.valid?
    expect(project.errors[:description].any?).to eq(true)
  end

  it 'accepts a positive target pledge amount' do
    target_pledge_amounts = [100.00, 200_000_000, 12, '1000']
    target_pledge_amounts.each do |amount|
      project = Project.new(target_pledge_amount: amount)
      project.valid?
      expect(project.errors[:target_pledge_amount].any?).to eq(false)
    end
  end

  it 'rejects a $0 target pledge amount' do
    project = Project.new(target_pledge_amount: 0)
    project.valid?
    expect(project.errors[:target_pledge_amount].any?).to eq(true)
  end

  it 'rejects a negative target pledge amount' do
    project = Project.new(target_pledge_amount: -100)
    project.valid?
    expect(project.errors[:target_pledge_amount].any?).to eq(true)
  end

  it 'accepts properly formatted website URLs' do
    urls = %w(http://www.example.com http://WEBSITE.CA http://awesome.webpage.co.il https://ex.ca)
    urls.each do |url|
      project = Project.new(website: url)
      project.valid?
      expect(project.errors[:website].any?).to eq(false)
    end
  end

  it 'rejects improperly formatted website URLs' do
    urls = %w(www.website.com http://nospaces illegal,marks examplehttp)
    urls.each do |url|
      project = Project.new(website: url)
      project.valid?
      expect(project.errors[:website].any?).to eq(true)
    end
  end

  it 'accepts properly formatted image file names' do
    files = %w(file.jpg image.png PICTURE.PNG e.gif EVENT.GIF)
    files.each do |img|
      project = Project.new(image_file_name: img)
      project.valid?
      expect(project.errors[:image_file_name].any?).to eq(false)
    end
  end

  it 'rejects improperly formatted image file names' do
    files = %w(event .jpg .png .gif event.pdf event.doc)
    files.each do |file|
      project = Project.new(image_file_name: file)
      project.valid?
      expect(project.errors[:image_file_name].any?).to eq(true)
    end
  end

  it 'has many pledges' do
    project = Project.create(project_attributes)

    pledge1 = project.pledges.new(pledge_attributes)
    pledge2 = project.pledges.new(pledge_attributes)

    expect(project.pledges).to include(pledge1)
    expect(project.pledges).to include(pledge2)
  end

  it 'deletes associated pledges' do
    project = Project.create(project_attributes)
    project.pledges.create(pledge_attributes)
    expect { project.destroy }.to change(Pledge, :count).by(-1)
  end

  it 'calculates the total amount pledged as the sum of all pledges' do
    project = Project.create(project_attributes)
    project.pledges.create(pledge_attributes(amount: 25.00))
    project.pledges.create(pledge_attributes(amount: 25.00))

    expect(project.total_amount_pledged).to eq(50.00)
  end

  it 'calculates the pledge amount outstanding' do
    project = Project.create(project_attributes(target_pledge_amount: 30.00))
    project.pledges.create(pledge_attributes(amount: 25.00))

    expect(project.amount_outstanding).to eq(5.00)
  end

  it 'is funded if the target pledge amount has been reached' do
    project = Project.create(project_attributes(target_pledge_amount: 30.00))
    project.pledges.create(pledge_attributes(amount: 30.01))

    puts project.amount_outstanding.to_s
    expect(project.funded?).to eq(true)
  end

  it 'is not funded if the target pledge amount has not been reached' do
    project = Project.create(project_attributes(target_pledge_amount: 30.00))
    project.pledges.create(pledge_attributes(amount: 29.00))

    expect(project.funded?).to eq(false)
  end
end
