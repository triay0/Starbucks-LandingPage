class Utils {
  var pattern = RegExp(
      "#([A-Za-z0-9_-]+)|@([A-Za-z0-9_-]+)|^(?:https?:\\/\\/)?(?:www\\.)?[a-zA-Z0-9./]+\$");

  static String formatNum(num) {
    var number = "";

    if (num > 99999999) {
      number = "${num.toString().substring(0, 3)}.${num.toString()[3]}M";
    } else if (num > 9999999) {
      number = "${num.toString().substring(0, 2)}.${num.toString()[2]}M";
    } else if (num > 999999) {
      number = "${num.toString().substring(0, 1)}.${num.toString()[1]}M";
    } else if (num > 99999) {
      number = "${num.toString().substring(0, 3)}.${num.toString()[4]}K";
    } else if (num > 9999) {
      number = "${num.toString().substring(0, 2)}.${num.toString()[3]}K";
    } else if (num > 999) {
      number = "${num.toString().substring(0, 1)}.${num.toString()[2]}K";
    } else {
      number = "$num";
    }
      return number;

  }
}
