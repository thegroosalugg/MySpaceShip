class RecreateSpaceships < ActiveRecord::Migration[7.0]
  def change
    create_table :spaceships do |t|
      t.string :name
      t.string :model
      t.text :description
      t.string :picture_url
      t.boolean :available
      t.float :daily_rate
      t.references :user

      t.timestamps
    end
  end
end
