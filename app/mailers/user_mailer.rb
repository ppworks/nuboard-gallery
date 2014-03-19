class UserMailer < ActionMailer::Base
  default from: "pplog <info@pplog.net>"

  def email_confirmation(user)
    @user = user
    set_locale
    mail(to: "#{user.name} <#{user.unconfirmed_email}>",
         subject: default_i18n_subject(site_title: I18n.t('site_info.title')))
  end

  private
  def set_locale
    I18n.locale = @user.locale if @user.locale
  end
end
