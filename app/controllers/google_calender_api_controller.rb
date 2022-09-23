class GoogleCalenderApiController < ApplicationController
  def index
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('/Users/ryotaro/Desktop/program_study/rails/google_calender/calender-project-358005-91cafccfb196.json'),
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR
    )
    calendar.authorization.fetch_access_token!
    # entry = Google::Apis::CalendarV3::CalendarListEntry.new(
    # id: 'calendarId'
    # )
    # byebug
    calendar.list_events("ryotaro123110@gmail.com").items[-1]
  end
end
