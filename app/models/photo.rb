class Photo < ApplicationRecord
	enum sharing_mode: [:public, :private]
	has_and_belongs_to_many :albums
end
