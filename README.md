# CI Status

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
