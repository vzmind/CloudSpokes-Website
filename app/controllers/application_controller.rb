class ApplicationController < ActionController::Base
  protect_from_forgery

  # initiliaze default fields for CloudSpokes API request
  DEFAULT_MEMBER_FIELDS = "id,name,email__c,profile_pic__c,summary_bio__c,challenges_entered__c,total_1st_place__c,total_2nd_place__c,total_3st_place__c"
  DEFAULT_RECOMMENDATION_FIELDS = "id,name,createddate,recommendation__c"
  DEFAULT_CHALLENGE_FIELDS = "id,name,createddate,description__c"

end
