task :default => :all

task :all => ['data/mech.png']

file 'data/mech.png' => ['data/mech.ini', 'data/mech.pov'] do |t|
  sh "povray data/mech.ini +Idata/mech.pov"
end
