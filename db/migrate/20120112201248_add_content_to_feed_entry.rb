class AddContentToFeedEntry < ActiveRecord::Migration
  def change
    change_table :feed_entries do |t|
      t.text :content      
    end
  end
end
