class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    case resource.role
    when 'admin'
      admin_dashboard_path
    when 'therapist'
      therapist_dashboard_path
    else
      client_dashboard_path
    end
  end
end
