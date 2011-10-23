require "members"
require "recommendations"
require "challenges"

class AccountsController < ApplicationController

  def challenges
    @account             = Members.find(params[:id])
    @challenges          = Members.challenges(:name => @account["Name"])

    @followed_challenges = []
    @active_challenges   = []
    @past_challenges     = []

    @challenges.each do |challenge|
      if challenge["End_Date__c"].to_date > Time.now.to_date
        if challenge['Challenge_Participants__r']['records'].first['Status__c'] == "Watching"
          @followed_challenges << challenge
        else
          @active_challenges << challenge
        end
      else
        @past_challenges << challenge
      end
    end
  end

  def details
    @account = Members.find(params[:id])
    if params["form_details"]
      Members.update(@account["Name"],params["form_details"])
    end
    @account = Members.find(params[:id])
  end

end
