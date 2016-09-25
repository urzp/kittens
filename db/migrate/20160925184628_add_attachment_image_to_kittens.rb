class AddAttachmentImageToKittens < ActiveRecord::Migration
  def self.up
    change_table :kittens do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :kittens, :image
  end
end
