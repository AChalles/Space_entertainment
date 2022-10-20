class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :name
      t.string :gender
      t.string :birth_place
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
