class CreateVirtualUsers < ActiveRecord::Migration
  def change
    create_table :virtual_users do |t|
      t.integer :domain_id
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
