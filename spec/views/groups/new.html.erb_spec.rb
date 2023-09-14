require 'rails_helper'

RSpec.describe 'groups/new.html.erb', type: :view do
  before do
    assign(:category, Group.new)
    render
  end

  it 'displays the Create Category form' do
    expect(rendered).to have_selector('h1', text: 'Add new Category')
  end
end
