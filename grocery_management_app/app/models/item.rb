class Item < ApplicationRecord
  belongs_to :grocer
  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "75x75#"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
