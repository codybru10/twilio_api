class User < ApplicationRecord
  has_many :messages
  has_many :contacts

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
