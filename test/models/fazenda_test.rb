require 'test_helper'

class FazendaTest < ActiveSupport::TestCase
  test "tem lotes" do
    fazenda = Fazenda.first
    assert_equal fazenda.lotes.size, 1
  end
end
