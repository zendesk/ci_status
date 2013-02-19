require "open-uri"
require "nokogiri"

module CiStatus
  # Parses the CC format (also used by CCMenu, CCTray etc.)
  class CruiseControl
    attr_accessor :url, :username, :password

    def initialize(url, username = nil, password = nil)
      self.url = url
      self.username = username
      self.password = password
    end

    def projects
      @projects ||= document.xpath("/Projects/Project").map do |project|
        Project.new do |p|
          p.name   = project["name"]
          p.url    = project["webUrl"]
          p.time   = project["lastBuildTime"]
          p.status = project["lastBuildStatus"]
        end
      end
    end

    def [](name)
      projects.detect { |p| p.name == name }
    end

    private

    def document
      @document ||= Nokogiri::XML(data)
    end

    def data
      if username && password
        @data ||= open(url, :http_basic_authentication => [username, password]).read
      else
        @data ||= open(url).read
      end
    end

    class Project
      attr_accessor :name, :url, :time, :status

      def initialize(&block)
        yield self if block_given?
      end

      def success?
        status == "Success"
      end

      def failure?
        status == "Failure"
      end
    end
  end
end
