class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  enum gender: { man: 0, woman: 1}
  has_many :itineraries, dependent: :destroy
  has_many :records, dependent: :destroy
  has_many :genres, dependent: :destroy
  has_many :lists, dependent: :destroy
  has_many :plans, dependent: :destroy
  
  #has_many :shares, dependent: :destroy
  
#フォロー・フォロワー
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follower
  
  has_many :passive_relationships, class_name: 'Relationship', foreign_key: 'follower_id', dependent: :destroy # 追記1
  has_many :followers, through: :passive_relationships, source: :customer # 追記2
end