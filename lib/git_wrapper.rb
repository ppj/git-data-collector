require 'github_api'

class GitWrapper
  def connect
    github = Github.new(client_id: 'some_client_id', client_secret: 'some_client_Secret')
    true
  end
end
