require_relative '../../lib/git_wrapper'

describe GitWrapper do
  describe '#connect' do
    xit 'connects to the git api' do
      expect(subject.connect).to be_truthy
    end
  end

end
