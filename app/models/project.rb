class Project < ActiveRecord::Base
  def expired?
    pledging_ends_on < Time.now
  end

  def to_param
    [id, name.parameterize].join('-')
  end
end
