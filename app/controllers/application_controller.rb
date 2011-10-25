
class ApplicationController < ActionController::Base
  protect_from_forgery

  # initiliaze default fields for CloudSpokes API request
  DEFAULT_MEMBER_FIELDS         = "id,name,company__c,school__c,years_of_experience__c,work_status__c,shirt_size__c,age_range__c,gender__c,email__c,last_name__c,first_name__c,address_line1__c,address_line2__c,city__c,zip__c,state__c,phone_mobile__c,time_zone__c,profile_pic__c,country__c,summary_bio__c,quote__c,challenges_entered__c,total_money__c,website__c,twitter__c,linkedin__c,icq__c,jabber__c,github__c,facebook__c,digg__c,myspace__c,challenges_submitted__c,total_wins__c,total_points__c,total_1st_place__c,total_2nd_place__c,total_3st_place__c"
  DEFAULT_RECOMMENDATION_FIELDS = "id,name,createddate,recommendation__c,member__c"
  DEFAULT_CHALLENGE_FIELDS      = "id,name,createddate,description__c"

end
