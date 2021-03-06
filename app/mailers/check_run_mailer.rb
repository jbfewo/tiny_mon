class CheckRunMailer < ActionMailer::Base
  default :from => ENV['SMTP_SENDER'] ? ENV['SMTP_SENDER'] : 'TinyMon Notification <notifications@tinymon.org>'

  def failure(check_run, user)
    @check_run = check_run
    attachments['screenshot.png'] = File.read(check_run.health_check.latest_screenshots.last.file_path.to_s)

    mail :to => user.email, :subject => I18n.t("check_run_mailer.failure.subject", :health_check => check_run.health_check.name, :site => check_run.health_check.site.name)
  end

  def success(check_run, user)
    @check_run = check_run

    mail :to => user.email, :subject => I18n.t("check_run_mailer.success.subject", :health_check => check_run.health_check.name, :site => check_run.health_check.site.name)
  end
end
