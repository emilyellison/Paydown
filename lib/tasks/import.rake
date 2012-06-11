require 'csv'

desc "Import institutions from csv file"
task :import_institutions => [:environment] do

  file = "Accreditation.csv"

  CSV.foreach(file, :headers => true) do |row|
    Institution.create({
      :institution_id => row[0],
      :name => row[1],
      :address => row[2],
      :city => row[3],
      :state => row[4],
      :zip => row[5],
      :phone => row[6]
    })
  end
end
