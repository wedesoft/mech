#include "data/world.inc"

#declare move_fire = transform { translate 5 * z * clock }

sphere {
  <0, 0, 0>, 1
	pigment { rgbt 1 }
  hollow
  interior {
    media {
      absorption 8
      emission 8
      samples 30, 30
      density {
        spherical
        density_map {
          [0   rgb 0]
          [0.4 rgb <1-clock,0,0>]
          [0.6 rgb <1-clock,1-clock,0>]
          [1   rgb (1-clock)]
        }
        transform { move_fire }
        warp { turbulence 1.5 lambda 2.75 }
        transform { move_fire inverse }
      }
      scale (0.01 + 0.29 * pow(clock, 0.25))
    }
  }
}
