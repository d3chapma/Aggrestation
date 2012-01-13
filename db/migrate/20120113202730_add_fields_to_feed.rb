class AddFieldsToFeed < ActiveRecord::Migration
  def change 
    change_table :feeds do |t|
      t.string :etag
      t.datetime :last_modified
      t.string :last_entry_url      
    end
  end
end
