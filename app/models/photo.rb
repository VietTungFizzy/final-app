class Photo < ApplicationRecord
	enum sharing_mode: {public_mode: 0, private_mode: 1}
	has_many :likes, as: :liked_on
	belongs_to :user
	belongs_to :album
	mount_uploader :image, ImageUploader

	validates :title, presence: true, length: { maximum: 140 }
	validates :description, presence: true, length: { maximum: 300 }
	validates :sharing_mode, presence: true
	validates :image, presence: true ,file_size: { less_than: 5.megabytes }
end
