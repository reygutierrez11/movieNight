class CreateSuggestions < ActiveRecord::Migration[7.0]
  def change
    create_table :suggestions do |t|
      t.text :movie
      t.string :author

      t.timestamps
    end
  end
end
