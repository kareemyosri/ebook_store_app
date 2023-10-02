import 'package:book_store_app/features/order_history/cubit/history_cubit.dart';
import 'package:book_store_app/features/order_history/view/widgets/history_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class OrderHistoryScreen extends StatelessWidget {

  const OrderHistoryScreen({ super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit(),
      child: const OrderHistoryBody(),
    );
  }
}

class OrderHistoryBody extends StatefulWidget {
  const OrderHistoryBody({Key? key}) : super(key: key);

  @override
  State<OrderHistoryBody> createState() => _OrderHistoryBodyState();
}

class _OrderHistoryBodyState extends State<OrderHistoryBody> {
  late HistoryCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = HistoryCubit.get(context)
      ..getOrderHistory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order History'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HistoryCubit, HistoryState>(
              builder: (context, state) {
                if(state is GetOrderHistoryLoading){
                  return const Center(child: CircularProgressIndicator());
                }
                else if (state is GetOrderHistoryError) {
                  return const Center(child: Text('Error getting data'));
                }
                return ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) =>
                        HistoryTile(order: cubit.orders[index]),

                    itemCount: cubit.orders.length
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
