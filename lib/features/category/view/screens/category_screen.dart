import 'package:book_store_app/core/Theme/styles.dart';
import 'package:book_store_app/features/category/cubit/category_cubit.dart';
import 'package:book_store_app/features/category/view/widgets/category_item.dart';
import 'package:book_store_app/features/home/model/get_all_categoriesModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class CategoryScreen extends StatelessWidget {
  final AllCategories category;

  const CategoryScreen({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoryCubit(),
      child: CategoryScreenBody(category: category),
    );
  }
}

class CategoryScreenBody extends StatefulWidget {
  final AllCategories category;

  const CategoryScreenBody({required this.category, super.key});

  @override
  State<CategoryScreenBody> createState() => _CategoryScreenBodyState();
}

class _CategoryScreenBodyState extends State<CategoryScreenBody> {
  late CategoryCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = CategoryCubit.get(context)
      ..getAllCategory(id: widget.category.id.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all( 4.w),
          child: SingleChildScrollView(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.category.name!,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: AppTheme.kPrimaryColor),
                ),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategoryError) {
                      return const Center(child: Text('Error getting data'));
                    }
                    return ListView.builder(
                      physics:const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: cubit.categoryItems.length,
                      itemBuilder: (context, index) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CategoryItem(
                              category: cubit.categoryItems[index])),
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
