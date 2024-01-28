import 'package:blocmarket/bloc/product_bloc.dart';
import 'package:blocmarket/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;
  List<Map<String, dynamic>> menu = [
    {
      'name': 'Semua',
    },
    {
      'name': 'property',
    },
    {
      'name': 'elektronik',
    },
    {
      'name': 'promo 50%',
    },
    {
      'name': 'lainnya',
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            size: 24.0,
          ),
        ),
        actions: [
          const Badge(
            label: Text(
              "4",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            child: Icon(Icons.notifications_active_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.person_outlined,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          context.read<ProductBloc>().add(GetProductEvent());
        },
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.only(left: 20, right: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "BLOC MARKET",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add_shopping_cart_outlined,
                        size: 24.0,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 30,
                      child: ListView.builder(
                        itemCount: menu.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          var item = menu[index];
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            borderRadius: const BorderRadius.all(
                              Radius.circular(16.0),
                            ),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              margin: const EdgeInsets.only(right: 10.0),
                              decoration: BoxDecoration(
                                color: index == selected
                                    ? Colors.black
                                    : Colors.grey.withOpacity(0.5),
                                borderRadius: const BorderRadius.all(
                                  Radius.circular(16.0),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  item["name"],
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: index == 0
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                    fontSize: 13.0,
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
                BlocBuilder<ProductBloc, ProductState>(
                  builder: (context, state) {
                    if (state is ProductLoading) {
                      return const Center(
                          child: CircularProgressIndicator(
                        color: Colors.grey,
                      ));
                    } else if (state is ProductSuccess) {
                      return SingleChildScrollView(
                        controller: ScrollController(),
                        child: GridView.builder(
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 0.7,
                            crossAxisCount: 2,
                            mainAxisSpacing: 6,
                            crossAxisSpacing: 6,
                          ),
                          itemCount: state.products.length,
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemBuilder: (BuildContext context, int index) {
                            return ItemWidget(
                                productModel: state.products[index]);
                          },
                        ),
                      );
                    }
                    return const Expanded(
                      child: Center(
                        child: Text(
                          "no data",
                          style: TextStyle(
                            fontSize: 10.0,
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
