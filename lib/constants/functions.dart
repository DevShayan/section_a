void printError(String msg) {
  print("\x1B[31m[ERROR] $msg\x1B[0m");
}

void printWarning(String msg) {
  print("\x1B[33m[WARNING] $msg\x1B[0m");
}

void printLog(String msg) {
  print("\x1B[37m[LOG] $msg\x1B[0m");
}
