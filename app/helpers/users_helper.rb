module UsersHelper

		def send_email(email)
			username = 'api'
			password = ENV['API_KEY']
			domain = ENV['DOMAIN']
			url = "https://api.mailgun.net/v2/#{domain}/messages"

			params = {
			    :from => "Reminder App <postmaster@#{domain}>",
			    :to => "#{email}",
			    :subject => "WELCOME!",
			    :text => "Welcome to the Reminder App!"
			}

			options = {
			    method: :post,
			    params: params,
			    userpwd: "#{username}:#{password}"
			}

			request = Typhoeus::Request.new(url, options)

			response = request.run()
		end 

		def send_sms(mobile)
			account_sid = ENV['ACCOUNT_SID']
			auth_token = ENV['AUTH_TOKEN']
			@client = Twilio::REST::Client.new account_sid, auth_token
	 
			message = @client.account.messages.create(:body => "Welcome to the Reminder App!",
			    :to => "#{mobile}",    
			    :from => "+18169120447")   
		end

		def send_voice(mobile)
			account_sid = ENV['ACCOUNT_SID']
			auth_token = ENV['AUTH_TOKEN']
			@client = Twilio::REST::Client.new account_sid, auth_token
 
			call = @client.account.calls.create(:url => "http://demo.twilio.com/docs/voice.xml",
    			:to => "#{mobile}",
    			:from => "+18169120447")
				puts call.to
		end

end
