
class AccountsController < ApplicationController
  before_filter :get_account

  def challenges
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
    if params["form_details"]
      Members.update(@account["Name"],params["form_details"])
    end
    @account = Members.find(params[:id])
  end

  def school
    if params["form_school"]
      Members.update(@account["Name"],params["form_school"])
    end
    @account = Members.find(params[:id])
  end

  def get_account
    @account = Members.find(params[:id])
  end
end
