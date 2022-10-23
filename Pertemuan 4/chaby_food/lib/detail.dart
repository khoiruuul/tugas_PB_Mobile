import 'package:chaby_food/resep.dart';
import 'package:flutter/material.dart';

class Detail extends StatelessWidget {
  final RestaurantModel resep;
  const Detail({
    super.key,
    required this.resep,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chaby\'s Food'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 25,
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              resep.image,
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: 15,
          ),
          Row(
            children: [
              Container(
                width: 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    resep.nama,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(resep.lokasi,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                ],
              ),
              Container(
                width: 190,
              ),
              const Icon(
                Icons.star,
                size: 30,
                color: Colors.orange,
              ),
              Container(
                width: 10,
              ),
              Text(
                resep.rating,
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(25),
            child: Text(
              resep.keterangan,
              style: const TextStyle(
                fontSize: 15,
              ),
              softWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
