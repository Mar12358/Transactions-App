class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Add the :name attribute
  attr_accessor :name

  # Validate that the name field is not blank
  validates :name, presence: true
end
