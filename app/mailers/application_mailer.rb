class ApplicationMailer < ActionMailer::Base
  default from: 'danny@launchpadlab.com'
  layout 'mailer'
  helper :application
end
