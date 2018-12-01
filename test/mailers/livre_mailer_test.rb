require 'test_helper'

class LivreMailerTest < ActionMailer::TestCase
  test "nouveautes" do
    mail = LivreMailer.nouveautes
    assert_equal "Nouveautes", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
