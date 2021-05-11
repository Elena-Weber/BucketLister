class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :username
      t.string :email
      t.string :location
      t.string :password_digest
      t.string :provider
      t.string :uid

      t.timestamps
    end
  end
end
