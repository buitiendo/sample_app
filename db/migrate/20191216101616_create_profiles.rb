class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :address
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
