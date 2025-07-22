import 'package:explore_countries_app/src/models/country.dart';
import 'package:flutter/material.dart';

class CountryWidget extends StatelessWidget {
  final Country country;

  const CountryWidget({super.key, required this.country});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipOval(
              child: Image.network(
            'https://flagcdn.com/w40/${country.code.toLowerCase()}.png',
            width: 25,
            height: 25,
            fit: BoxFit.cover,
          )),
          const SizedBox(width: 13),
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(country.name),
                Text(country.capital ?? 'Null',
                    style: const TextStyle(fontSize: 12))
              ],
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                "+${country.phone}",
                style: const TextStyle(fontSize: 10),
              ),
            )
          ]),
          const SizedBox(width: 10),
          Expanded(
              child: Text(
            country.continent.name,
            style: const TextStyle(letterSpacing: 4),
          ))
        ],
      ),
    );
  }
}
