# app/controllers/users/omniauth_callbacks_controller.rb:

class Authors::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def github
        # You need to implement the method below in your model (e.g. app/models/user.rb)
        @author = Author.from_omniauth(request.env['omniauth.auth'])
  
        if @author.persisted?
          flash[:notice] = I18n.t 'devise.omniauth_callbacks.success', kind: 'Github'
          sign_in_and_redirect @author, event: :authentication
        else
          session['devise.github_data'] = request.env['omniauth.auth'].except('extra') # Removing extra as it can overflow some session stores
          redirect_to new_user_registration_url, alert: @author.errors.full_messages.join("\n")
        end
    end
  end