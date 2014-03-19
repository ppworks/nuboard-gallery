class EmailsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def show
    redirect_to edit_my_email_path
  end

  def edit
  end

  def update
    if @user.update_email params[:email]
      redirect_to finish_my_email_path, notice: t('emails.updated')
    else
      render :edit
    end
  end

  def confirmation
    if @user.confirm_email params[:hash]
      redirect_to root_path, notice: t('emails.confirmation.complete')
    else
      message = @user.errors.present? ? @user.errors.full_messages.join('') : t('emails.confirmation.error')
      redirect_to edit_my_email_path, alert: message
    end
  end

  private
  def set_user
    @user = User.find(current_user.id)
  end
end
