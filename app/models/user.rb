class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :transactions, class_name: 'Entity', foreign_key: :author_id
  has_many :categories, class_name: 'Group', foreign_key: :author_id
  # Add the :name attribute

  # Validate that the name field is not blank
  validates :name, presence: true, length: { maximum: 30, too_long: '%<count>s characters is the maximum allowed' }

  enum role: {
    admin: 'admin',
    empty: ''
  }

  def admin?
    role == 'admin'
  end
end
