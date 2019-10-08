class UsersFacade

    def initialize(user)
        @user = user
    end

    def repo_data
        service = GithubService.new
        repos = service.get_repos(@user)
    end

    def get_repos
        repo_data.map do |repo_hash|
            Repo.new(repo_hash)
        end
    end

    def repos
        get_repos.sample(5)
    end
end