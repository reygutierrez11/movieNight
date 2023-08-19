class AddMovieIdToReviews < ActiveRecord::Migration[7.0]
  def change
    add_column :reviews, :movie_id, :bigint
    add_index :reviews, :movie_id
  end
end
