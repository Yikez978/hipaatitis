# A person has a name  and email.
# Fake it unless you want to catch hipaatitis.
class Person < ApplicationRecord
  has_many :notes, as: :notable
  has_many :authored_notes, foreign_key: :author_id, class_name: 'Note'
  has_and_belongs_to_many :roles
  has_many :attendants
  has_many :appointments, through: :attendants

  def to_s
    "#{name} <#{email}>"
  end

  def role?(title)
    roles.detect { |role| title == role.title }
  end

  def role_title
    roles[0].try(:title)
  end
end
