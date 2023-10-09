class CreateSuggBoxes < ActiveRecord::Migration[7.0]
  def change
    create_table :sugg_boxes do |t|

      t.timestamps
    end
  end
end
