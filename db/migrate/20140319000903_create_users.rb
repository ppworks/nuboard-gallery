class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string   :email
      t.string   :name
      t.string   :image
      t.integer  :default_provider_id
      t.string   :unconfirmed_email
      t.datetime :confirm_limit_at
      t.string   :hash_to_confirm_email
      t.string   :locale
      t.text     :content
      t.datetime :remember_created_at
      t.integer  :sign_in_count,          default: 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip
      t.datetime :created_at
      t.datetime :updated_at
      t.string   :email_key

      t.timestamps
    end
    add_index :users, [:email], name: :index_users_on_email, unique: true
    add_index :users, [:email_key], name: :index_users_on_email_key, unique: true
  end
end
