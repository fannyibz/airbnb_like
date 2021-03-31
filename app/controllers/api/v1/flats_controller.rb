class Api::V1::FlatsController < Api::V1::BaseController

  def index
    @flats = policy_scope(Flat)
  end

end
