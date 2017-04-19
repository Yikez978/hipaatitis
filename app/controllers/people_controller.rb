class PeopleController < ApplicationController
  before_action :find_person, except: :index

  def show
    @month = (params[:month] ? Date.parse(params[:month]) : Date.current).beginning_of_month
  end

  private

  def find_person
    @person = Person.find(params[:id] || current_user_id)
  end
end
