global_settings {
  ambient_light rgb < 1.0, 1.0, 1.0 >
  assumed_gamma 2.2
}

background {
  colour rgbt <0.5, 0.5, 0.5, 1 >
}

camera {
  orthographic
  location <0, 0, -2>
  look_at  <0, 0,  0>
  right x * image_width / image_height
  up y
}

light_source {
  <0, 100, -100>
  rgb <1, 1, 0.8>
}
