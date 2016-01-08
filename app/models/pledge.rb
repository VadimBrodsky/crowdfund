class Pledge < ActiveRecord::Base
  AMOUNT_LEVELS = [25.00, 50.00, 100.00, 200.00, 500.00]

  validates :name, :email, presence: true
  validates :amount, inclusion: { in: AMOUNT_LEVELS }
  validates :email, format:
    {
      with: /\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b/i
    }

  belongs_to :project
end
