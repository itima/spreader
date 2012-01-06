class RetrievalNotifier < ActionMailer::Base
  default from: "spreader@itima.ru"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.retrieval_notifier.start.subject
  #
  def start(user, account_id)
    @greeting = "Started data retrieval for - #{account_id}"

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.retrieval_notifier.success.subject
  #
  def success(user, account)
    @greeting = "Successfully retrieved data for your account - #{account.inspect}"

    mail to: user.email
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.retrieval_notifier.failure.subject
  #
  def failure(user, account_id, exception)
    @greeting = "Error saving account or some sub items - #{account_id}. Exception: #{exception.inspect}"

    mail to: user.email
  end
end
