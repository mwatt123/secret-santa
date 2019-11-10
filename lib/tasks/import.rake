require 'csv'

desc 'import santas from csv'
task :import_santas => [:environment] do |task, args|
  csv_text = File.read(Rails.root.join('public/files/santas.csv'))
  csv      = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    entry  = row.to_hash
    family = Family.find_or_create_by(name: entry['family'])
    santa  = Santa.create(name: entry['name'], email: entry['email'], family: family)
    puts "created santa: #{santa.name}"
  end
end
