class ProPublica
  require 'net/http'
  require 'json'

  attr_accessor :key
  
   def self.about
      puts "Hello! This is a Ruby wrapper for the ProPublica API."
      puts "Please get started by entering your API KEY with ProPublica.config(YOUR_API_KEY)."
      puts "Then try out the function .get_members_data_from_API(congress, chamber) where congress = 115, e.g., and chamber = 'senate'"
   end

   def self.config(key)
     @key = key
   end

   def get_members_data_from_API(congress, chamber)

     if @key != nil

      uri = URI.parse("https://api.propublica.org/congress/v1/#{congress}/#{chamber}/members.json")

      request = Net::HTTP::Get.new(uri)
      request["X-Api-Key"] = ENV['API_KEY']
      req_options = {
        use_ssl: uri.scheme == "https",
      }

      response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
        http.request(request)
      end

      return response

    else
      return "Please configure your API key."
    end

  end
end
