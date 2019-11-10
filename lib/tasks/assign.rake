require 'csv'

desc 'assign secret santas'
task :assign_secret_santas => [:environment] do |task, args|
  g = GiftsBuilder.new(people: Santa.all)
  g.call
end
