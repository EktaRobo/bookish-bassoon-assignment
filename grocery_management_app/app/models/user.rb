class User < ApplicationRecord
    self.inheritance_column = :user_type

    validates :user_type, presence: true

    has_attached_file :dp, styles: { large: "600x600>", medium: "300x300>", thumb: "75x75#"}
    validates_attachment_content_type :dp, content_type: /\Aimage\/.*\z/

    scope :clients, -> { where(user_type: 'Client') }
    scope :grocers, -> { where(user_type: 'Grocer') }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  class << self
    def types
      %w(Client Grocer)
    end
  end
end
