class Attendant < ApplicationRecord
  belongs_to :appointment
  belongs_to :person
end
