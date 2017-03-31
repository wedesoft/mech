require 'rake/clean'

task :default => :all

task :all => ['data/mech00.png', 'data/turret00.png', 'data/bullet.png', 'data/explosion00.png', 'data/target.png']

file 'data/mech00.png' => ['data/mech.ini', 'data/mech.pov'] do |t|
  sh "povray data/mech.ini +Idata/mech.pov"
end

file 'data/turret00.png' => ['data/turret.ini', 'data/turret.pov'] do |t|
  sh "povray data/turret.ini +Idata/turret.pov"
end

file 'data/bullet.png' => ['data/bullet.ini', 'data/bullet.pov'] do |t|
  sh "povray data/bullet.ini +Idata/bullet.pov"
end

file 'data/explosion00.png' => ['data/explosion.ini', 'data/explosion.pov'] do |t|
  sh "povray data/explosion.ini +Idata/explosion.pov"
end

file 'data/target.png' => ['data/target.ini', 'data/target.pov'] do |t|
  sh "povray data/target.ini +Idata/target.pov"
end

CLEAN.include 'data/*.png'
