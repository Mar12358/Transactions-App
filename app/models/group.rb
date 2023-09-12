class Group < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :transactions, class_name: 'Entity', foreign_key: :category_id

  # Validate that the name and icon field is not blank
  validates :name, presence: true
  validates :icon, presence: true

  def total_amount
    total = 0
    transactions.each do |_t|
      total += transaction.amount.to_i
    end
    total
  end
end
