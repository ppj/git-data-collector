require_relative '../../lib/git_wrapper'


describe GitWrapper do
  describe '#connect' do
    let(:github) {double('github')}

    before do
      allow(Github).to receive(:new).with(any_args).and_return(github)
    end

    it 'connects to the git api' do
      expect(Github).to receive(:new)
      expect(subject.connect).to be_truthy
    end
  end

end
