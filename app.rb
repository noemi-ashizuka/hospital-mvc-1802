require_relative "app/models/patient.rb"
require_relative "app/models/room.rb"
require_relative "app/repositories/patient_repository.rb"

csv_file = "data/patients.csv"

patient_repository = PatientRepository.new(csv_file)

# Patient.new({name: "Rayz", cured: false})
# Patient.new(name: "Rayz", cured: false)
rayz = Patient.new(name: "Rayz")
# miya = Patient.new(name: "Miya")
# ben = Patient.new(name: "Ben")
amy = Patient.new(name: "Amy")

patient_repository.create(rayz)
patient_repository.create(amy)

# p patient_repository
p rayz
p amy

# vip_room = Room.new(capacity: 2)
# big_room = Room.new(capacity: 8)

# vip_room.add_patient(rayz)
# vip_room.add_patient(miya)
# # vip_room.add_patient(ben)

# p vip_room.patients

# # rayz.room.patients.each do |patient|
# #   puts patient.name
# # end

# p miya.room.capacity

