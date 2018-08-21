class SiteMailer < ApplicationMailer
  default from: "tec@arklabs.us", cc: 'tec@arklabs.us'

  def registration(user)
    @user = user
    return if @user.email.blank?
    mail(to: @user.email, subject: 'Registration resume')
  end

  def donation(user, cur, amount)
    @user = user
    @currency = cur
    @amount = amount
    return if @user.email.blank?
    mail(to: @user.email, subject: 'Your Donation details')
  end

  def confirm_transaction(user)
    @user = user
    return if @user.email.blank?
    mail(to: @user.email, subject: 'Your transaction has been confirmed')
  end

  def contacts(data)
    @user = data
    mail(from: 'info@arklabs.us', to: "tec@arklabs.us", subject: 'New Contact Request')
  end

  def refund_req(username, data)
    @user = data
    @user['username'] = username
    mail(to: "tec@arklabs.us", subject: 'New Refund Request')
  end
end
