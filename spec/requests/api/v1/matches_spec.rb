require 'rails_helper'

RSpec.describe 'Api::V1::Matches', type: :request do
  let(:headers) { { CONTENT_TYPE: 'application/json', ACCEPT: 'application/json' } }

  describe "マッチ募集投稿一覧 GET /api/v1/matches" do
    let(:published_match_num) { 5 }
    let(:closed_match_num) { 5 }
    let(:http_request) { get api_v1_matches_path, headers: headers }
    before do
      create_list(:match, published_match_num, :published)
      create_list(:match, closed_match_num, :closed)
    end
    context '非ログインユーザー' do
      it '投稿一覧を閲覧できる' do
        http_request
        expect(body['data'].count).to eq(published_match_num + closed_match_num)
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe 'マッチ募集投稿詳細 GET /api/v1/mathes/:id' do
    let!(:match) { create(:match, :published) }
    let(:http_request) { get api_v1_match_path(match.id), headers: headers }
    context '非ログインユーザー' do
      it '投稿詳細を閲覧できる' do
        http_request
        expect(response).to be_successful
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
