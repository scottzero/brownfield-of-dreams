class InvitesFacade
  attr_reader :handle

  def initialize(handle)
    @handle = handle
  end

  def service
    GithubEmailService.new(handle).get_data
  end

  def email
    service[:email] || service[:bio]
  end

  def name
    service[:name]
  end
  end
