desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
	puts "Sending SMS..." 
	@todos = Todo.where(["delivered = ? and send_at < ?", "false", Time.now]) #Get all undelivered before right now.
	
	#Time.now is local on my computer.  It is UTC on Heroku.
	#Need to change the time the user sees in view to their time zone.    
  	#puts Time.now
 
  	@todos.each do |todo|
			id = todo.user_id 
			@user = User.find(id)
			mobile = @user.mobile
			description = todo.description
			Todo.test(mobile, description)
			todo.delivered = true
			todo.save
			puts "Sent SMS."
	end
end