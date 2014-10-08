desc "This task is called by the Heroku scheduler add-on"

task :send_reminders => :environment do
  #@todos = Todo.all #Get all todos...
  # @todos = Todo.where('send_at between ? and ?', Date.)
  # @todos = Todo.send_reminders
  puts "Sending reminder..."
end