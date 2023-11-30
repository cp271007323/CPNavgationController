Pod::Spec.new do |s|

  s.name         = "CPNavgationController"
  s.version      = "1.0.10"
  s.summary      = "test"
  s.homepage     = "https://github.com/cp271007323/CPNavgationController"
  s.license      = "MIT"
  s.author       = { "cp271007323" => "271007323@qq.com" }
  s.ios.deployment_target = "9.0"
  s.frameworks = "Foundation", "UIKit"
  s.source = { :git => "https://github.com/cp271007323/CPNavgationController.git", :tag => s.version }
  s.source_files  = "CPNavgationController" , "CPNavgationController/*.{h,m}"
  s.resources = "CPNavgationController/*.bundle"
end
