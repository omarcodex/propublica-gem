require 'minitest/autorun'
require 'propublica'

class ProPublicaTest < Minitest::Test
   def test_about
      assert_equal "Hello! This is a Ruby wrapper for the ProPublica API.", ProPublica.about
   end
end
