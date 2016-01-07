class Pledge < ActiveRecord::Base
  AMOUNT_LEVELS = [25.00, 50.00, 100.00, 200.00, 500.00]

  validates :name, :email, presence: true
  validates :amount, inclusion: { in: AMOUNT_LEVELS }
  validates :email, format:
    {
      with: /([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})/i
    }

  belongs_to :project
end
