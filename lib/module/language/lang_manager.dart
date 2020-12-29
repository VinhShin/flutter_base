import 'package:e_mobiz/module/language/r.dart';
import 'package:multi_language/langcode.dart';
import 'package:multi_language/language_abstract.dart';

String lang(int id) {
  var content = LangManager().lang(id);
  return content ?? "???";
}

extension IntExtend on int {
  trans() {
    LangManager().clear();
    return LangManager().lang(this);
  }
}

class LangManager extends LanguageAbstract {
  static LangManager _singeton = LangManager._internal();

  LangManager._internal();

  factory LangManager() {
    return _singeton;
  }

  @override
  List<LangCode> getLangDef() {
    // TODO: implement getLangDef
    return [LangCode.vn, LangCode.en];
  }

  @override
  List<LangModel> getLangData() {
    // TODO: implement getLangData
    return [
      LangModel(R.notification, "Thông báo", vn: "Xin chào"),
      LangModel(R.storeNotAvailable,
          "Xin lỗi bạn, hiện tại không có nhà thuốc nào gần bạn, bạn có thể thử đặt lại đơn thuốc này sau ít phút!",
          vn: "Sminapo"),
      LangModel(R.cancelOrder, "Hủy đơn", vn: "Sminapo"),
      LangModel(R.reOrder, "Đặt lại", vn: "Sminapo"),
      LangModel(R.home, "Trang chủ", vn: "Trang chủ"),
      LangModel(R.history, "Lịch sử", vn: ""),
      LangModel(R.account, "Tài khoản", vn: ""),
    ];
  }
}
