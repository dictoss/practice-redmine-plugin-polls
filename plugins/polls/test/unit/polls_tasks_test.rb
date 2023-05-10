require File.expand_path('../../test_helper', __FILE__)

class PollsTaskSystemTest < ActiveSupport::TestCase
  def setup
  end

  def test_version
    puts "IN test_version()"
    Rake::Task["polls:system:version"].execute
    Rake::Task["polls:system:version"].invoke
  end

  def test_print_settings
    puts "IN test_print_settings()"
    Rake::Task["polls:system:print_settings"].execute
    Rake::Task["polls:system:print_settings"].invoke
  end
end
