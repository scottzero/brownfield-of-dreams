class GithubFacade
  attr_reader :current_user

  def initialize(current_user)
    @current_user = current_user
  end

  def service
    GithubService.new
  end

  def repo_data
    service.get_repos(@current_user)
  end

  def repos
    repo_data.map do |repo_hash|
      Repo.new(repo_hash)
    end
  end

  def five_repos
    repos.sample(5)
  end

  def follower_data
    service.get_followers(@current_user)
  end

  def followers
    follower_data.map do |follower_hash|
      GithubUser.new(follower_hash)
    end
  end

  def following_data
    service.get_following(@current_user)
  end

  def following
    following_data.map do |following_hash|
      GithubUser.new(following_hash)
    end
  end

  def all_followers
    (followers + following).uniq do |user|
      user.name
    end
  end
end
