require File.join(File.expand_path(File.dirname(__FILE__)), "helper")


describe CiStatus::CruiseControl do

  describe "unauthenticated" do
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

  describe "authenticated" do
    username = "Sam"
    password = "LovesPuppies"
    url = "http://example.com/cc.xml"
    before  { stub_request(:get, "http://Sam:LovesPuppies@example.com/cc.xml").to_return(:body => cc_fixture) }
    subject { CiStatus::CruiseControl.new(url, username, password) }

    it "surfaces the username" do
      assert_equal username, subject.username
    end

    it "surfaces the password" do
      assert_equal password, subject.password
    end

    describe "#projects" do
      it "returns the expected projects" do
        assert_equal 3, subject.projects.size
      end
    end
  end

end
