require "rubygems"
require "bundler/setup"

Bundler.require(:test)

require "minitest/spec"
require "minitest/mock"
require "minitest/autorun"
require "webmock/minitest"

$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__)))
$LOAD_PATH.unshift(File.expand_path(File.join(File.dirname(__FILE__), "../lib")))

require "ci_status"

def fixture_path
  File.join(File.dirname(__FILE__), "fixtures")
end

def cc_fixture
  File.read(File.join(fixture_path, "cc.xml"))
end
