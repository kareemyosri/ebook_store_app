import 'package:book_store_app/features/favourites/view/widgets/favourite_item.dart';
import 'package:book_store_app/features/search/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchEmpty) {
              return const Center(
                child: Text(
                  'No Results',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
            if (state is SearchLoaded) {
              return ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: SearchCubit.get(context).foundResults.length,
                itemBuilder: (context, index) {
                  return FavouriteItem(
                      product: SearchCubit.get(context).foundResults[index]);
                },
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 1.h,
                  );
                },
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ));
  }
}
