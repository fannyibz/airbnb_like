class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def dashboard
    # @user_infos = current_user.user_contact
    @flat_to_rent = current_user.flats
  end
end
