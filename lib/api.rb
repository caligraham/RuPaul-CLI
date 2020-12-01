class Api

    #def self.base_url
        #"http://www.nokeynoshade.party/api/queens"
    #end


    def self.load_data
            response = RestClient.get("http://www.nokeynoshade.party/api/queens?limit=10")
            data = JSON.parse(response.body)
           
            
            data.each do |queen_data|
                Queens.new(queen_data["name"], queen_data["winner"], queen_data["quote"])
        end
    end

end