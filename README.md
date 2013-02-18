# CI Status [![Build Status](https://secure.travis-ci.org/zendesk/ci_status.png)](http://travis-ci.org/zendesk/ci_status)

Client for generic CI status pages

## Cruise Control

```ruby
c = CiStatus::CruiseControl.new("http://example.com/cc.xml")
c.projects.each do |project|
  puts project.name
  puts project.success?
  puts project.time
end
```

## License

Copyright 2013 Zendesk

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
