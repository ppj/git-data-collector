require_relative '../../lib/git_wrapper'


describe GitWrapper do
  describe '#connect' do
    let(:github) {double('github')}
    let(:url) {'http://some_url'}

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
  end

end
