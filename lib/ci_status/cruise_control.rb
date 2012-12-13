require "open-uri"
require "nokogiri"

module CiStatus
  # Parses the CC format (also used by CCMenu, CCTray etc.)
  class CruiseControl
    attr_accessor :url

    def initialize(url)
      self.url = url
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
      @data ||= open(url).read
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
