Pod::Spec.new do |s|
    s.name             = "CombineCocoa"
    s.version          = "0.4.3"
    s.summary          = "CombineCocoa provided basic publisher bridges for UIControls in UIKit"
    s.description      = <<-DESC
    Combine publisher bridges for Cocoa Controls (UIControl) in UIKit
    DESC
    s.homepage         = "https://github.com/pavelosipov/CombineCocoa"
    s.license          = 'MIT'
    s.author           = { "Shai Mishali" => "freak4pc@gmail.com" }
    s.source           = { :git => "https://github.com/pavelosipov/CombineExt.git", :tag => s.version.to_s }

    s.requires_arc     = true

    s.ios.deployment_target     = '12.0'

    s.source_files = 'Sources/**/*.{swift,h,m}'
    s.frameworks   = ['Foundation']
    s.swift_version = '5.0'

    s.dependency 'OpenCombine'
    s.dependency 'OpenCombineDispatch'
    s.dependency 'OpenCombineFoundation'
  end
