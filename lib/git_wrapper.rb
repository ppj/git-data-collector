require 'github_api'

class GitWrapper
  def connect
    github = Github.new
    true
  end
end
