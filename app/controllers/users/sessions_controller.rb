# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #  super
  # end

  #
  # def new
  #     self.resource = resource_class.new(sign_in_params)
  #     clean_up_passwords(resource)
  #     yield resource if block_given?
  #     respond_with(resource, serialize_options(resource))
  #   end

  # POST /resource/sign_in
  # def sign_in
  #  super
  # end

  #
  #   def create
  #     self.resource = warden.authenticate!(auth_options)
  #     set_flash_message!(:notice, :signed_in)
  #     sign_in(resource_name, resource)
  #     yield resource if block_given?
  #     respond_with resource, location: after_sign_in_path_for(resource)
  #   end

  # POST /resource/sign_in
  #    def create
  #     self.resource = warden.authenticate!(auth_options)
  #
  #     if resource
  #       set_flash_message!(:notice, :signed_in)
  #       sign_in(resource_name, resource)
  #       yield resource if block_given?
  #       respond_with resource, location: after_sign_in_path_for(resource)
  #     else
  #       self.resource = resource_class.new(sign_in_params)
  #       clean_up_passwords(resource)
  #       set_flash_message!(:alert, :invalid)
  #       # flash.now[:alert] = 'Invalid email or password.'
  #       render action: 'new', status: :unprocessable_entity
  #     end
  #   end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  # def after_sign_in_path_for(_resource)
  #  root_path
  # end
end
