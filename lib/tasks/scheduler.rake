desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
	puts "Sending sms..."
  	@todos = Todo.all #Get the todos based on the time of checking.  
  	#If todos.send_at is between Time.now and + 10 minutes.  

  	#If todos.delivered != true...    
  	@todos.each do |todo|
			id = todo.user_id 
			@user = User.find(id)
			mobile = @user.mobile
			description = todo.description
			Todo.test(mobile, description)
			#Set todos.delivered == true
	end

end

