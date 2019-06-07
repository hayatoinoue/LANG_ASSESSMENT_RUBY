class ChangeCommentsContributorNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :comments, :contributor_name, false
  end
end
