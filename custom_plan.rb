require 'zeus/rails'

class CustomPlan < Zeus::Rails

  # def my_custom_command
  #  # see https://github.com/burke/zeus/blob/master/docs/ruby/modifying.md
  # end
  def test_environment
    require 'minitest/unit'
    require 'minitest/spec'
    require 'factory_girl_rails'
    MiniTest::Unit.class_variable_set("@@installed_at_exit", true)
    $LOAD_PATH.unshift '../katello/test'
    $LOAD_PATH.unshift '../katello/spec'
    $LOAD_PATH.unshift '../foreman_openscap/test'
    $LOAD_PATH.unshift '../foreman_pipeline/test'
    $LOAD_PATH.unshift '../foreman/test'
    $LOAD_PATH.unshift '../foreman_discovery/test'
    $LOAD_PATH.unshift '../foreman_remote_execution/test'
    # require 'katello_test_runner'
    super
  end

end

Zeus.plan = CustomPlan.new

