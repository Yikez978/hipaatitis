# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# create some roles
roles = [Role.create!(title: 'Doctor'), Role.create!(title: 'Patient')]

# create some people
people = YAML.load_file('db/names.yml').map do |name|
  Person.create!(name: name, email: "#{name.downcase}@hipaatitis.dataturd.com").tap do |t|
    t.roles << roles.sample
  end
end
# get some hipster text they're going to add to other people
hipsums = YAML.load_file('db/hipsum.yml').map do |text|
  lines = text.split('.')
  lines[0..rand(lines.size) / 2 + 1].join('.') + '.'
end
# each person is going to add a note to a few other people
people.each do |person|
  # get a sample of others, remove the same person just in case.
  others = people.sample(rand(4) + 1) - [person]
  others.each do |other|
    other.notes.create!(title: "Hey, #{other.name}!", body: hipsums.sample, author: person)
  end
end

doctors = Person.joins(:roles).where(roles: { title: 'Doctor' }).to_a
patients = Person.joins(:roles).where(roles: { title: 'Patient' }).to_a

procedures = YAML.load_file('db/procedures.yml').map(&:symbolize_keys)
# each person has an appointment for a procedure with some one else
doctors.each do |doctor|
  # up to 5 random appointments
  (rand(5) + 1).times do
    other = patients.sample
    procedure = procedures.sample
    appointment = Appointment.create!(procedure.merge(when: Time.current + rand(100).days))
    appointment.attendants.create!(person: doctor)
    appointment.attendants.create!(person: other)

    # add a note to each appointment
    appointment.notes.create!(title: "Please don't be late, #{other}", body: hipsums.sample, author: doctor)
  end
end

