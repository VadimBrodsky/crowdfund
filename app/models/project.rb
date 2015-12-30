class Project < ActiveRecord::Base
  def ended?
    pledging_ends_on.blank? || pledging_ends_on < Time.now
  end

  def self.active
    where('pledging_ends_on >= ?', Time.now)
      .order(pledging_ends_on: :asc).order(target_pledge_amount: :desc)
  end
end
