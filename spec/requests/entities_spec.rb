require 'rails_helper'

RSpec.describe 'Entities', type: :request do
  describe EntitiesController do
    before(:each) do
      @user = User.create(name: 'Tomas', email: 'tomas@example.com', password: 'password')
      @category = Group.create(author: @user, name: 'Mc Donald\'s', icon: "image_url")
      @transaction = Entity.create(author: @user, name: 'Burger', category: @category)
      current_user = @user
    end

    describe 'GET #index' do
      before do
        get group_entities_path(@category)
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Transactions')
      end
    end
  
    describe 'GET #new' do
      before do
        get new_group_entity_path(@category)
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Add new Transaction')
      end
    end


  end
end
