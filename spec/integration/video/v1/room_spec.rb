##
# This code was generated by
# \ / _    _  _|   _  _
#  | (_)\/(_)(_|\/| |(/_  v1.0.0
#       /       /

require 'spec_helper.rb'

describe 'Room' do
  it "can fetch" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
    ))).to eq(true)
  end

  it "receives fetch responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "peer-to-peer",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "unique_name",
          "max_participants": 10,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": "",
          "record_participants_on_connect": false,
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").fetch()

    expect(actual).to_not eq(nil)
  end

  it "can create" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.video.v1.rooms.create()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/Rooms',
    ))).to eq(true)
  end

  it "receives create responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        201,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "in-progress",
          "type": "peer-to-peer",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "max_participants": 10,
          "duration": 0,
          "status_callback_method": "POST",
          "status_callback": "",
          "record_participants_on_connect": false,
          "end_time": "2015-07-30T20:00:00Z",
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.create()

    expect(actual).to_not eq(nil)
  end

  it "can read" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.video.v1.rooms.list()
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {}
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'get',
        url: 'https://video.twilio.com/v1/Rooms',
    ))).to eq(true)
  end

  it "receives read_empty responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "rooms": [],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "rooms"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.list()

    expect(actual).to_not eq(nil)
  end

  it "receives read_with_status responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "rooms": [
              {
                  "sid": "RM4070b618362c1682b2385b1f9982833c",
                  "status": "completed",
                  "date_created": "2017-04-03T22:21:49Z",
                  "date_updated": "2017-04-03T22:21:51Z",
                  "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
                  "type": "peer-to-peer",
                  "enable_turn": true,
                  "unique_name": "RM4070b618362c1682b2385b1f9982833c",
                  "status_callback": null,
                  "status_callback_method": "POST",
                  "end_time": "2017-04-03T22:21:51Z",
                  "duration": 2,
                  "max_participants": 10,
                  "record_participants_on_connect": false,
                  "url": "https://video.twilio.com/v1/Rooms/RM4070b618362c1682b2385b1f9982833c",
                  "links": {
                      "recordings": "https://video.twilio.com/v1/Rooms/RM4070b618362c1682b2385b1f9982833c/Recordings"
                  }
              }
          ],
          "meta": {
              "page": 0,
              "page_size": 50,
              "first_page_url": "https://video.twilio.com/v1/Rooms?PageSize=50&Page=0",
              "previous_page_url": null,
              "url": "https://video.twilio.com/v1/Rooms?PageSize=50&Page=0",
              "next_page_url": null,
              "key": "rooms"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms.list()

    expect(actual).to_not eq(nil)
  end

  it "can update" do
    @holodeck.mock(Twilio::TwilioResponse.new(500, ''))

    expect {
      @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update(status: "in-progress")
    }.to raise_exception(Twilio::REST::TwilioError)

    values = {
        'Status' => "in-progress",
    }
    expect(
    @holodeck.has_request?(Holodeck::Request.new(
        method: 'post',
        url: 'https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa',
        data: values,
    ))).to eq(true)
  end

  it "receives update responses" do
    @holodeck.mock(Twilio::TwilioResponse.new(
        200,
      %q[
      {
          "account_sid": "ACaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "date_created": "2015-07-30T20:00:00Z",
          "date_updated": "2015-07-30T20:00:00Z",
          "status": "completed",
          "type": "peer-to-peer",
          "sid": "RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "enable_turn": true,
          "unique_name": "unique_name",
          "max_participants": 10,
          "status_callback_method": "POST",
          "status_callback": "",
          "record_participants_on_connect": false,
          "end_time": "2015-07-30T20:00:00Z",
          "duration": 10,
          "url": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
          "links": {
              "recordings": "https://video.twilio.com/v1/Rooms/RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa/Recordings"
          }
      }
      ]
    ))

    actual = @client.video.v1.rooms("RMaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa").update(status: "in-progress")

    expect(actual).to_not eq(nil)
  end
end