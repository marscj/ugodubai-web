import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:ugodubai/app/components/layout.dart';
import 'package:ugodubai/app/widgets/custom_tab.dart';
import 'package:vertical_scrollable_tabview/vertical_scrollable_tabview.dart';

import '../controllers/user_detail_controller.dart';

class UserDetailView extends GetView<UserDetailController> {
  const UserDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text('data');
    // return Layout(
    //     child: MyHomePage(
    //   title: 'User Details',
    // ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  final List<Category> data = ExampleData.data;

  // TabController More Information => https://api.flutter.dev/flutter/material/TabController-class.html
  late TabController tabController;

  // Instantiate scroll_to_index (套件提供的方法)
  late AutoScrollController autoScrollController;

  @override
  void initState() {
    tabController = TabController(length: data.length, vsync: this);
    autoScrollController = AutoScrollController();
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    autoScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: VerticalScrollableTabView(
        autoScrollController: autoScrollController,
        scrollbarThumbVisibility: false,
        tabController: tabController,
        listItemData: data,
        verticalScrollPosition: VerticalScrollPosition.begin,
        eachItemChild: (object, index) =>
            CategorySection(category: object as Category),
        slivers: [
          SliverAppBar(
            pinned: true,
            // expandedHeight: 250.0,
            // flexibleSpace: const FlexibleSpaceBar(
            //   title: Text("SliverAppBar"),
            //   titlePadding: EdgeInsets.only(bottom: 50),
            //   collapseMode: CollapseMode.pin,
            //   background: FlutterLogo(),
            // ),
            bottom: CustomTabBar(
              isScrollable: true,
              controller: tabController,
              indicatorSize: TabBarIndicatorSize.label,
              // indicatorPadding: const EdgeInsets.symmetric(horizontal: 2.0),
              indicatorColor: Theme.of(context).colorScheme.primary,
              labelColor: Theme.of(context).colorScheme.primary,
              unselectedLabelColor: Colors.black,
              indicatorWeight: 3.0,
              tabs: data.map((e) {
                return CustomTab(text: e.title)
                    .paddingSymmetric(horizontal: 20);
              }).toList(),
              onTap: (index) {
                VerticalScrollableTabBarStatus.setIndex(index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CategorySection extends StatelessWidget {
  const CategorySection({
    Key? key,
    required this.category,
  }) : super(key: key);

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      margin: const EdgeInsets.only(bottom: 16),
      color: Colors.cyanAccent.withOpacity(0.1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTileHeader(context),
          _buildFoodTileList(context),
        ],
      ),
    );
  }

  Widget _buildFoodTileList(BuildContext context) {
    return Column(
      children: List.generate(
        category.foods.length,
        (index) {
          final food = category.foods[index];
          bool isLastIndex = index == category.foods.length - 1;
          return _buildFoodTile(
            food: food,
            context: context,
            isLastIndex: isLastIndex,
          );
        },
      ),
    );
  }

  Widget _buildSectionTileHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        _sectionTitle(context),
        const SizedBox(height: 8.0),
        category.subtitle != null
            ? _sectionSubtitle(context)
            : const SizedBox(),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _sectionTitle(BuildContext context) {
    return Row(
      children: [
        if (category.isHotSale) _buildSectionHoteSaleIcon(),
        Text(
          category.title,
          style: _textTheme(context).bodyMedium,
        )
      ],
    );
  }

  Widget _sectionSubtitle(BuildContext context) {
    return Text(
      category.subtitle!,
      style: _textTheme(context).bodyMedium,
    );
  }

  Widget _buildFoodTile({
    required BuildContext context,
    required bool isLastIndex,
    required Food food,
  }) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildFoodDetail(food: food, context: context),
            _buildFoodImage(food.imageUrl),
          ],
        ),
        !isLastIndex ? const Divider(height: 16.0) : const SizedBox(height: 8.0)
      ],
    );
  }

  Widget _buildFoodImage(String url) {
    return FadeInImage.assetNetwork(
      placeholder: 'assets/transparent.png',
      image: url,
      width: 64,
    );
  }

  Widget _buildFoodDetail({
    required BuildContext context,
    required Food food,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(food.name, style: _textTheme(context).bodyMedium),
        const SizedBox(height: 16),
        Row(
          children: [
            Text(
              "特價${food.price} ",
              style: _textTheme(context).bodyMedium,
            ),
            Text(
              food.comparePrice,
              style: _textTheme(context)
                  .bodyMedium
                  ?.copyWith(decoration: TextDecoration.lineThrough),
            ),
            const SizedBox(width: 8.0),
            if (food.isHotSale) _buildFoodHotSaleIcon(),
          ],
        ),
      ],
    );
  }

  Widget _buildSectionHoteSaleIcon() {
    return Container(
      margin: const EdgeInsets.only(right: 4.0),
      child: const Icon(
        Icons.whatshot,
        color: Colors.pink,
        size: 20.0,
      ),
    );
  }

  Widget _buildFoodHotSaleIcon() {
    return Container(
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: const Icon(Icons.whatshot, color: Colors.pink, size: 16.0),
    );
  }

  TextTheme _textTheme(context) => Theme.of(context).textTheme;
}

class ExampleData {
  ExampleData._internal();

  static List<String> images = [
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
    "https://github.com/wayne900204/vertical_scrollable_tabview/blob/main/example/assets/food.jpeg?raw=true",
  ];

  static List<Category> data = [
    category1,
    category2,
    category3,
    category4,
    category4,
    category3,
    category2,
    category1,
  ];

  static Category category1 = Category(
    title: "人氣火鍋",
    subtitle: "附副餐一份，鍋類肉品「煙嶿肉、醃牛肉」，擇一",
    isHotSale: true,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "701. 超人氣泡菜鍋",
          price: "200",
          comparePrice: "\$198",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category2 = Category(
    title: "特級火鍋",
    subtitle: "附副餐一份",
    isHotSale: false,
    foods: List.generate(
      3,
      (index) {
        return Food(
          name: "706. 迷你原味鍋",
          price: "230",
          comparePrice: "\$250",
          imageUrl: images[index % images.length],
          isHotSale: index == 2 ? true : false,
        );
      },
    ),
  );

  static Category category3 = Category(
    title: "經典火鍋",
    subtitle: null,
    isHotSale: false,
    foods: List.generate(
      1,
      (index) {
        return Food(
          name: "經典火鍋",
          price: "258",
          comparePrice: "\$289",
          imageUrl: images[index % images.length],
          isHotSale: false,
        );
      },
    ),
  );

  static Category category4 = Category(
    title: "素食火鍋",
    subtitle: "附附餐一份，可烹煮為鍋邊素，若有需要請備著告知",
    isHotSale: false,
    foods: List.generate(
      5,
      (index) {
        return Food(
          name: "728. 連庭素食鍋",
          price: "240",
          comparePrice: "\$300",
          imageUrl: images[index % images.length],
          isHotSale: index == 3 ? true : false,
        );
      },
    ),
  );
}

class Category {
  String title;
  String? subtitle;
  List<Food> foods;
  bool isHotSale;

  Category({
    required this.title,
    required this.subtitle,
    required this.foods,
    required this.isHotSale,
  });
}

class Food {
  String name;
  String price;
  String comparePrice;
  String imageUrl;
  bool isHotSale;

  Food({
    required this.name,
    required this.price,
    required this.comparePrice,
    required this.imageUrl,
    required this.isHotSale,
  });
}
