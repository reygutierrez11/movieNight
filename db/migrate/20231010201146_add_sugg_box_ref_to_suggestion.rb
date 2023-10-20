class AddSuggBoxRefToSuggestion < ActiveRecord::Migration[7.0]
  def change
    add_reference :suggestions, :sugg_box, null: false, foreign_key: true
  end
end
