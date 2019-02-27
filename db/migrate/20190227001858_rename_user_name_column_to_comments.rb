class RenameUserNameColumnToComments < ActiveRecord::Migration[5.2]
  def change
    rename_column :comments, :user_name, :contributor_name
  end
end
