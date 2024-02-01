// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DialogCheckOutWidget extends StatelessWidget {
  final String title;
  final int countItem;
  final String address;
  final List<String> images;
  final String phone;
  final String owner;
  final String payment;
  final double totalPrice;

  DialogCheckOutWidget({
    required this.title,
    required this.countItem,
    required this.address,
    required this.images,
    required this.phone,
    required this.owner,
    required this.payment,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.white,
      ),
      child: Wrap(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title.toString(),
                        style: const TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        foregroundColor: Colors.orange,
                        side: const BorderSide(
                          color: Colors.orange,
                        ),
                        shape: BeveledRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.money_off,
                            size: 15.0,
                          ),
                          Text("Pay")
                        ],
                      ),
                    ),
                  ],
                ),
                Text(
                  "Total Price : \$$totalPrice",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                SizedBox(
                  height: 50,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: images.length,
                    physics: const ScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        width: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white,
                        ),
                        child: Container(
                          width: 50,
                          margin: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(
                                images[index],
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                8.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Count",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Name",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Address",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Phone",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          "Pay",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 5.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          countItem.toString(),
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                        ),
                        Text(
                          owner.toString(),
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                        ),
                        Text(
                          address.toString(),
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                        ),
                        Text(
                          phone.toString(),
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                        ),
                        Text(
                          payment.toString(),
                          style: const TextStyle(
                              fontSize: 14.0, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
