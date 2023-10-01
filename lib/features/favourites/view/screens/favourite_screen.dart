import 'package:book_store_app/features/favourites/cubit/favourite_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/enums.dart';
import '../../../home/view/widgets/coustom_bottom_nav_bar.dart';
import '../widgets/favourite_item.dart';

class FavouriteScreen extends StatelessWidget {

  const FavouriteScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FavouriteCubit(),
      child: const FavouriteScreenBody(),
    );
  }
}

class FavouriteScreenBody extends StatefulWidget {
  const FavouriteScreenBody({Key? key}) : super(key: key);

  @override
  State<FavouriteScreenBody> createState() => _FavouriteScreenBodyState();
}

class _FavouriteScreenBodyState extends State<FavouriteScreenBody> {
  late FavouriteCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = FavouriteCubit.get(context)
      ..getFavouriteItems();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favourites"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Text(
                //   'Favourites',
                //   style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.kPrimaryColor),
                // ),
                BlocBuilder<FavouriteCubit, FavouriteState>(
                  builder: (context, state) {
                    if (state is GetFavouriteItemsLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetFavouriteItemsErrorState) {
                      return const Center(child: Text('Error getting data'));
                    }
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.favouriteItems.length,
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: FavouriteItem(
                              product: cubit.favouriteItems[index])),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
          const CustomBottomNavBar(selectedMenu: MenuState.favourite),
    );
  }
}
