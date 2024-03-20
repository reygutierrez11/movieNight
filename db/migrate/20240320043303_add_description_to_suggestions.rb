class AddDescriptionToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :description, :text
  end
end
