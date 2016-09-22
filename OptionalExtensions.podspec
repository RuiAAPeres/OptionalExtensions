Pod::Spec.new do |s|
    s.name             = "OptionalExtensions"
    s.version          = "2.0"
    s.summary          = "Swift µframework with extensions for the Optional Type"
    s.description  = <<-EOS
  Swift's Optional is pretty awesome, but it can always get better. This repository is an humble attempt to add some utility methods to it.
    EOS

    s.homepage         = "https://github.com/RuiAAPeres/OptionalExtensions"
    s.license          = "MIT"
    s.author           = "Rui Peres"
    s.social_media_url = "https://twitter.com/peres"
    s.source           = { :git => "https://github.com/RuiAAPeres/OptionalExtensions.git", :tag => s.version.to_s }

    s.ios.deployment_target = "8.0"
    s.osx.deployment_target = "10.10"
    s.tvos.deployment_target = "9.0"
    s.watchos.deployment_target = "2.0"

    s.source_files  = "OptionalExtensions/Source/*"
end
