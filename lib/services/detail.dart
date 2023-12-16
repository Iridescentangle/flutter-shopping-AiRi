import 'dart:convert';

import 'package:AiRi/pages/detail/detail_model.dart';
import 'package:AiRi/utils/request.dart';

/// 详情页面
class DetailAPI {
  /// 获取详情数据
  static Future<DetailModel> getData() async {
    // var response = await RequestUtil().get('/detail');
    final String data = '''{\n   \"bannerList\": [\n      \"https://yanxuan.nosdn.127.net/5efcbeecb663e629c1bb309c7b356f60.png\",\n      \"https://yanxuan.nosdn.127.net/f968b48c45f29fc1a15b6cff7f92368d.png\",\n      \"https://yanxuan.nosdn.127.net/17cbeab4e5e47ef2b5fa0f2adce6cbc2.png\",\n      \"https://yanxuan.nosdn.127.net/cf035e09fe2fae909e5d378ccd396e56.png\",\n      \"https://yanxuan.nosdn.127.net/53dd392169abf4984ee5daec84510826.png\",\n      \"https://yanxuan.nosdn.127.net/1f22276749f73010ae94ae6b8960d201.png\"\n   ],\n   \"specificationList\": [\n      {\n         \"name\": \"规格名称1\",\n         \"specification\": [\n            \"规格值1\",\n            \"规格值2\",\n            \"规格值3\",\n            \"规格值4\",\n            \"规格值5\",\n            \"规格值6\",\n            \"规格值7\"\n         ]\n      },\n      {\n         \"name\": \"规格名称2\",\n         \"specification\": [\n            \"规格值8\",\n            \"规格值9\",\n            \"规格值10\",\n            \"特别特别特别特别长的规格\"\n         ]\n      }\n   ],\n   \"contact\": \"17783887443\",\n   \"goodsName\": \"蔻驰 COACH 奢侈品 女士深棕色PVC手提单肩包 F57842 IMAA8\",\n   \"brandName\": \"蔻驰\",\n   \"goodsSeries\": \"春夏上新\",\n   \"price\": \"5000.0\",\n   \"supplierId\": \"12313\",\n   \"supplierName\": \"蔻驰\",\n   \"supplierCode\": \"zs11WBD66666\",\n   \"platformCode\": \"zs11WBD66666\",\n   \"produceTime\": \"999天\",\n   \"guidePrice\": \"6599.0\",\n   \"miniBuyNum\": \"999\",\n   \"goodsImgUrl\": \"https://yanxuan.nosdn.127.net/1f22276749f73010ae94ae6b8960d201.png\"\n}''';
    final resp = json.decode(data);
    return DetailModel.fromJson(resp);
  }
}
