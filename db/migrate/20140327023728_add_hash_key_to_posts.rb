class AddHashKeyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :hash_key, :string, null: false
    add_index :posts, [:hash_key], unique: true
  end
end
