class Project < ActiveRecord::Base
  def expired?
    pledging_ends_on < Time.now
  end
end
