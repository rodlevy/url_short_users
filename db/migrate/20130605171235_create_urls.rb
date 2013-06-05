class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.references  :user
      t.string    :url
      t.string    :url_short
      t.integer   :click_count, :default => 0
      t.timestamps
    end
  end
end

