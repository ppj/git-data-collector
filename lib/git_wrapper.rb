require 'github_api'

class GitWrapper
  def connect
    raise ArgumentError, "Env Var not set" if env_var_not_set?
    github = Github.new oauth_token: ENV['OAUTH_TOKEN']
    true
  end

  private

  def env_var_not_set?
    ENV['OAUTH_TOKEN']==nil || ENV['OAUTH_TOKEN'].empty?
  end
end
