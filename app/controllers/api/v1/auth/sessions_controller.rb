class Api::V1::Auth::SessionsController < DeviseTokenAuth::SessionsController
  #rubocop:disable all
  def create
    # Check
    field = (resource_params.keys.map(&:to_sym) & resource_class.authentication_keys).first

    @resource = nil
    if field
      q_value = get_case_insensitive_field_from_resource_params(field)

      @resource = find_resource(field, q_value)
    end

    if @resource && valid_params?(field,
                                  q_value) && (!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
      valid_password = @resource.valid_password?(resource_params[:password])
      if (@resource.respond_to?(:valid_for_authentication?) && !@resource.valid_for_authentication? do
            valid_password
          end) || !valid_password
        return render_create_error_bad_credentials
      end

      create_and_assign_token

      sign_in(:user, @resource, store: false, bypass: false)

      yield @resource if block_given?

      render_json = SessionsSerializer.new(@resource).serializable_hash.to_json
      render json: render_json, status: :ok

      # render_create_success
    elsif @resource && !(!@resource.respond_to?(:active_for_authentication?) || @resource.active_for_authentication?)
      if @resource.respond_to?(:locked_at) && @resource.locked_at
        render_create_error_account_locked
      else
        render_create_error_not_confirmed
      end
    else
      render_create_error_bad_credentials
    end
  end
end
