class CreateVirtualAliases < ActiveRecord::Migration
  def change
    create_table :virtual_aliases do |t|
      t.string :source
      t.string :destination
      t.integer :domain_id

      t.timestamps
    end
  end
end
