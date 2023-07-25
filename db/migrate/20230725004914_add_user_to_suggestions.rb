class AddUserToSuggestions < ActiveRecord::Migration[7.0]
  def change
    add_column :suggestions, :user, :string
  end
end
