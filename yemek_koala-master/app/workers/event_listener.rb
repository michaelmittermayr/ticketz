require "koala"

class EventListener
  #include Sidekiq::Worker
  include SuckerPunch::Job

  def perform       
        @oauth = Koala::Facebook::OAuth.new("1773057256267833", "81ea4740c07202801a7749e0ffabb771")
        @oauth_token = @oauth.get_app_access_token
        @graph = Koala::Facebook::API.new(@oauth_token)
        
        # Start iteration
        while true do  
            Event.all.each do |event|
              posts = @graph.get_connections(event.id,"feed")
              @tickets = []

              posts.each do |post|
                next if post["message"].nil?
                url = "#{(20..100).to_a.sample}% - <a href='http://www.facebook.com/#{post["id"]}'>#{post["message"]}</a>"

                bid = {:link => url} if (post["message"].downcase.include?("€") || 
                    post["message"].include?("$") ||
                    post["message"].include?("usd") ||
                    post["message"].include?("sell") ||
                    post["message"].include?("offer") ||
                    post["message"].include?("verkaufe") ||
                    post["message"].include?("biete") ||
                    post["message"].include?("euro"))

                @tickets << bid if bid.present?
              end

              Event.find(event.id).subscriptions.where(status: true).each do |subscription|
                puts subscription.inspect
                ActionMailer::Base.mail(:content_type => 'text/html', :from => "kaisercoins@gmail.com", :to => subscription.user.email, :subject => "Ticket ALERT!", :body => @tickets.map{|x| "<br>" + x[:link].html_safe}).deliver_now if @tickets.present?
              end

            end
            sleep 60
        end
      #end
  end
end