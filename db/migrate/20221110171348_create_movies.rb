class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title
      t.text :summary
      t.integer :rating

      t.timestamps
    end
  end
end
