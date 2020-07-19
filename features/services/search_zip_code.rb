# frozen_string_literal: true

class SearchZip
  include HTTParty

  base_uri ENVIRONMENT['api']['url']

  def search_zip_code(zipcode, countrycode, token)
    self.class.get("zip=#{zipcode},#{countrycode}&appid=#{token}")
  end
end
