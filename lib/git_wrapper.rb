require 'octokit'

class GitWrapper
  def connect
    raise ArgumentError, "Env Var not set" if env_var_not_set?
    client = Octokit::Client.new access_token: ENV['OCTOKIT_ACCESS_TOKEN']
  end

  def list_repo_names
    client = connect
    repos = client.repos.list.map {|repo| repo.name}
    puts repos.join("\n")
    repos
  end

  private

  def env_var_not_set?
    ENV['OCTOKIT_ACCESS_TOKEN']==nil || ENV['OCTOKIT_ACCESS_TOKEN'].strip.empty?
  end
end
