require 'test_helper'

class SubmissionsMailerTest < ActionMailer::TestCase
  test "new" do
    mail = SubmissionsMailer.new
    assert_equal "New", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
