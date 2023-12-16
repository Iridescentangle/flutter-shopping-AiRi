import 'package:AiRi/components/components.dart';
import 'package:AiRi/pages/home/home_controller.dart';
import 'package:AiRi/router/app_pages.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:AiRi/pages/home/components/brand_swiper.dart';
import 'package:AiRi/pages/home/components/commodity_category.dart';
import 'package:AiRi/pages/home/components/head_swiper.dart';
import 'package:AiRi/pages/main/components/preload_images.dart';
import 'package:AiRi/styles/colors.dart';
import 'home_model.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.None,
      actions: <Widget>[AppBarShopCartIconButton()],
      title: '首页',
      centerTitle: true,
      body: HomePageContainer(),
    );
  }
}

class HomePageContainer extends StatefulWidget {
  @override
  _HomePageContainerState createState() => _HomePageContainerState();
}

class _HomePageContainerState extends State<HomePageContainer> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return controller.loading
          ? MyLoadingWidget()
          : Container(
              color: AppColors.primaryBackground,
              child: GestureDetector(
                onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
                child: SmartRefresher(
                  controller: controller.refreshController,
                  enablePullUp: true,
                  onRefresh: () => controller.initData(refresh: true),
                  onLoading: controller.loadData,
                  header: WaterDropMaterialHeader(),
                  footer: MyCustomFooter(),
                  child: CustomScrollView(
                    slivers: <Widget>[
                          // 预加载图片
                          SliverToBoxAdapter(
                            child: Container(
                              height: 0,
                              child: PreloadImages(),
                            ),
                          ),

                          /// 搜索框
                          SliverToBoxAdapter(
                            child:
                                // title: '搜索', keyword: value
                                SearchBar(
                              myOntap: (value) => Get.toNamed(AppRoutes.Search, arguments: {
                                'title': '搜索',
                                'keyword': value,
                              }),
                            ),
                          ),

                          /// 顶部轮播图
                          SliverToBoxAdapter(
                            child: HeadSwiper(
                              bannerList: controller.banerList,
                            ),
                          ),

                          /// 商品分类区域
                          SliverToBoxAdapter(
                            child: CommodityCateGory(cateGoryList: controller.cateGoryList),
                          ),

                          /// 品牌轮播区域
                          SliverToBoxAdapter(
                            child: BrandSwiper(brandList: controller.brandList),
                          ),

                          /// 热销商品区域
                        ] +
                        _hotCommodity(controller.hotList),
                  ),
                ),
              ),
            );
    });
  }

  /// 热销商品区域
  List<Widget> _hotCommodity(List<GoodsList> hotList) {
    return [
      SliverToBoxAdapter(
        child: Container(
            height: 44,
            margin: EdgeInsets.only(left: 15, right: 15, top: 15),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryBackground,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5),
                topRight: Radius.circular(5),
              ),
            ),
            child: LeftTitle(
              tipColor: AppColors.primaryColor,
              title: '热销商品',
            )),
      ),
      SliverToBoxAdapter(
        child: Container(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Wrap(
            spacing: 8.0, // 主轴(水平)方向间距
            runSpacing: 10.0, // 纵轴（垂直）方向间距
            alignment: WrapAlignment.start, //沿主轴方向居中
            direction: Axis.horizontal,
            children: hotList.map<Widget>(
              (item) {
                return CommdityItemHome(goodData: item);
              },
            ).toList(),
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          margin: EdgeInsets.only(left: 15, right: 15),
          height: 15,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5),
              bottomRight: Radius.circular(5),
            ),
          ),
          child: null,
        ),
      ),
    ];
  }
}
