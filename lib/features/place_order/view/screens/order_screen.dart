import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/router/app_route.dart';
import '../../../login/view/widgets/TextFormField.dart';
import '../../cubit/order_cubit.dart';
import '../widgets/oreder_now.dart';
import '../widgets/summary_item.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OrderCubit(),
      child: const OrderScreenBody(),
    );
  }
}


class OrderScreenBody extends StatefulWidget {
  const OrderScreenBody({Key? key}) : super(key: key);

  @override
  State<OrderScreenBody> createState() => _OrderScreenBodyState();
}

class _OrderScreenBodyState extends State<OrderScreenBody> {
  final addressController = TextEditingController();
  final phoneController = TextEditingController();
  late OrderCubit cubit;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cubit = OrderCubit.get(context)
      ..getGovernorate()
      ..checkout();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Order Details'),
        centerTitle: true,
      ),
      body: BlocConsumer<OrderCubit, OrderState>(
        listener: (context, state) {
          if(state is PlaceOrderSuccessfully){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Ordered Successfully'),
                duration: Duration(seconds: 1),
                showCloseIcon: true,
              ),
            );
            Navigator.pushNamedAndRemoveUntil(context, AppRoute.homeScreen, (route) => false);
          }
          if(state is PlaceOrderError){
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Something Went Wrong'),
                duration: Duration(seconds: 1),
                showCloseIcon: true,
              ),
            );
          }

        },
        builder: (context, state) {
          if (cubit.items.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CheckoutError) {
            return const Center(child: Text('Error getting data'));
          }
          addressController.text=cubit.checkoutModel!.data!.user!.address!;
          phoneController.text=cubit.checkoutModel!.data!.user!.phone!;
          return Padding(
            padding:  EdgeInsets.all(4.w),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 1.h,),
                  CustomTextFormField(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: 'Address',
                    controller: addressController,
                    hintText: 'Address',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'address must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  CustomTextFormField(
                    autoValidateMode: AutovalidateMode.onUserInteraction,
                    labelText: 'Phone',
                    controller: phoneController,
                    hintText: 'Phone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'address must not be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 2.h,
                  ),

                  DropdownButtonFormField(
                      decoration: const InputDecoration(
                        labelText: 'Select Governorate',
                        border: OutlineInputBorder(),
                      ),
                      items: cubit.governorates
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item.id.toString(),
                            child: Text(item.governorateNameEn!),
                          ))
                          .toList(),

                      onChanged: (value) {
                        cubit.updateId(value!);
                      }),
                  SizedBox(height: 1.h,),
                  Text('Summary',
                  style: Theme.of(context).textTheme.headlineSmall,
                  ),

                  ListView.separated(
                    shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) =>
                          SummaryItem(item: cubit.items[index],),
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 2.h,),
                      itemCount: cubit.items.length),



                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar:   PlaceOrder(phoneController: phoneController, addressController: addressController,),
    );
  }
}
