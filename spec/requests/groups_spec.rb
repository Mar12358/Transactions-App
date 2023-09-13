require 'rails_helper'

RSpec.describe 'Groups', type: :request do
  describe GroupsController do
    before(:each) do
      @user = User.create(name: 'Tomas', email: 'tomas@example.com', password: 'password')
      @category = Group.create(author: @user, name: 'Mc Donald\'s', icon: "image_url")
      @transaction = Entity.create(author: @user, name: 'Burger', category: @category)
      sign_in @user
    end

    describe 'GET #index' do
      before do
        get groups_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the index template' do
        expect(response).to render_template(:index)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Categories')
      end
    end
  
    describe 'GET #new' do
      before do
        get new_group_path
      end

      it 'renders a successful response' do
        expect(response).to be_successful
      end

      it 'renders the new template' do
        expect(response).to render_template(:new)
      end

      it 'response body includes the right placeholders' do
        expect(response.body).to include('Add new Category')
      end
    end


  end
end
