require "members"

class MembersController < ApplicationController

  def index
    @members = Members.get_members()
    # puts @challenges
  end
end
