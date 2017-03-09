class AddAttachmentDpToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :dp
    end
  end

  def self.down
    remove_attachment :users, :dp
  end
end
