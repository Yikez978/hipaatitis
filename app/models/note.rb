# Attach notes to anything via notable.
# A note must have a writer
class Note < ApplicationRecord
  belongs_to :notable, polymorphic: true
  belongs_to :author, class_name: 'Person'
end
