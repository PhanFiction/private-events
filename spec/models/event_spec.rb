require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { described_class.new }
  let(:user) { create(:user) }

  context "Event is created successfully when all params are filled" do
    it "Passes when all params are filled" do
      subject.title = "Anime Event",
      subject.description = "Anime Event in Tokyo",
      subject.location = "Anime Cafe",
      subject.start_date = Date.today,
      subject.start_time = Time.current
      subject.creator = user
      expect(subject).to be_valid
    end
  end

  context "Event fails when missing certain parameters" do
    it "Fails when title is missing" do
      subject.location = "Anime Cafe",
      subject.start_date = Date.today,
      subject.start_time = Time.current
      subject.creator = user
      expect(subject).to be_invalid
    end
    
    it "Fails when description is missing" do
      subject.title = "Anime Event",
      subject.location = "Anime Cafe",
      subject.start_date = Date.today,
      subject.start_time = Time.current
      subject.creator = user
      expect(subject).to be_invalid
    end
  end

  context "Test user attending event" do
    it "Expect attendees to be empty" do
      expect(subject.attendees).to be_empty
    end
    
    it "Expect attendees to have one user attending" do
      subject.attendees << user
      expect(subject.attendees.length).to eql(1)
    end
  end

end
