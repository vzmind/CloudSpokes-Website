require "members"

class MembersController < ApplicationController

  def index
    @members = Members.all(:fields => "id,name,email__c")
  end
end
