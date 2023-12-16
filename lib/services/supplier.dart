import 'dart:convert';

import 'package:AiRi/pages/supplier/supplier_model.dart';
import 'package:AiRi/utils/request.dart';

/// 详情页面
class SupplierAPI {
  /// 获取供应商数据
  static Future<SupplierModel> getData() async {
    // var response = await RequestUtil().get('/supplier');
    final String data = '''{\n   \"supplierName\": \"优衣库官方旗舰店\",\n   \"contact\": \"觉非\",\n   \"phoneNum\": \"17783887443\",\n   \"workTime\": \"上午10:00 - 下午20:00\",\n   \"address\": \"重庆市巴南区花溪街道\",\n   \"supplierImgUrl\": \"https://yanxuan.nosdn.127.net/38b49a2863971efec7ec9b6ad3c0f96a.png\",\n   \"introDuceText\": \"品牌也远不是强调名称，标志，符号或者商标。它融合了一系列定义其形象的独特价值，并作为一份不成文的合同，通过在消费者每一次购买，使用，体验是提供始终如一的产品和服务。\",\n   \"supplierList\": [\n      {\n         \"goodsId\": \"3469\",\n         \"goodsMiniPrice\": \"2800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/65a7ae2867d891a241dd8291a9037c84.png\"\n      },\n      {\n         \"goodsId\": \"3465\",\n         \"goodsMiniPrice\": \"3800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/cc507ff0ce7cafc1012885a01fb1942a.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/4628932649a190c464d138c9236591fa.png\"\n      },\n      {\n         \"goodsId\": \"3469\",\n         \"goodsMiniPrice\": \"2800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/d04070745e3e6b7588aba519d48ad9d6.png\"\n      },\n      {\n         \"goodsId\": \"3465\",\n         \"goodsMiniPrice\": \"3800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/dd9cd8d2dae44d4319ab21919021435b.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/567f5588c5c86eeca8c94413d7c45e47.png\"\n      },\n      {\n         \"goodsId\": \"3469\",\n         \"goodsMiniPrice\": \"2800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/c8af5398744d2ed87d2459ec3d29d83e.png\"\n      },\n      {\n         \"goodsId\": \"3465\",\n         \"goodsMiniPrice\": \"3800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/09f2f2e348111984dd2c65dd8bcbf5d8.png\"\n      },\n      {\n         \"goodsId\": \"3455\",\n         \"goodsMiniPrice\": \"4800\",\n         \"goodsName\": \"顾家家居 布艺懒人沙发 \",\n         \"goodsPicUrl\": \"https://yanxuan.nosdn.127.net/0001332cb0db9939076f56c1dddbad26.png\"\n      }\n   ]\n}
    ''';
    final resp = json.decode(data);
    return SupplierModel.fromJson(resp);
  }
}
