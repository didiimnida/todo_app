class Todo < ActiveRecord::Base
	belongs_to :user
	validates :description, presence: true

	def self.test(mobile, description)
		account_sid = ENV['ACCOUNT_SID']
		auth_token = ENV['AUTH_TOKEN']
		@client = Twilio::REST::Client.new account_sid, auth_token
		 
		message = @client.account.messages.create(:body => "#{description}",
		:to => "#{mobile}",    
		:from => "+18169120447")   
	end
end
