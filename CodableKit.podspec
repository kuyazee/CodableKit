Pod::Spec.new do |s|

    s.name         = "CodableKit"
    s.version      = "0.0.1"
    s.summary      = "CodableKit is a library built to extend Swift's Codable"
    s.description  = "CodableKit is a library built to extend Swift's Codable. Made in Swift 4.2"
    s.homepage     = "https://github.com/kuyazee/CodableKit"
    s.swift_version = '4.2'
  
    s.license      = { :type => "MIT", :file => "LICENSE" }
    s.author             = { "Zonily Jame Pesquera" => "zonilyjame@gmail.com" }
    s.social_media_url   = "https://www.linkedin.com/in/zjgpesquera/"
  
    s.platform     = :ios, "8.0"
    s.source       = { :git => "https://github.com/kuyazee/CodableKit.git", :tag => "#{s.version}" }
    s.source_files  = "Classes", "Sources/**/*.{h,m,swift}"
  
  end