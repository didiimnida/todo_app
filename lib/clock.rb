require File.expand_path('../../config/boot',        __FILE__)
require File.expand_path('../../config/environment', __FILE__)
require 'clockwork'

include Clockwork

every(4.minutes, 'Queueing interval job') { Delayed::Job.enqueue IntervalJob.new }
every(1.day, 'Queueing scheduled job', :at => '12:10') { Delayed::Job.enqueue ScheduledJob.new }
