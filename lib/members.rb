require 'cloud_spokes'
class Members < CloudSpokes

  def self.challenges(options = {:name => ""})
    request_url  = BASE_URL +  "members/" + options[:name] + "/challenges"
    get(request_url) 
  end

end

