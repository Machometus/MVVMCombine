#
# Be sure to run `pod lib lint MVVMCombine.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MVVMCombine'
  s.version          = '1.0.0'
  s.summary          = 'Better apps. Less code. Get the most out of SwiftUI using MVVMCombine!'

  s.description      = <<-DESC
  Better apps. Less code. Get the most out of SwiftUI using MVVMCombine!

  Build clean, pixel perfect, and declarative UIs, using the Model-View-ViewModel-Coordinator (MVVM-C) design pattern. MVVMCombine is a framework specifically developed for Apple’s newest framework Combine, alongside SwiftUI, that provides logical streams as the core of Functional Reactive Programming (FRP), with a declarative Swift syntax that’s easy to read and natural to write.

  Now with MVVMCombine, the view model is responsible for exposing the data objects from the model in such a way that objects are easily managed and presented. In this respect, the view model is more model than view, and handles most if not all of the view’s display logic, and navigation behaviour via coordinators.
                       DESC

  s.homepage         = 'https://github.com/Machometus/MVVMCombine'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mohamed Salem' => 'cpe.salem@gmail.com' }
  s.source           = { :git => 'https://github.com/Machometus/MVVMCombine.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/MSalemsson'

  s.ios.deployment_target = '13.0'

  s.source_files = 'Source/**/*'
  s.swift_version = '5.0'
  s.platforms = {
      "ios": "13.0"
  }
  
end
