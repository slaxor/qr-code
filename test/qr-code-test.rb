require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../lib/qr-code')
class QRCodeTest  < Test::Unit::TestCase
  def test_if_first_3_lines_are_white
    qr = QRCode.new('foobar').generate.split
    assert_match /^ +$/,qr[0]
    assert_match /^ +$/,qr[1]
    assert_match /^ +$/,qr[2]
  end

  def test_if_first_4th_line # the first real qr-code
    qr = QRCode.new('foobar').generate.split
    assert_match /^   ####### [# ]{10,160} #######   $/,qr[3]
  end
end
