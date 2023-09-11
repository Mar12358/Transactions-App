class User < ApplicationRecord
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions, class_name: "Entity", foreign_key: :transaction_id
  has_many :categories, class_name: "Group", foreign_key: :category_id
  # Add the :name attribute

  # Validate that the name field is not blank
  validates :name, presence: true
end
