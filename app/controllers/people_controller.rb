class PeopleController < ApplicationController
  before_action :find_person, except: :index

  private

  def find_person
    @person = Person.find(params[:id])
  end
end
