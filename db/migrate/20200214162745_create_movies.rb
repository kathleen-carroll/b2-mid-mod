class CreateMovies < ActiveRecord::Migration[5.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :creation_year
      t.string :genre

      t.timestamps
    end
  end
end
