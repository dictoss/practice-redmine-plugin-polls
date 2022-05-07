Redmine::Plugin.register :polls do
  name 'Polls plugin'
  author 'Norimitsu SUGIMOTO'
  description 'This is a practice plugin for Redmine'
  version '0.0.1'
  url 'https://github.com/dictoss/practice-redmine-plugin-polls'
  author_url 'https://github.com/dictoss'

  settings default: {'empty' => true}, partial: 'settings/poll_settings'
end
