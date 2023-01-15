module Users::RegistrationsConcern
  extend ActiveSupport::Concern

  protected

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name email password password_confirmation])
  end

  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update,
                                      keys: [:email, :password, :password_confirmation, :name, :image,
                                               :self_introduction, :rank_id, :twitter_name, :youtube_url, :started_on_val, :ingame_name, agent_ids: []])
  end
end
