require "members"

class MembersController < ApplicationController

  def index
    @members = Members.all(:fields => "id,name,email__c,profile_pic__c,summary_bio__c,challenges_entered__c,total_1st_place__c,total_2nd_place__c,total_3st_place__c")
  end
end
