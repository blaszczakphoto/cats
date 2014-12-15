# coding: utf-8
$LOAD_PATH.unshift( File.expand_path('../../lib', __FILE__) )

require "photos_puller"

desc "Get 100 latest pics from flickr and save them in DB e.g. rake \"pull_pics[cat]\""

task :pull_pics, [:tag]  => :environment do |t, args|
 PhotosPuller.pull(args[:tag])
 puts "Photos pulled correctly"
end

