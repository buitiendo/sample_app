class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.boolean :gender
      t.datetime :dob
      t.boolean :role
      t.text :description
      t.string :email
      t.references :city, foreign_key: true

      t.timestamps
    end
  end
end
