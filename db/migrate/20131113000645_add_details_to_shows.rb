class AddDetailsToShows < ActiveRecord::Migration
  def change
    add_column :shows, :episode_duration, :string
    add_column :shows, :genre, :string
    add_column :shows, :started_year, :integer
  end
end
