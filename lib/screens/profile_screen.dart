import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await _logout(context);
            },
            icon: const Icon(
              Icons.logout,
              size: 20.0,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180.0,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    "https://www.exeter.ac.uk/media/universityofexeter/campusservices/cafes-shops/responsiveimages/INTO_Avon_Shop_scroller_interior.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: const Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.all(12.0),
                        child: CircleAvatar(
                          radius: 36.0,
                          backgroundImage: NetworkImage(
                            "https://i.ibb.co/PGv8ZzG/me.jpg",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10.0,
            ),
            const Text(
              "Menu Button",
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            LayoutBuilder(
              builder: (context, constraint) {
                List menus = [
                  {
                    "icon":
                        "https://myorder.ai/assets/image/section2/My_Order_[ICON_Website]-19.png",
                    "label": "Order",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/7/7e/Samsung_Pay_icon.svg/2048px-Samsung_Pay_icon.svg.png",
                    "label": "Pay",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://e7.pngegg.com/pngimages/38/239/png-clipart-computer-icons-icon-design-purchase-order-text-logo.png",
                    "label": "History",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://cdn.icon-icons.com/icons2/3723/PNG/512/information_account_protect_lock_password_personal_icon_230471.png",
                    "label": "Akun",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://cdn.icon-icons.com/icons2/3626/PNG/512/sale_tag_discount_voucher_icon_227316.png",
                    "label": "Voucher",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://www.shutterstock.com/image-vector/golden-coin-icon-money-symbol-260nw-1649220583.jpg",
                    "label": "Coin",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTURlFrJImuhjG70VoD-LfLAg6ATFcpuJNiDg&usqp=CAU",
                    "label": "Food",
                    "onTap": () {},
                  },
                  {
                    "icon":
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/2/23/OOjs_UI_icon_articleRedirect-ltr-progressive.svg/2048px-OOjs_UI_icon_articleRedirect-ltr-progressive.svg.png",
                    "label": "Lainnya",
                    "onTap": () {},
                  },
                ];

                return Wrap(
                  children: List.generate(
                    menus.length,
                    (index) {
                      var item = menus[index];

                      var size = constraint.biggest.width / 4;

                      return SizedBox(
                        width: size,
                        height: size,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.blueGrey,
                            animationDuration:
                                const Duration(milliseconds: 1000),
                            backgroundColor: Colors.transparent,
                            splashFactory: InkSplash.splashFactory,
                            shadowColor: Colors.transparent,
                            elevation: 0.0,
                          ),
                          onPressed: () => item["onTap"](),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.network(
                                item["icon"],
                                width: 30.0,
                              ),
                              const SizedBox(
                                height: 6.0,
                              ),
                              Text(
                                "${item["label"]}",
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  fontSize: 11.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('token');

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Logout"),
        content: const Text("Are you sure you want to logout?"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
                (route) => false,
              );
            },
            child: const Text("Logout"),
          ),
        ],
      ),
    );
  }
}
