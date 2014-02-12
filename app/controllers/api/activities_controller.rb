class Api::ActivitiesController < Api::BaseController
  # respond_to :json
  def index
    @activities = Activity.all
    respond_with @activities
  end

end
