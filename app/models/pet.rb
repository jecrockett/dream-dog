class Pet

  def self.all(image)
    parsed_data = parse(Faraday.get("http://pets.vsapi01.com/api-search/by-url?url=#{image}&apikey=5c3f0bd0-ab92-4fcc-9947-ad43dfcc99ac"))
    # exract key to application.yml
    parsed_data["images"]
  end

  private

    def self.parse(response)
      JSON.parse(response.body)
    end

end
