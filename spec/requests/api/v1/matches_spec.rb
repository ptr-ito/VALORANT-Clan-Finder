require 'rails_helper'

RSpec.describe "非ログインユーザーのマッチ募集閲覧機能", type: :request do
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json' } }

  describe "非ログインユーザーが募集の投稿を閲覧できること" do
    let(:published_match_num) { 5 }
    let(:closed_match_num) { 5 }
    let(:http_request) { get api_v1_matches_path, headers: headers }
    before do
      binding.pry
      create_list(:match, published_match_num, :published)
      create_list(:match, closed_match_num, :closed)
    end

    it '非ログインユーザーが公開された募集投稿のみを閲覧できること' do
      http_request
      expect(body['data'].count).not_to eq(published_match_num + closed_match_num)
      expect(response).to be_successful
      expect(response).to have_http_status(:ok)
    end
  end
end
