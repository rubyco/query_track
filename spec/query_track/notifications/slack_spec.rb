RSpec.describe QueryTrack::Notifications::Slack do
  let(:code) { 'COMMIT' }
  let(:duration) { 5 }
  let(:slack_stub) { double }

  before do
    QueryTrack::Settings.configure do |config|
      config.duration = 1.0
      config.notifications.slack = 'https://hooks.slack.com/services/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'
    end
  end

  subject { described_class.new(code, duration) }

  it 'should post notification to slack' do
    allow(SlackHook::Incoming).to receive(:new).and_return(slack_stub)
    expect(slack_stub).to receive(:post)
    subject.call
  end
end