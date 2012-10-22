class AddColumnUserIdToAcademies < ActiveRecord::Migration
  def change
    add_column :academies, :user_id, :integer
  end
end
