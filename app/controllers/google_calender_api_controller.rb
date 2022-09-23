class GoogleCalenderApiController < ApplicationController
  def index
    scope = "https://www.googleapis.com/auth/calendar"
    authorizer = Google::Auth::ServiceAccountCredentials.make_creds(
                json_key_io: File.open(Rails.root.join('app/controllers/google_calender_api_controller.rb').to_s),
                scope: scope)

  end
end
