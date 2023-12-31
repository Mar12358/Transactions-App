require 'rails_helper'

RSpec.describe Entity, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.create(name: 'Tomas', email: 'tomas@example.com', password: 'password')
      @category = Group.create(author: @user, name: 'Mc Donald\'s', icon: 'image_url')
      @transaction = Entity.create(author: @user, name: 'Burger', category: @category, amount: 3)
    end

    it 'name should be present' do
      expect(@transaction).to be_valid
      @transaction.name = nil
      expect(@transaction).to_not be_valid
    end

    it 'amount should be present' do
      expect(@transaction).to be_valid
      @transaction.amount = nil
      expect(@transaction).to_not be_valid
    end

    it 'name must be less or equal than 25 characters' do
      expect(@transaction).to be_valid
      @transaction.name = 'a' * 26
      expect(@transaction).to_not be_valid
      @transaction.name = 'a' * 25
      expect(@transaction).to be_valid
    end

    it 'amount must be integer or decimal greater or equal to zero' do
      expect(@transaction).to be_valid
      @transaction.amount = -2
      expect(@transaction).to_not be_valid
      @transaction.amount = 3
      expect(@transaction).to be_valid
    end

    it 'belongs to an user' do
      association = Entity.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a category' do
      association = Entity.reflect_on_association(:category)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
