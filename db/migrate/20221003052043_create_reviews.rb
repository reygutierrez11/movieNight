class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.string :author
      t.text :body

      t.timestamps
    end
  end
end
