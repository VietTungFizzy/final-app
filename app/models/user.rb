class User < ApplicationRecord
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    has_many :photos, dependent: :destroy
    has_many :albums, dependent: :destroy
    has_many :relationships, foreign_key: "follower_id", dependent: :destroy
    mount_uploader :avatar, ImageUploader
    enum role: [:user, :admin]
end
