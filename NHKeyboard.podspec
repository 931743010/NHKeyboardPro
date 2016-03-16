Pod::Spec.new do |s|

  s.name         = "NHKeyboard"
  s.version      = "0.0.3"
  s.summary      = "NHKeyboard is an Objc Wrapper for custom system keyboard."
  s.homepage     = "https://github.com/iFindTA"
  s.description  = "the customize system keyboard that not cached by system, that can be more scurity for ios's input action"
  s.license      = "MIT(LICENSE)"
  s.author             = { "nanhujiaju" => "nanhujiaju@gmail.com" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/iFindTA/NHKeyboardPro.git", :tag => s.version.to_s }
  s.source_files  = "NHKeyboardPro/KeyBoard/*.{h,m}"
  s.public_header_files = "NHKeyboardPro/KeyBoard/*.h"

  s.framework  = "UIKit","Foundation"
  # s.frameworks = "SomeFramework", "AnotherFramework"

  s.requires_arc = true
  # s.dependency "JSONKit", "~> 1.4"
  end
