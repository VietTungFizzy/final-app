class Album < ApplicationRecord
	validates :title, presence: true, length: { maximum: 140 }
	validates :description, presence: true, length: { maximum: 300 }
	validates :sharing_mode, presence: true

	enum sharing_mode: {public_mode: 0, private_mode: 1}
	has_many :likes, as: :liked_on
	belongs_to :user
	has_many :photos, dependent: :destroy
	accepts_nested_attributes_for :photos
end



