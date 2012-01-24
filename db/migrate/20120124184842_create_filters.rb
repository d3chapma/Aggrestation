class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.references :feed
      t.references :keyword
      t.timestamps
    end
  end
end
