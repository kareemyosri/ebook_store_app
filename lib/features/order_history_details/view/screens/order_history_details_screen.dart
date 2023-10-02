import 'package:book_store_app/features/order_history_details/cubit/details_history_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../widgets/summary_history_item.dart';

class OrderHistoryDetailScreen extends StatelessWidget {

  const OrderHistoryDetailScreen({ super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DetailsHistoryCubit(),
      child:  OrderHistoryDetailBody(id: id,),
    );
  }
}
class OrderHistoryDetailBody extends StatefulWidget {
  const OrderHistoryDetailBody({Key? key, required this.id}) : super(key: key);
  final String id;

  @override
  State<OrderHistoryDetailBody> createState() => _OrderHistoryDetailBodyState();
}

class _OrderHistoryDetailBodyState extends State<OrderHistoryDetailBody> {
  late DetailsHistoryCubit cubit;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit=DetailsHistoryCubit.get(context)
      ..showOrder(widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: BlocBuilder<DetailsHistoryCubit, DetailsHistoryState>(
        builder: (context, state) {
          if(state is ShowOrderLoading){
            return const Center(child: CircularProgressIndicator());
          }
          else if (state is ShowOrderError) {
            return const Center(child: Text('Error getting data'));
          }
          return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(4.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Order #${cubit.singleOrderModel!.data!.orderCode!}'),
                                Text('Placed on: ${cubit.singleOrderModel!.data!.orderDate!}'),
                                Text('N of items: ${cubit.items.length}'),
                                Text('Total: EGP${cubit.singleOrderModel!.data!.total!}'),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 2.h,),
                   const Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text('ITEMS IN YOUR ORDER'),
                   ),
                  SizedBox(height: 1.h,),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context,index)=>SummaryHistoryItem(item: cubit.items[index],),
                    separatorBuilder: (context,index)=>SizedBox(height: 1.h,),
                    itemCount: cubit.items.length,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text('DELIVERY'),
                  ),
                  Card(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text('Shipping Address',style: Theme.of(context).textTheme.titleSmall,),
                                Text(cubit.singleOrderModel!.data!.name!),
                                Text(cubit.singleOrderModel!.data!.address!),
                                Text(cubit.singleOrderModel!.data!.governorate!),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),


                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
