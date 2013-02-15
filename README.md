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

## License

Released under the Apache License Version 2.0 http://www.apache.org/licenses/LICENSE-2.0.html
