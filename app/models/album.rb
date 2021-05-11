class Album < ApplicationRecord
	enum sharing_mode: [:public, :private]
	has_and_belongs_to_many :photos
end
