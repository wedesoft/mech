require 'rake/clean'

task :default => :all

task :all => ['data/mech00.png', 'data/turret00.png', 'data/bullet.png', 'data/explosion.png']

file 'data/mech00.png' => ['data/mech.ini', 'data/mech.pov'] do |t|
  sh "povray data/mech.ini +Idata/mech.pov"
end

file 'data/turret00.png' => ['data/turret.ini', 'data/turret.pov'] do |t|
  sh "povray data/turret.ini +Idata/turret.pov"
end

file 'data/bullet.png' => ['data/bullet.ini', 'data/bullet.pov'] do |t|
  sh "povray data/bullet.ini +Idata/bullet.pov"
end

file 'data/explosion.png' => ['data/explosion.ini', 'data/explosion.pov'] do |t|
  sh "povray data/explosion.ini +Idata/explosion.pov"
end

CLEAN.include 'data/mech*.png', 'data/turret*.png', 'data/bullet.png', 'data/explosion.png'
