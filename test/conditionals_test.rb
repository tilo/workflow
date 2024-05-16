require File.join(File.dirname(__FILE__), 'test_helper')

$VERBOSE = false
require 'workflow'
require 'mocha/minitest'

class ConditionalsTest < Minitest::Test

  test 'can_<fire_event>? with conditions' do
    c = Class.new do
      include Workflow
      workflow do
        state :off do
          event :turn_on, :transitions_to => :on, :if => :sufficient_battery_level?
          event :turn_on, :transitions_to => :low_battery, :if => proc { |obj| obj.battery > 0 }
        end
        state :on
        state :low_battery
      end
      attr_reader :battery
      def initialize(battery)
        @battery = battery
      end

      def sufficient_battery_level?
        @battery > 10
      end
    end

    device = c.new 0
    assert_equal false, device.can_turn_on?

    device = c.new 5
    assert device.can_turn_on?
    device.turn_on!
    assert device.low_battery?
    assert_equal false, device.on?

    device = c.new 50
    assert device.can_turn_on?
    device.turn_on!
    assert device.on?
  end

  test 'gh-227 allow event arguments in conditions - test with proc' do
    c = Class.new do
      include Workflow
      # define more advanced workflow, where event methods allow arguments
      workflow do
        state :off do
          # turn_on accepts additional argument `power_adapter`
          event :turn_on, :transitions_to => :on, :if => :sufficient_battery_level?
          event :turn_on, :transitions_to => :low_battery # otherwise
        end
        state :on
        state :low_battery
      end
      attr_reader :battery
      def initialize(battery)
        @battery = battery
      end

      def sufficient_battery_level?(power_adapter=false)
        power_adapter || @battery > 10
      end
    end

    # test for conditions in a proc
    device = c.new 5
    device.turn_on!(true) # case with event arguments to be taken into account
    assert device.on?
  end

  test 'gh-227 allow event arguments in conditions - test with a method' do
    c = Class.new do
      include Workflow
      # define more advanced workflow, where event methods allow arguments
      workflow do
        state :off do
          # turn_on accepts additional argument `power_adapter`
          event :turn_on, :transitions_to => :on, :if => proc { |obj, power_adapter| power_adapter || obj.battery > 10 }
          event :turn_on, :transitions_to => :low_battery # otherwise
        end
        state :on
        state :low_battery
      end
      attr_reader :battery
      def initialize(battery)
        @battery = battery
      end
    end

    device = c.new 5
    device.turn_on!(true) # case with event arguments to be taken into account
    assert device.on?
  end

end

