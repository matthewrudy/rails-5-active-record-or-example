class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.boolean :adult
      t.integer :age

      t.timestamps
    end
  end
end
