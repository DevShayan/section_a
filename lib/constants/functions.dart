import 'package:section_a/constants/dimens.dart';

void printError(String msg) {
  print("\x1B[31m[ERROR] $msg\x1B[0m");
}

void printWarning(String msg) {
  print("\x1B[33m[WARNING] $msg\x1B[0m");
}

void printLog(String msg) {
  print("\x1B[37m[LOG] $msg\x1B[0m");
}

void setCardWidth(double parentWidth) {
  int partitions = (parentWidth <= 430) ? (parentWidth / 430).ceil() : (parentWidth / 360).ceil();
  double offset = 48 + ((partitions-1)*8); // 8 is total horizontal padding of card

  AppDimens.cardWidth = ((parentWidth - offset) / partitions);
}
