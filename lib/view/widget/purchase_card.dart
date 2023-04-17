import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sfac_project/model/purchase.dart';
import 'package:sfac_project/util/app_color.dart';
import 'package:sfac_project/util/app_text_style.dart';

class PurchaseCard extends StatelessWidget {
  const PurchaseCard(
      {super.key, required this.purchase, required this.productIndex});

  final Purchase purchase;
  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      padding: const EdgeInsets.symmetric(horizontal: 46, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 9,
              offset: const Offset(0, 6), // changes position of shadow
            ),
          ]),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(13),
            child: Image.network(
              purchase.shoppingBasket[productIndex].product.imageUrl,
              width: 86,
              height: 120,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    style: AppTextStyle.bKorPreRegular16,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    purchase.shoppingBasket[productIndex].product.productName,
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        style: AppTextStyle.hKorPreSemiBold16(),
                        '${NumberFormat('###,###').format(purchase.shoppingBasket[productIndex].product.price * purchase.shoppingBasket[productIndex].quantity)} 원',
                      ),
                      const SizedBox(width: 14),
                      Text(
                        style: AppTextStyle.bKorPreRegular12(
                            color: AppColor.subDarkGrey),
                        purchase.shoppingBasket[productIndex].selectedOption ??
                            '',
                      ),
                    ],
                  ),
                  Expanded(child: SizedBox()),
                  Text(
                    style: AppTextStyle.hKorPreSemiBold18(
                        color: AppColor.mainBlue),
                    purchase.state,
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
