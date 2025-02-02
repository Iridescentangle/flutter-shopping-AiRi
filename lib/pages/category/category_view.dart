import 'package:AiRi/components/components.dart';
import 'package:AiRi/router/app_pages.dart';
import 'package:flutter/material.dart' hide SearchBar;
import 'package:get/get.dart';
import 'category_controller.dart';
import 'components/menue.dart';
import 'components/right_list_view.dart';

class CategoryPage extends GetView<CategoryController> {
  const CategoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      leadType: AppBarBackType.None,
      actions: <Widget>[AppBarShopCartIconButton()],
      title: '分类',
      body: Category(),
    );
  }
}

class Category extends StatefulWidget {
  Category({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => CategoryState();
}

class CategoryState extends State<Category> with AutomaticKeepAliveClientMixin {
  int currentPage = 0;
  GlobalKey<RightListViewState> rightListviewKey = new GlobalKey<RightListViewState>();
  GlobalKey<CategoryMenueState> categoryMenueKey = new GlobalKey<CategoryMenueState>();

  bool isAnimating = false;
  int itemCount = 0;
  late double menueWidth;
  late double itemHeight;
  late double height;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    final double statusBarHeight = MediaQuery.of(context).padding.top; // 顶部状态栏高度
    final double bottomBarHeight = MediaQuery.of(context).padding.bottom; // 底部状态栏高度
    final double scafoldHeight = 44; // Scafold高度
    final double searchBarHeight = 49; // 搜索框的高度
    final double bottomTabbarHeight = 49; // 底部tabBar的高度
    final double rightListViewHeight = MediaQuery.of(context).size.height -
        statusBarHeight -
        bottomBarHeight -
        scafoldHeight -
        searchBarHeight -
        bottomTabbarHeight;

    return GetBuilder<CategoryController>(builder: (controller) {
      return controller.loading.value
          ? MyLoadingWidget()
          : Container(
              color: Color(0xFFFFFFFF),
              child: Column(
                children: <Widget>[
                  SearchBar(
                    myOntap: (value) => Get.toNamed(AppRoutes.Search, arguments: {
                      'title': '搜索',
                      'keyword': value,
                    }),
                  ),
                  Expanded(
                    child: Row(
                      children: <Widget>[
                        SingleChildScrollView(
                          child: Container(
                            color: Color(0xFFf7f7f7),
                            width: 100,
                            child: CategoryMenue(
                                key: categoryMenueKey,
                                items: controller.categoryData.map((i) {
                                  return i.name;
                                }).toList(),
                                itemHeight: 60,
                                itemWidth: 80,
                                menueTaped: menueItemTap),
                          ),
                        ),
                        RightListView(
                            key: rightListviewKey,
                            height: rightListViewHeight,
                            dataItems: controller.categoryData,
                            listViewChanged: listViewChanged)
                      ],
                    ),
                  )
                ],
              ));
    });
  }

  menueItemTap(int i) {
    rightListviewKey.currentState!.jumpTopage(i);
  }

  listViewChanged(i) {
    this.categoryMenueKey.currentState!.moveToTap(i);
  }

  @override
  bool get wantKeepAlive => true;
}
