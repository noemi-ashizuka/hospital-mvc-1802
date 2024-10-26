require "csv"

class PatientRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @patients = [] # patient instances
    load_csv if File.exist?(csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << %w(id name cured)
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |row|
      # #<CSV::Row id:"1" name:"rayz" cured:"false">
      # p row[:name]
      # hash[key] = new_value
      # manually convert all the key to have the actual data type we want
      row[:id] = row[:id].to_i

                    # "true" == "true" => boolean true
                    # "false" == "true" => boolean false
      row[:cured] = row[:cured] == "true"
      # p row[:room_id] = row[:room_id].to_i
      # using this id you have to find the room instance
      # talk to the room repository
      # have a way in the room repository to find an instance with an id @room_repository.find(row[:room_id])
      @patients << Patient.new(row)
    end
    @next_id = @patients.empty? ? 1 : @patients.last.id + 1
  end
end
