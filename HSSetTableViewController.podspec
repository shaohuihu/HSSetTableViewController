#
#  Be sure to run `pod spec lint HSSetTableViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HSSetTableViewController"
  s.version      = "1.0.2"
  s.summary      = "A powerful set of interface tableView framework, can be configured to support cell updates"
  s.ios.deployment_target = '8.0'

  s.description  = <<-DESC
                   The generic tableView sets the interface wrapper, including cell updates, multiple lines of text on the right, and single line text. Switch and picture cell model, easy to use, automatic code layout, support for rotation, integration is simple.
                   DESC
  s.homepage     = "https://github.com/shaohuihu/HSSetTableViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "hushaohui" => "hushaohui186@gmail.com" }

  s.source       = { :git => "https://github.com/shaohuihu/HSSetTableViewController.git", :tag => s.version }
  s.source_files  = "HSSetTableViewController/**/*.{h,m}"
  s.resources     = "HSSetTableViewController/HSSetTableViewController.bundle"
  s.requires_arc = true
  s.framework    = "UIKit"


end
