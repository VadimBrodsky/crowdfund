class Project < ActiveRecord::Base

  validates :name, :description, presence: true
  validates :description, length: { maximum: 500 }
  validates :target_pledge_amount, numericality: { greater_than: 0 }
  validates :website, allow_blank: true, format:
    {
      with: /htt(p|ps)(:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})/i,
      message: 'must be valid'
    }
  validates :image_file_name, allow_blank: true, format:
    {
      with: /\w+\.(gif|jpg|png)\z/i,
      message: 'must reference a GIF, JPG, or PNG image'
    }

  has_many :pledges, dependent: :destroy

  def self.active
    where('pledging_ends_on >= ?', Time.now)
      .order(pledging_ends_on: :asc).order(target_pledge_amount: :desc)
  end

  def ended?
    pledging_ends_on.blank? || pledging_ends_on < Time.now
  end

  def total_amount_pledged
    pledges.sum(:amount)
  end

  def amount_outstanding
    target_pledge_amount - total_amount_pledged
  end

  def funded?
    target_pledge_amount <= total_amount_pledged
  end
end
