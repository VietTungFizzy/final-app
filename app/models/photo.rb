class Photo < ApplicationRecord
	validate :name, presence: true, length: { maximum: 140 }
	validate :description, presence: true, length: { maximum: 300 }
	validate :sharing_mode, presence: true
	
	enum sharing_mode: [:public, :private]
	has_one_attached :image
end