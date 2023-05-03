# practice-redmine-plugin-polls

practice redmine plugin polls.

development on redmine-4.2.5.

## how to use redmine

### tasks

- list all tasks. (include plugins tasks)

`bundle exec rake -T`

- execute tasks in plugin.

`RAILS_ENV="production" bundle exec rake polls:system:print_settings`
`RAILS_ENV="production" bundle exec rake polls:system:version`
`RAILS_ENV="production" bundle exec rake polls:email:read`
