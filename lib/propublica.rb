class ProPublica
  require 'net/http'
  require 'json'

  attr_accessor :api_key

    def initialize(api_key)
     @api_key = api_key
    end

   def about
      puts "Hello! This is a Ruby wrapper for the ProPublica API.\n" +
           " Please get started by entering your API KEY in a new ProPublica instance creation (e.g., client = ProPublica.new(YOUR_KEY_HERE))\n" +
           "Good luck, citizen!"
   end

   def config(api_key)
     @api_key = api_key
   end

   def get_response_from_API(congress, chamber)

     if @api_key != nil
        uri = URI.parse("https://api.propublica.org/congress/v1/#{congress}/#{chamber}/members.json")

        request = Net::HTTP::Get.new(uri)
        request["X-Api-Key"] = @api_key
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

    def get_senate_members(house_number)
      # Returns an array of senate member objects.
      if @api_key != nil
        raw_senate_members_data = JSON.parse(self.get_response_from_API(house_number,"senate").body)
        senate_members = raw_senate_members_data["results"].first["members"]
        all_members = []

        senate_members.each do |hash|
          member = {}
          member[:first_name] = hash["first_name"]
          member[:last_name] = hash["last_name"]
          member[:link] = hash["api_uri"]
          member[:party] = hash["party"]
          member[:state] = hash["state"]
          member[:next_election] = hash["next_election"]
          member[:twitter_account] = hash["twitter_account"]
          all_members << member
        end
        return all_members
      end
    else
      return "Please configure your API key."
  end
end
