class AddUseridToAttachments < ActiveRecord::Migration
  def change
    add_column :attachments, :user_id, :string
  end
end
