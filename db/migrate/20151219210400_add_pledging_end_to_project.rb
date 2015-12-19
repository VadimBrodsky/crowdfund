class AddPledgingEndToProject < ActiveRecord::Migration
  def change
    add_column :projects, :pledging_ends_on, :datetime
  end
end
