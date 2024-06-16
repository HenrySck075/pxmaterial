// ignore_for_file: must_be_a_native_function_type
import "dart:ffi" as ffi;
import "dart:io";
import "dart:typed_data";

import "package:ffi/ffi.dart" as ffip;
import "package:path/path.dart" as path;

final class GifskiSettings extends ffi.Struct {
  @ffi.Uint32()
  external int width;
  @ffi.Uint32()
  external int height;
  @ffi.Uint8()
  external int quality;
  @ffi.Bool()
  external bool fast;
  @ffi.Uint16()
  external int loop;
}

// i only have what i need
class GifSki {
  void load() {
    if (Platform.isIOS || Platform.isFuchsia) {
      // unfortunate.
      return;
    }
    var gifskiLibName = "libgifski";
    var gifskiLibExt = "";

    if (Platform.isMacOS) {
      gifskiLibExt = ".dylib";
    }
    if (Platform.isWindows) {
      gifskiLibExt = ".dll";
    }
    if (Platform.isLinux || Platform.isAndroid) {
      gifskiLibExt = ".so";
      if (Platform.isAndroid) {
        gifskiLibName += "-android";
      }
    }
    
    _lib = ffi.DynamicLibrary.open(path.join(Directory.current.path,"gifski",gifskiLibName+gifskiLibExt));
  }

  late final ffi.DynamicLibrary _lib;

  create(int width, int height, int quality, bool fast, String outputPath, {int repeat=0}) {
    _lib.lookupFunction<
      ffi.Void Function(ffi.Uint32, ffi.Uint32, ffi.Uint8, ffi.Bool, ffi.Int16), void Function(int, int, int, bool, int)
    >("gifski_new").call(width, height, quality, fast, repeat);
    _lib.lookupFunction<void Function(ffi.Pointer<ffip.Utf8>), void Function(ffi.Pointer<ffip.Utf8>)>("set_file_output").call(outputPath.toNativeUtf8());
  }
  /// do this
  close() {
    _lib.lookupFunction<ffi.Void Function(), void Function()>("gifski_finish").call();
  }

  addFrameRGB(int frameNum, Uint8List pixels, double timestamp) {
    _lib.lookupFunction<ffi.Int Function(ffi.Uint32, ffi.Pointer<ffip.Utf8>, ffi.Double), int Function(int, ffi.Pointer<ffip.Utf8>, double)>("add_frame_rgb")(frameNum, String.fromCharCodes(pixels).toNativeUtf8(), timestamp);
  }
}
