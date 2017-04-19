class HomeController < ApplicationController
  def index
    if current_user_id
      redirect_to people_path
      return
    end
    @counts = Person.joins(:roles).group('roles.title').count
  end

  def sign_in
    found = Person.find_by!(params[:person].permit(:email))
    session[:current_user_id] = found.id
    redirect_to people_path
  end

  def sign_out
    session.delete(:current_user_id)
    redirect_to action: 'index'
  end

  def search
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
