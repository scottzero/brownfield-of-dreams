class GithubEmailService

  def initialize(gh_handle)
    @gh_handle = gh_handle
  end

  def get_data
    json_response = conn.get(@gh_handle)
    JSON.parse(json_response.body, symbolize_names: true)
  end

  private
    def conn
      Faraday.new(url: "https://api.github.com/users/") do |f|
        f.adapter  Faraday.default_adapter
      end
    end
end