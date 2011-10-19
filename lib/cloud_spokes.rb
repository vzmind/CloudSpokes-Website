class CloudSpokes 

  include HTTParty 
  format :json

  AvailableObjects = ["challenges","members"]
  BASE_URL         = 'https://na12.salesforce.com/services/apexrest/v.9/'

    
  headers 'Content-Type' => 'application/json' 
  headers 'Authorization' => "OAuth #{ENV['access_token']}"

  def self.get_sobjects(options)
    if AvailableObjects.include?(self.to_s.downcase)
      request_url = BASE_URL + self.to_s.downcase + "?fields=" + options[:fields]
      get(request_url)
    end
  end

  def self.all(options = {:fields => "id,name"})
    get_sobjects(:fields => options[:fields])
  end
  
  AvailableObjects.each do |sobject|
    class_eval <<-EOS
      def self.get_#{sobject}
        request_url = BASE_URL + '#{sobject}'
        get(request_url)
      end
    EOS
  end

end
