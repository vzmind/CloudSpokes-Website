require "members"

class MembersController < ApplicationController

  DEFAULT_FIELDS = "id,name,email__c,profile_pic__c,summary_bio__c,challenges_entered__c,total_1st_place__c,total_2nd_place__c,total_3st_place__c"

  def index
    sort_by = params[:sort_by] || "name"
    @members = Members.all(:select => DEFAULT_FIELDS,:order_by => sort_by)
  end

  def show
    @member  = Members.all(:select => DEFAULT_FIELDS,:where => params[:id]).first
  end

  def search
    @members = Members.all(:select => DEFAULT_FIELDS, :where => params[:query])
    render :index
  end
end
