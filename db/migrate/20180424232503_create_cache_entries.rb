class CreateCacheEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :cache_entries do |t|
      t.string :query
      t.jsonb :response

      t.timestamps
    end
  end
end
