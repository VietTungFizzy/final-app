class Album < ApplicationRecord
	validate :name, presence: true, length: { maximum: 140 }
	validate :description, presence: true, length: { maximum: 300 }
	validate :sharing_mode, presence: true

	enum sharing_mode: [:public, :private]
	has_many :likes, as: :liked_on
	belongs_to :user
	has_many_attached :images
end
