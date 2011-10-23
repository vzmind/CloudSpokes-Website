require "members"
require "recommendations"
require "challenges"

class MembersController < ApplicationController

  def index
    sort_by  = params[:sort_by] || "name"
    @members = Members.all(:select => DEFAULT_MEMBER_FIELDS,:order_by => sort_by)
  end

  def show
    @member            = Members.all(:select => DEFAULT_MEMBER_FIELDS,:where => params[:id]).first
    @recommendations   = Recommendations.all(:select => DEFAULT_RECOMMENDATION_FIELDS,:where => @member["Name"])
    @challenges        = Members.challenges(:name => @member["Name"])

    @active_challenges = []
    @past_challenges   = []
    @challenges.each do |challenge|
      if challenge["End_Date__c"].to_date > Time.now.to_date
        @active_challenges << challenge
      else
        @past_challenges << challenge
      end
    end
  end

  def search
    @members = Members.all(:select => DEFAULT_MEMBER_FIELDS, :where => params[:query])
    render :index
  end
end
