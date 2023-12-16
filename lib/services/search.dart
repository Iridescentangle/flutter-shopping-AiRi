import 'dart:convert';

import 'package:AiRi/pages/search/search_model.dart';
import 'package:AiRi/utils/request.dart';

/// 搜索页面
class SearchAPI {
  /// 搜索数据
  static Future<SearchModel> searchData({required String keyword}) async {
    // var response = await RequestUtil().get(
    //   '/search',
    //   params: {"keyword": keyword},
    // );
    final String data = '''{\n   \"result\": [\n      {\n         \"goodsId\": \"3469\",\n         \"goodsMiniPrice\": \"2800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/65a7ae2867d891a241dd8291a9037c84.png\"\n      },\n      {\n         \"goodsId\": \"3465\",\n         \"goodsMiniPrice\": \"3800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/cc507ff0ce7cafc1012885a01fb1942a.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/4628932649a190c464d138c9236591fa.png\"\n      },\n      {\n         \"goodsId\": \"3469\",\n         \"goodsMiniPrice\": \"2800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/d04070745e3e6b7588aba519d48ad9d6.png\"\n      },\n      {\n         \"goodsId\": \"3465\",\n         \"goodsMiniPrice\": \"3800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/dd9cd8d2dae44d4319ab21919021435b.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"优迪 ZS125T-64\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/567f5588c5c86eeca8c94413d7c45e47.png\"\n      },\n      {\n         \"goodsId\": \"3469\",\n         \"goodsMiniPrice\": \"2800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/c8af5398744d2ed87d2459ec3d29d83e.png\"\n      },\n      {\n         \"goodsId\": \"3465\",\n         \"goodsMiniPrice\": \"3800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/09f2f2e348111984dd2c65dd8bcbf5d8.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/0001332cb0db9939076f56c1dddbad26.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"懒人沙发\",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/0001332cb0db9939076f56c1dddbad26.png\"\n      }\n   ]\n}''';
    var resp = json.decode(data);
    return SearchModel.fromJson(resp);
  }
}
