class RegistrationsController < Devise::RegistrationsController
  protected

  # def create
  #   super
  #   if resource.save
  #     Profile.create(user: resource)
  #   end
  # end

  def after_sign_up_path_for(resource)
    '/profiles/new' # Or :prefix_to_your_route
  end
end
