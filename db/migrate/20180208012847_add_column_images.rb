class AddColumnImages < ActiveRecord::Migration[5.1]
  def change
    add_column :images, :S3, :boolean, :default => false
  end
end
