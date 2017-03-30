#include "data/world.inc"

sphere {
  <0, 0, 0>, 0.3
	pigment { rgbt 1 }
  hollow
  interior {
    media {
      absorption 8
      emission 8
      samples 30, 30
      density {
        spherical density_map {
          [0   rgb 0]
          [0.4 rgb <1,0,0>]
          [0.6 rgb <1,1,0>]
          [1   rgb 1]
        }
        translate 10 * y
        warp { turbulence 1.5 lambda 2.75 }
        translate -10 * y
      }
      scale 0.3
    }
  }
}
