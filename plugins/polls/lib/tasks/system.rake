namespace :polls do
  namespace :system do

    desc "print plugin version"
    task :version => :environment do
      Rails.logger.info "IN rake polls:system:version"

      # get plugin instance. can read symbol or hashmap.
      # see: https://github.com/redmine/redmine/blob/master/lib/redmine/plugin.rb
      myplugin = Redmine::Plugin.find(:polls)
      # myplugin = Redmine::Plugin.find('polls')

      # puts myplugin.name
      puts myplugin.version
    end

    desc "print plugin settings value"
    task :print_settings => :environment do
      Rails.logger.info "IN rake polls:system:print_vars"

      #
      # plugin_{xxx} . xxx is plugin name defined init.rb.
      #
      settings_myplugin = Setting.plugin_polls

      # get only single parameter. can read symbol or hashmap.
      print 'remainder_cc => ', settings_myplugin[:remainder_cc]
      # print 'remainder_cc => ', settings_myplugin['remainder_cc']
      puts

      puts

      # get all parameters.
      settings_myplugin.each{|key, value|
        print key, ' => ', value
        puts
      }
    end
  end
end
