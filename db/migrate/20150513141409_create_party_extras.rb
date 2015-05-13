class CreatePartyExtras < ActiveRecord::Migration
  def change
    create_table :party_extras do |t|
      t.references :party, index: { unique: true }, foreign_key: true
      t.string :music_type

      t.timestamps
    end
  end
end
