require "members"
require "recommendations"
require "challenges"
require 'will_paginate/array'

class MembersController < ApplicationController

  def index
    order_by  = params[:order_by] || "name"
    @members = Members.all(:select => DEFAULT_MEMBER_FIELDS,:order_by => order_by)
    if params[:order_by] == "total_wins__c" or params[:order_by] == "challenges_entered__c"
      @members = @members.reverse
    end
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

  def past_challenges
    @member = Members.find(params[:id])
    @challenges = Members.challenges(:name => @member["Name"]).select{|c| c["End_Date__c"].to_date < Time.now.to_date}
    @challenges = @challenges.paginate(:page => params[:page] || 1, :per_page => 1) 
    render 'challenges'
  end

  def active_challenges
    @member = Members.find(params[:id])
    @challenges = Members.challenges(:name => @member["Name"]).select{|c| c["End_Date__c"].to_date > Time.now.to_date}
    @challenges = @challenges.paginate(:page => params[:page] || 1, :per_page => 1) 
    render 'challenges'
  end
end
