class ActivitiesController < ApplicationController
  def index
    activities = Activity.all
    render json: activities
  end

  def destroy
    activity = Activity.find_by(id: params[:id])
    signup = Signup.find_by(activity_id: params[:id])
    if activity
      signup.destroy
      activity.destroy
      render json: {}, status: :no_content
    else
      render json: {error: "Activity not found"}, status: :not_found
    end
  end

end
