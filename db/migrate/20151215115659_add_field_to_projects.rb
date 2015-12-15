class AddFieldToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :website, :string
    add_column :projects, :pledging_ends_on, :datmimitdate
  end
end
