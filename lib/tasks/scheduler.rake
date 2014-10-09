desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
	puts "Sending sms..."
  	@todos = Todo.all #Get the todos based on the time of checking.  
  	#If todos.send_at is between Time.now and the past and not delivered.  

  	#If todos.delivered != true...    
  	@todos.each do |todo|
			id = todo.user_id 
			@user = User.find(id)
			mobile = @user.mobile
			description = todo.description
			Todo.test(mobile, description) #Do you really want to store in the Todo model?
			#Set todos.delivered == true
	end
end

