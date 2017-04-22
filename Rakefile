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
  end
end
