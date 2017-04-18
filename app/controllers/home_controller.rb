class HomeController < ApplicationController
  def index
    @counts = Person.joins(:roles).group('roles.title').count
  end

  def search
    if request.post?
      found = finder.find_by!(params[:person].permit(:id))
      redirect_to people_path(id: found.id)
      return
    end
    @role = params[:role]
    @people = finder
  end

  private

  def finder
    Person
      .joins(:roles)
      .where(roles: { title: params[:role] })
      .order(:name)
  end
end
