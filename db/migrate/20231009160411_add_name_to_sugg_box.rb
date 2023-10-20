class AddNameToSuggBox < ActiveRecord::Migration[7.0]
  def change
    add_column :sugg_boxes, :name, :string
  end
end
