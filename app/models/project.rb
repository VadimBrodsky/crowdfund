class Project < ActiveRecord::Base
  def ended?
    pledging_ends_on.blank? || pledging_ends_on < Time.now
  end
end
