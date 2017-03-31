#include "data/world.inc"

union {
  sphere {
    <0, 0, 0>, 0.3
  }
  cylinder {
    <0, 0, 0>, <0.4, 0, 0>, 0.1
  }
  pigment {
    colour rgb <0, 1, 0>
  }
  finish {
    ambient 0.0
    diffuse 0.8
    reflection 0.2
  }
  rotate -z * (360 * clock)
}
