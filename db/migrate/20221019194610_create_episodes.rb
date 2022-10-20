class CreateEpisodes < ActiveRecord::Migration[7.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.date :air_date
      t.string :episode_number
      t.references :show, null: false, foreign_key: true

      t.timestamps
    end
  end
end
