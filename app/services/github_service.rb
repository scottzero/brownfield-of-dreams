class GithubService

    def get_repos(user)
        json_response = conn(user).get("repos")
        parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    end

    def get_followers(user)
        json_response = conn(user).get("followers")
        parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    end

    def get_following(user)
        json_response = conn(user).get("following")
        parsed_data = JSON.parse(json_response.body, symbolize_names: true)
    end


    private
        def conn(user)
            Faraday.new(url: "https://api.github.com/user/") do |f|
            f.adapter  Faraday.default_adapter
            f.headers['Authorization'] = "token #{user.github_token}"
            end
        end
end