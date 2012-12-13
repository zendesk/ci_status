require File.join(File.expand_path(File.dirname(__FILE__)), "helper")


describe CiStatus::CruiseControl do

  before  { stub_request(:get, "http://example.com/cc.xml").to_return(:body => cc_fixture) }
  subject { CiStatus::CruiseControl.new("http://example.com/cc.xml") }

  it "surfaces the input URL" do
    assert_equal "http://example.com/cc.xml", subject.url
  end

  describe "#projects" do
    it "returns the expected projects" do
      assert_equal 3, subject.projects.size

      project = subject.projects.first

      assert_equal "https://jenkins.example.com/job/Analytics/", project.url
      assert_equal "Analytics", project.name
      assert_equal "Success", project.status
      assert project.success?
    end
  end

  describe "#[]" do
    it "allows looking up by name" do
      assert subject["Analytics"]
      refute subject["Horseface"]
    end
  end

end
