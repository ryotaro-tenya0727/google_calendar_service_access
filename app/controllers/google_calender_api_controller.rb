class GoogleCalenderApiController < ApplicationController
  SCOPE = Google::Apis::CalendarV3::AUTH_CALENDAR

  def index
    calendar = Google::Apis::CalendarV3::CalendarService.new
    calendar.authorization = Google::Auth::ServiceAccountCredentials.make_creds(
      json_key_io: File.open('/Users/ryotaro/Desktop/program_study/rails/google_calender/calender-project-358005-91cafccfb196.json'),
      scope: SCOPE
    )
    calendar.authorization.fetch_access_token!
    # entry = Google::Apis::CalendarV3::CalendarListEntry.new(
    # id: 'calendarId'
    # )
    calendars = calendar.list_events('ryotaro123110@gmail.com',
                                     max_results: 10,
                                     single_events: true,
                                     order_by: 'startTime',
                                     time_min: Time.now.iso8601).items
    byebug
  end

  def client
    client_id = Google::Auth::ClientId.new(ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'])
    authorizer = Google::Auth::UserAuthorizer.new(client_id, SCOPE)
  end

  def callback

  end

  private

  def client_id
    @client_id ||= Google::Auth::ClientId.new(ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'])
  end
end
# ENV['S3_DIARY_OBJECT_KEY']
