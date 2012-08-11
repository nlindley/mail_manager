class RenameTablesWithoutVirtual < ActiveRecord::Migration
  def up
    rename_table :virtual_users, :users
    rename_table :virtual_aliases, :aliases
    rename_table :virtual_domains, :domains
  end

  def down
    rename_table :users, :virtual_users
    rename_table :aliases, :virtual_aliases
    rename_table :domains, :virtual_domains
  end
end
