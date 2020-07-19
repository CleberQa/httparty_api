# frozen_string_literal: true

class SearchCity
  include HTTParty

  base_uri ENVIRONMENT['api']['url']

  def search_city(cit, token)
    self.class.get("q=#{cit}&appid=#{token}")
  end
end
