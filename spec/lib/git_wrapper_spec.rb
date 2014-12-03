require_relative '../../lib/git_wrapper'


describe GitWrapper do
  let(:github) {double('github')}
  describe '#connect' do

    it 'connects to github when the oauth token is given in env var' do
      ENV['OAUTH_TOKEN']='some sample env token'
      expect(Github).to receive(:new).with(oauth_token: ENV['OAUTH_TOKEN']).and_return(github)
      expect(subject.connect).to be_truthy
    end

    it 'raises error and exits if the env variable for oauth token is not set' do
      ENV['OAUTH_TOKEN']=nil
      expect{subject.connect}.to raise_error(ArgumentError)
    end

    it 'raises error and exits if the env variable for oauth token is set to empty' do
      ENV['OAUTH_TOKEN']='   '
      expect{subject.connect}.to raise_error(ArgumentError)
    end

    xit 'raises error and exits if the oauth token is invalid' do
      ENV['OAUTH_TOKEN'] = 'invalid token'
      expect(Github).to receive(:new).with(oauth_token: ENV['OAUTH_TOKEN']).and_return("Bad Credentials!")
      expect(subject.connect).to eq("Bad Credentials!")
    end

  end

  describe '#list_repo_names' do
    let(:test1) {double(test1)}
    let(:test2) {double(test2)}
    let(:repo_names) {[test1, test2]}

    before do
      allow(github).to receive(:repos).with(no_args).and_return(repo_names)
      allow(test1).to receive(:name).and_return('test1')
      allow(test2).to receive(:name).and_return('test2')
    end
    it 'lists the repo names of the account pointed to by the oauth token' do
      ENV['OAUTH_TOKEN']='some valid token'
      expect(subject).to receive(:connect).with(no_args).and_return(github)
      expect(repo_names).to receive(:list).and_return(repo_names)
      expect(subject.list_repo_names).to eq(repo_names)
    end

  end

end
