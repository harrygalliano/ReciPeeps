require 'rails_helper'

RSpec.describe OcrController, type: :controller do

  xdescribe "POST #create" do
    it "returns http success" do
      post :create
      expect(response).to have_http_status(:success)
    end
  end
end
