class EnumUtil {
  static String ocr = "ocr";
  static String url = "url";
  static String text = "text";

  static Map<String, String> contentTypeMap = {
    "jpeg": 'image/jpeg',
    "jpg": 'image/jpeg',
    "png": 'image/png',
    "gif": 'image/gif',
    "mp4": 'video/mpeg4',
    "ppt": 'application/vnd.ms-powerpoint',
    "pdf": 'application/pdf',
    "txt": 'application/txt'
  };

  static String getNoteType(String type) {
    const texts = ['text', 'note'];
    const ocrs = ['ocr', 'ocr_local'];
    const urls = ['url'];

    if (texts.contains(type)) {
      return texts[0];
    }
    if (ocrs.contains(type)) {
      return ocrs[0];
    }
    if (urls.contains(type)) {
      return urls[0];
    }
    return 'text';
  }
}

enum EditorMode { fullScreen, quite }
