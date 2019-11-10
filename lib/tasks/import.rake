require 'csv'

desc 'import santas from csv'
task :import, [:file_path] => [:environment] do |task, args|
  csv_text = File.read(args[:file_path])
  csv      = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    entry  = row.to_hash
    family = Family.find_or_create_by(name: entry['family'])
    Santa.create(name: entry['name'], email: entry['email'], family: family)
  end
end
