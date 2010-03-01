require 'test/unit'
require File.expand_path(File.dirname(__FILE__) + '/../qr-code')
class QRCodeTest  < Test::Unit::TestCase
  def test_if_first_3_lines_are_white
    $/="\000"
    assert_match /^( +\n){3}$/,QRCode.new('foobar').generate
    $/="\n"
  end
end
