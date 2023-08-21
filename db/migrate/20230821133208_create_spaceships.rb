class CreateSpaceships < ActiveRecord::Migration[7.0]
  def change

    create_table :spaceships do |t|
      t.string :name
      t.string :model
      t.text :description
      t.string :picture
      t.boolean :available
      t.integer :daily_rate
      t.references :users

      t.timestamps
    end
  end
end
