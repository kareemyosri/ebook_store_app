import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        return AnimatedContainer(
          width: (SearchCubit.get(context).isSearching)
              ? MediaQuery.of(context).size.width * 0.72
              : MediaQuery.of(context).size.width * 0.6,
          decoration: BoxDecoration(
            color: AppTheme.kSecondaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(15),
          ),
          duration: const Duration(milliseconds: 500),
          child: TextField(
            onChanged: (value) =>
                SearchCubit.get(context).searchProduct(name: value),
            decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                hintText: "Search product",
                prefixIcon: const Icon(Icons.search)),
          ),
        );
      },
    );
  }
}
