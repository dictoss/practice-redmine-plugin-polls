class PollsMailHandler < MailHandler
  def dispatch
    Rails.logger.info "IN PollsMailHandler.dispatch()"
    super
  end
end
