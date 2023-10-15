class CreateFish < ActiveRecord::Migration[7.0]
  def change
    create_table :fish do |t|
      t.string :species
      t.float :weight
      t.float :length
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
