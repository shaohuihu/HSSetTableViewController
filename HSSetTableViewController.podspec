#
#  Be sure to run `pod spec lint HSSetTableViewController.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "HSSetTableViewController"
  s.version      = "1.3.0"
  s.summary      = "所有App都能用到的设置界面和个人信息框架，高度封装。外部只需要组装数据源。可继承、可分类。0污染，功能强大，强烈建议使用分类！"
  s.ios.deployment_target = '8.0'

  s.description  = <<-DESC
                   争取打造天朝最好用的设置界面和个人信息框架，上至分割线，下到箭头，标题，详细标题，富文本标题等等统统可配置，可更新，你无须判断indexPath.row。也无须纠结如何更新cell，HSSetTableViewController一行代码帮你搞定！
                   DESC
  s.homepage     = "https://github.com/shaohuihu/HSSetTableViewController"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.author             = { "hushaohui" => "hushaohui186@gmail.com" }

  s.source       = { :git => "https://github.com/shaohuihu/HSSetTableViewController.git", :tag => s.version }
  s.source_files  = "HSSetTableViewController/**/*.{h,m}"
  s.resources     = "HSSetTableViewController/HSSetTableViewController.bundle"
  s.requires_arc = true
  s.framework    = "UIKit"
  s.dependency 'SDWebImage'


end
