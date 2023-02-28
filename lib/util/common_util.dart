String getFileExtension(String filename) {
  // 如果文件名为空，则返回空字符串
  if (filename == null) {
    return "";
  }

  // 查找最后一个点的位置
  int dotIndex = filename.lastIndexOf(".");

  // 如果点不存在或在文件名的开头，则返回空字符串
  if (dotIndex == -1 || dotIndex == 0) {
    return "";
  }

  // 返回从最后一个点到字符串末尾的子字符串，即后缀名
  return filename.substring(dotIndex + 1);
}
