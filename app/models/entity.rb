class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :transactions, class_name: 'Entity', foreign_key: :transaction_id

  # Validate that the name field is not blank
  validates :name, presence: true
end
