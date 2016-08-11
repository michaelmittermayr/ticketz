class FacebooksController < ApplicationController
  # GET /facebooks
  # GET /facebooks.xml
  APP_ID="1773057256267833"
  APP_SECRET="81ea4740c07202801a7749e0ffabb771"
  APP_CODE="XXXX"
  SITE_URL="http://localhost:3000/facebooks/"
  def index
    # if session['access_token']
    #   @face='You are logged in! <a href="facebooks/logout">Logout</a>'
    # else
    #   @face='<a href="facebooks/login">Login</a>'
    # end
  end

  def login
	# generate a new oauth object with your app data and your callback url
		session['oauth'] = Koala::Facebook::OAuth.new(APP_ID, APP_SECRET, SITE_URL + 'callback')
    #Koala::Facebook::OAuth.new(oauth_callback_url).

		# redirect to facebook to get your code
		redirect_to session['oauth'].url_for_oauth_code()

  end

  def logout
    session['oauth'] = nil
    session['access_token'] = nil
    redirect_to root_path
  end

	#method to handle the redirect from facebook back to you
	def callback
		#get the access token from facebook with your code
		session['access_token'] = session['oauth'].get_access_token(params[:code])
		redirect_to facebooks_menu_path
	end

  def menu
     @ok="Please enter your event of choice"
     # if session['access_token']
     #   @face='You are logged in! <a href="./logout">Logout</a>'     
     # else
     #   @face='<a href="/login">Login</a>'
     # end
  end

  def new
      event = params["event_url"].gsub(/[^\d]/, '')
      email = params["email"]
      ProcessSubscription.perform_async(event, email)
      EventListener.perform_async
  end
end
