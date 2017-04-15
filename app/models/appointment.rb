# Something to attend.
# Only needs a title at creation. Other attributes can be
# set later as details emerge.
class Appointment < ApplicationRecord
  has_many :attendants
  has_many :notes, as: :notable
end
