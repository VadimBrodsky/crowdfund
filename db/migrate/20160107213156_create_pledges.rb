class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :name
      t.string :email
      t.decimal :amount
      t.text :comment
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
