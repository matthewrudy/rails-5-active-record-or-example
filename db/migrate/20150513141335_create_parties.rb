class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :party_type
      t.string :venue_type
      t.boolean :full
      t.integer :max_age

      t.timestamps
    end
  end
end
