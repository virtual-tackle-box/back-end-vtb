class DropActiveStorage < ActiveRecord::Migration[7.0]
  def up
    execute "DROP TABLE IF EXISTS active_storage_attachments CASCADE;"
    execute "DROP TABLE IF EXISTS active_storage_blobs CASCADE;"
    execute "DROP TABLE IF EXISTS active_storage_variant_records CASCADE;"
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end