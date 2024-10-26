class Room
  attr_reader :patients, :capacity
  attr_accessor :id

  class CapacityReachedError < StandardError; end

  def initialize(attributes = {})
    @id = attributes[:id]
    @capacity = attributes[:capacity] || 0 # integer
    @patients = attributes[:patients] || [] # an array pn patient instances
  end

  def full?
    @patients.size == @capacity
  end

  def add_patient(patient)
    raise CapacityReachedError, "Room is full" if full?
    patient.room = self
    @patients << patient
  end
end
