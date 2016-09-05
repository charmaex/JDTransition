Pod::Spec.new do |s|
  s.name         = "JDTransition"
  s.version      = "0.1.1"
  s.summary      = "Segues to reuse."
  s.homepage     = "http://jandamm.de"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "Jan Dammshäuser" => "jandammshaeuser@me.com" }
  s.platform     = :ios
  s.ios.deployment_target = '9.0'
  s.source       = { :git => "https://github.com/charmaex/JDTransition.git", :tag => "#{s.version}" }
  s.requires_arc = true

  s.source_files  = "JDTransition/**/*.{swift}"
end
