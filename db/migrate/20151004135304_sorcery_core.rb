class SorceryCore < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email,            :null => false
      t.string :crypted_password
      t.string :salt

      t.integer :failed_logins_count, default: 0
      t.datetime :lock_expires_at, default: nil
      t.string :unlock_token, default: nil

      t.timestamps
    end

    add_index :users, :email, unique: true
    add_index :users, :unlock_token
  end
end
