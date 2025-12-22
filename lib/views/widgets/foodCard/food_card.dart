import 'package:flutter/material.dart';

import '../../../domain/models/food_item.dart';
import 'package:new_hrms_flutter/core/constants/app_export.dart';

class FoodCard extends StatelessWidget {
  final FoodItem item;
  final bool isCart;
  final bool isSwapTitle;

  const FoodCard({super.key, required this.item, this.isCart = true, this.isSwapTitle= false,});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return CustomContainer(
      padding: const EdgeInsets.all(8),
      borderRadius: BorderRadius.circular(6),
      decoration: BoxDecoration(
        color: AppColors.white,
        border: Border.all(color: const Color(0xFFE2E8F0)),
      ),
      onTap: () {},

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: AspectRatio(
              aspectRatio: ResponsiveTwo.imageAspectRatio(context),
              child: Image.network(item.imageUrl, fit: BoxFit.cover),
            ),
          ),

          const SizedBox(height: 8),

          if(isSwapTitle)...[
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                if(isSwapTitle)...[

                  const Text(
                    '\$25',
                    style: TextStyle(fontSize: 14, color: AppColors.greyShade, fontWeight: FontWeight.w500),
                  ),]else...[
                Text(
                  item.category.toUpperCase(),
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                ],
                const Spacer(),
                VegTag(isVeg: item.isVegetarian),
              ],
            ),
          ]else...[
            Row(
              children: [
                Text(
                  item.category.toUpperCase(),
                  style: const TextStyle(fontSize: 11, color: Colors.grey),
                ),
                const Spacer(),
                VegTag(isVeg: item.isVegetarian),
              ],
            ),
            Text(
              item.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
          ],



          const SizedBox(height: 6),



          if(isCart)...[
          Row(
            children: [
              const Text(
                '\$25',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),

              const Spacer(),
              _QtyControl(item.orders),
    ]

          ),
          ],
          SizedBox(height: 5),
        ],
      ),
    );
  }
}

class VegTag extends StatelessWidget {
  final bool isVeg;
  const VegTag( {super.key, required this.isVeg,});

  @override
  Widget build(BuildContext context) {
    final color = isVeg ? Colors.green : Colors.red;

    return Row(
      children: [

    SvgPicture.asset(
      AppAssets.veg_nonVeg_Icon,
      height: 12,
      colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
    ),

        const SizedBox(width: 4),
        Text(
          isVeg ? 'Veg' : 'Non Veg',
          style: TextStyle(
            fontSize: 10,
            fontWeight: FontWeight.w600,
            color: color,
          ),
        ),
      ],
    );
  }
}

class _QtyControl extends StatelessWidget {
  final int qty;

  const _QtyControl(this.qty);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(AppAssets.subIcon, width: 18),
        const SizedBox(width: 10),
        Text(
          '$qty',
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(width: 10),
        SvgPicture.asset(AppAssets.addIcon, width: 18),
      ],
    );
  }
}