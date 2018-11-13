require 'test_helper'

class EmpruntMailerTest < ActionMailer::TestCase
  test "emprunt" do
    mail = EmpruntMailer.emprunt
    assert_equal "Emprunt", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
