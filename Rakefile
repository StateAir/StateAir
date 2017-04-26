# -*- coding: utf-8 -*-
$:.unshift("/Library/RubyMotion/lib")
require 'motion/project/template/ios'
require "rubygems"
require 'bundler'
Bundler.require

$short_version = '0.0'
$version = '0.%s' % Time.now.strftime('%y%m.%d%H%M')
$version_fingerprint = '%s/%s/%s' % [$short_version, $version, `git log -1 --format='format:%h'`.strip]

Motion::Project::App.setup do |app|
  # Use `rake config' to see complete project settings.
  app.name = 'StateAir'
  app.identifier = 'com.liulantao.%s' % app.name.downcase.strip.gsub(/\s/, '_')

  app.short_version = $short_version
  app.version = $version

  app.files += Dir.glob(File.join(app.project_dir, 'lib/**/*.rb'))
  app.resources_dirs += %w(resources/icons)
  app.icons = Dir.glob("resources/icons/*.png").map{|icon| icon.split("/").last}

  app.info_plist['VersionFingerprint'] = $version_fingerprint
  app.info_plist['ITSAppUsesNonExemptEncryption'] = false
  app.info_plist['UIStatusBarHidden'] = true
  app.info_plist['NSAppTransportSecurity'] = { NSAllowsArbitraryLoads: true }
  # app.info_plist['UILaunchStoryboardName'] = 'Launch Screen'

  app.pods do
    pod 'CorePlot'
  end

  app.development do
    if ARGV[0] == 'device'
      app.codesign_certificate = MotionProvisioning.certificate(
        type: :development,
        platform: :ios
      )

      app.provisioning_profile = MotionProvisioning.profile(
        bundle_identifier: app.identifier,
        app_name: app.name,
        platform: :ios,
        type: :development
      )

      puts "Using profile: #{app.provisioning_profile}"
      puts "Using certificate: #{app.codesign_certificate}"
    elsif ENV['CI']
      app.codesign_certificate = nil
      app.provisioning_profile = nil
    else
      app.codesign_certificate = nil
      app.provisioning_profile = nil
    end
  end

  app.release do
    app.entitlements['get-task-allow'] = false
    app.codesign_certificate = MotionProvisioning.certificate(
      type: :distribution,
      platform: :ios
    )

    app.provisioning_profile = MotionProvisioning.profile(
      bundle_identifier: app.identifier,
      app_name: app.name,
      platform: :ios,
      type: :distribution
    )

    app.entitlements['beta-reports-active'] = true
    app.entitlements['application-identifier'] = app.seed_id + '.' + app.identifier
    app.entitlements['keychain-access-groups'] = [ app.seed_id + '.' + app.identifier ]

    puts "Using profile: #{app.provisioning_profile}"
    puts "Using certificate: #{app.codesign_certificate}"
  end

end
