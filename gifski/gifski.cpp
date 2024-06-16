#include "gifski.h"
#include <cstdint>


// This thing exists globally until a finish call
gifski* g;
// shut
GifskiSettings s;

void gifski2_new(uint32_t width, uint32_t height, uint8_t quality, bool fast, int16_t repeat) {
  s = GifskiSettings{
        .width = width,
        .height = height,
        .quality = quality,
        .fast = fast,
        .repeat = repeat
  };
  g = gifski_new(&s);
}

void finish() {
  gifski_finish(g);
}

void set_file_output(const char* path) {
  gifski_set_file_output(g, path);
}

GifskiError add_frame_rgba(
                                  uint32_t frame_number,
                                  uint32_t width,
                                  uint32_t height,
                                  const unsigned char *pixels,
                                  double presentation_timestamp) {
  return gifski_add_frame_rgba(g, frame_number, width, height, pixels, presentation_timestamp);
}

GifskiError add_frame_rgb(
                                  uint32_t frame_number,
                                  const unsigned char *pixels,
                                  double presentation_timestamp) {
  return gifski_add_frame_rgb(g, frame_number, s.width, s.width*3, s.height, pixels, presentation_timestamp);
}

