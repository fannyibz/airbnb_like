class UserContactsController < ApplicationController
  before_action :find_user_contact, only: [:show, :destroy]
  skip_before_action :authenticate_user!, only: [:show]

  def show
  end

  def new
    @user_contact = UserContact.new
  end

  def create
    @user_contact = UserContact.new(user_contacts_params)
    @user_contact.user = current_user
    if @user_contact.save
      redirect_to user_contact_path(@user_contact)
    else
      render :new
    end
  end

  def destroy
  end

  private

  def find_user_contact
    @user_contact = UserContact.find(params[:id])
  end

  def user_contacts_params
    params.require(:user_contact).permit(:first_name, :last_name)
  end

end
