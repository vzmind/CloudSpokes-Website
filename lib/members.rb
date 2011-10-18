class Members 
  
  include HTTParty 
  format :json
  
  headers 'Content-Type' => 'application/json' 
  headers 'Authorization' => "OAuth #{ENV['access_token']}"

  def self.get_members()
    get('https://na12.salesforce.com/services/apexrest/v.9/members')
  end 
  
end

