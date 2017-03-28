require 'rake/clean'

task :default => :all

task :all => ['data/mech0.png']

file 'data/mech0.png' => ['data/mech.ini', 'data/mech.pov'] do |t|
  sh "povray data/mech.ini +Idata/mech.pov"
end

CLEAN.include 'data/mech*.png'
