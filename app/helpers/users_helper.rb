module UsersHelper
		def send_email(email)
			username = 'api'
			password = API_KEY
			url = "https://api.mailgun.net/v2/#{DOMAIN}/messages"

			params = {
			    :from => "Reminder App <postmaster@#{DOMAIN}>",
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
end
