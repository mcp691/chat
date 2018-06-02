require 'rails_helper'

describe RoomsController, type: :controller do

  context 'GET #index' do
    it 'renders rooms page' do
      get :index
      expect(response).to be_ok
      expect(response).to render_template('index')
    end
  end

end
