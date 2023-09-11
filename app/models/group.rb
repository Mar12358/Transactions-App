class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :category, class_name: 'Group', foreign_key: :category_id
  
  # Validate that the name and icon field is not blank
  validates :name, presence: true
  validates :icon, presence: true
end