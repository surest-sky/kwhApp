class EnumUtil {
  static String ocr = "ocr";
  static String url = "url";
  static String text = "text";

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

enum EditorMode {
  edit,
  create
}