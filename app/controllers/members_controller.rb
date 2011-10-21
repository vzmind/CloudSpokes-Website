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
    @active_challenges = Challenges.all(:select => DEFAULT_CHALLENGE_FIELDS,:where => @member["Name"])
    @past_challenges   = Challenges.all(:select => DEFAULT_CHALLENGE_FIELDS,:where => @member["Name"])
  end

  def search
    @members = Members.all(:select => DEFAULT_MEMBER_FIELDS, :where => params[:query])
    render :index
  end
end
