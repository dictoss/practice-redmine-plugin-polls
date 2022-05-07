namespace :polls do
  namespace :email do

    desc <<-END_DESC
Read an email from standard input.

See redmine:email:receive_imap for more options and examples.
END_DESC

    task :read => :environment do
      Rails.logger.info "IN rake polls:email:read"

      Mailer.with_synched_deliveries do
        # MailHandler.safe_receive(STDIN.read, MailHandler.extract_options_from_env(ENV))
        PollsMailHandler.safe_receive(STDIN.read, PollsMailHandler.extract_options_from_env(ENV))
      end
    end
  end
end
