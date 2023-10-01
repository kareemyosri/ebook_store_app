import 'package:book_store_app/features/all_books/cubit/books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/enums.dart';
import '../../../favourites/view/widgets/favourite_item.dart';
import '../../../home/view/widgets/coustom_bottom_nav_bar.dart';

class AllBooksScreen extends StatelessWidget {

  const AllBooksScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BooksCubit(),
      child: const AllBooksBody(),
    );
  }
}

class AllBooksBody extends StatefulWidget {
  const AllBooksBody({Key? key}) : super(key: key);

  @override
  State<AllBooksBody> createState() => _AllBooksBodyState();
}

class _AllBooksBodyState extends State<AllBooksBody> {
  late BooksCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = BooksCubit.get(context)
      ..getAllBooks();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Books"),
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
                BlocBuilder<BooksCubit, BooksState>(
                  builder: (context, state) {
                    if (state is GetAllBooksLoadingState) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GetAllBooksErrorState) {
                      return const Center(child: Text('Error getting data'));
                    }
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.allBooks.length,
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: FavouriteItem(
                              product: cubit.allBooks[index])),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar:
      const CustomBottomNavBar(selectedMenu: MenuState.books),
    );
  }
}
