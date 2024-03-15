class CreateArrets < ActiveRecord::Migration[7.0]
  def change
    create_table :arrets do |t|
      t.string :name
      t.integer :year
      t.text :apport

      t.timestamps
    end
  end
end
