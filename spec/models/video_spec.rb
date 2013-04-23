require 'spec_helper'

describe Video do
  before { @video = Video.new(description: "Former MMA fighter now doing the robot", link: "http://www.youtube.com/watch?v=35hCo_grAqw") }

  it "should be valid" do
    @video.should be_valid
  end

  it "should not validate when description is empty or blank" do
    @video.description = " "
    @video.should_not be_valid
  end

  it "should not validate when link is empty or blank" do
    @video.link = " "
    @video.should_not be_valid
  end

  it "should not validate when description over 140 characters" do
    @video.description = "a" * 141
    @video.should_not be_valid
  end

  it "should not be valid when link format is invalid" do
    urls = %w[google.com/aldsjffs user_at_foo.org example.user@foo. foo@bar_baz.com foo@bar+baz.com]
    urls.each do |invalid_url|
      @video.link = invalid_url
      @video.should_not be_valid
    end
  end

  it "should be valid when link format is valid" do
    urls = %w[http://www.youtube.com/watch?v=r-qhj3sJ5qs youtube.com/watch?v=35hCo_grAqw www.youtube.com/watch?v=35hCo_grAqw]
    urls.each do |valid_url|
      @video.link = valid_url
      @video.should be_valid
    end
  end
end