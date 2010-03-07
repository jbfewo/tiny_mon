require 'test_helper'

class FillInStepTest < ActiveSupport::TestCase
  test "should fill in field" do
    step = FillInStep.new(:field => 'login', :value => 'username')
    session = mock(:fill_in)
    step.run!(session)
  end
end
