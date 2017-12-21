class AttractionPolicy < ApplicationPolicy

  #only where user.admin is true (users are admins) can they do the following
  #edit attractions (link to edit from attraction show page)
  #updates attraction
  #add attraction (from index page)
  #admins DO NOT GO ON RIDES
  #special link "Show attraction.name" from attraction index page

  def new?
    user.admin?
  end

  def update?
    user.admin?
  end

  def ride? #returns true if user is an admin
    user.admin?
  end

  def create?
    user.admin?
  end

end
