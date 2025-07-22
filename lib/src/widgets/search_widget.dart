import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:explore_countries_app/src/blocs/country_cubit.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextField(
          onChanged: (value) =>
              context.read<CountryCubit>().searchCountries(value),
          decoration: const InputDecoration(
              hintText: 'Search Country',
              suffixIcon: Icon(Icons.search),
              border: InputBorder.none),
        ),
      ),
    );
  }
}
