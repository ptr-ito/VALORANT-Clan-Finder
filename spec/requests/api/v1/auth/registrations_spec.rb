require 'rails_helper'

RSpec.describe "Api::V1::Auth::Registrations", type: :request do

  describe 'POST #create' do
    let!(:user_attributes) { attributes_for(:user) }
    context '数値が正常に入力された場合' do
      it '作成・メールが送信される' do
        expect do
          before_count = ActionMailer::Base.deliveries.count
          post api_v1_user_registration_path, request_hash
          expect(ActionMailer::Base.deliveries.count).to eq(before_count + 1) # メールアドレス確認のお願い

          after_user = User.find_by(email: new_user[:email])
          expect(after_user).not_to be_nil
          expect(after_user.name).to eq(new_user[:name])
        end.to change(User, :count).by(1)
      end
    end
  end
end
