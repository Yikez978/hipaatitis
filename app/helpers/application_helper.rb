module ApplicationHelper

  def select_people(people)
    collection_select(:person, :id, people, :id, :to_s, {}, class: 'form-control')
  end

  def select_people_sign_in(people)
    collection_select(:person, :email, people, :email, :to_s, {}, class: 'form-control')
  end

  def attendant_links(owner, appointment)
    appointment.attendants
      .reject { |r| r.person == owner }
      .map { |attendant| link_to(attendant.person.to_s, people_path(id: attendant.person_id)) }
      .join(',').html_safe + ' and you'.html_safe
  end

  def link_to_appointment(appointment, **html)
    link_to(appointment.when.strftime("#{appointment.title} @ %-I:%m %p"), appointment_path(appointment), **html)
  end
end
