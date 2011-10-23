require "members"
require "recommendations"
require "challenges"

class AccountsController < ApplicationController

  def show
    @account             = Members.find(params[:id])
    @challenges          = Members.challenges(:name => @account["Name"])

    @followed_challenges = []
    @active_challenges   = []
    @past_challenges     = []

    @challenges.each do |challenge|
      if challenge["End_Date__c"].to_date > Time.now.to_date
        @active_challenges << challenge
      else
        @past_challenges << challenge
      end
    end
  end

end
