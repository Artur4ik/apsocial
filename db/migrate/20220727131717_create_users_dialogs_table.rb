class CreateUsersDialogsTable < ActiveRecord::Migration[7.0]
  def change
    create_table :dialogs_users, id: false do |t|
      t.belongs_to :user
      t.belongs_to :dialog
    end
  end
end
