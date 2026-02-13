import 'package:e_commerce/core/widgets/custom_text_form_field.dart';
import 'package:e_commerce/features/checkout/domain/entities/order_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressInputSection extends StatefulWidget {
  final GlobalKey<FormState> formKey;
  final ValueListenable<AutovalidateMode> valueListenable;
  const AddressInputSection({
    super.key,
    required this.formKey,
    required this.valueListenable,
  });

  @override
  State<AddressInputSection> createState() => _AddressInputSectionState();
}

class _AddressInputSectionState extends State<AddressInputSection>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    var orderEntity = context.read<OrderEntity>();
    return SingleChildScrollView(
      child: ValueListenableBuilder(
        valueListenable: widget.valueListenable,
        builder: (context, value, child) => Form(
          key: widget.formKey,
          autovalidateMode: value,
          child: Column(
            spacing: 8,
            children: [
              CustomTextFormField(
                hintText: 'الاسم كامل',
                keyboardType: TextInputType.name,
                onSaved: (value) {
                  orderEntity.shippingInfo.name = value;
                },
              ),
              CustomTextFormField(
                hintText: 'رقم الهاتف',
                keyboardType: TextInputType.phone,
                onSaved: (value) {
                  orderEntity.shippingInfo.phone = value;
                },
              ),
              CustomTextFormField(
                hintText: 'البريد الالكتروني',
                keyboardType: TextInputType.emailAddress,
                onSaved: (value) {
                  orderEntity.shippingInfo.email = value;
                },
              ),
              CustomTextFormField(
                hintText: 'العنوان',
                keyboardType: TextInputType.streetAddress,
                onSaved: (value) {
                  orderEntity.shippingInfo.address = value;
                },
              ),
              CustomTextFormField(
                hintText: 'المدينة',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  orderEntity.shippingInfo.city = value;
                },
              ),
              CustomTextFormField(
                hintText: 'رقم الطابق / الشقة',
                keyboardType: TextInputType.text,
                onSaved: (value) {
                  orderEntity.shippingInfo.addressDetails = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
