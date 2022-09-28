import 'package:bakery_app/common/screens/common_base_class.dart';
import 'package:bakery_app/common/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../common/styles/app_themes.dart';
import '../../common/utils/arch_utils/widgets/spacing_widgets.dart';
import '../../common/utils/common_assets.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonBaseClass(
      showAppBar: true,
      showBottomWidget: true,
      bottomWidget: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 32),
                child: SvgPicture.asset(CommonAssets.favouritesIcon),
              ),
              const Flexible(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
                child: AppTextButton(text: "Add to Cart"),
              )),
            ],
          ),
        ],
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 240,
            child: Stack(
              children: [
                Positioned(
                    child: Align(
                  alignment: Alignment.topCenter,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.vertical(
                        bottom: Radius.circular(20)),
                    child: Image.asset(
                      CommonAssets.bread,
                      fit: BoxFit.fitWidth,
                      width: double.infinity,
                      height: 220,
                    ),
                  ),
                )),
                Positioned(
                  bottom: 0,
                  left: 140,
                  child: Container(
                    decoration: const BoxDecoration(
                        color: AppThemes.primary,
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 6.0),
                      child: Row(
                        children: [
                          const Icon(Icons.remove, color: AppThemes.black),
                          const HSpace(10),
                          Text("1",
                              style: Theme.of(context).textTheme.labelLarge),
                          const HSpace(10),
                          const Icon(Icons.add, color: AppThemes.black),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Flexible(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Wheat Bread",
                              style: Theme.of(context).textTheme.titleLarge),
                          Text("\$400.00",
                              style: Theme.of(context).textTheme.headlineSmall)
                        ],
                      ),
                      Row(
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  "4.2",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                              const HSpace(6),
                              const Icon(
                                Icons.star,
                                color: AppThemes.primary,
                              ),
                            ],
                          ),
                          Text(
                            "33 left",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      const VSpace(28),
                      Text("Choose Size",
                          style: Theme.of(context).textTheme.titleLarge),
                      Text("Description",
                          style: Theme.of(context).textTheme.titleLarge),
                      const ExpansionTile(
                        iconColor: AppThemes.black,
                        textColor: AppThemes.black,
                        collapsedTextColor: AppThemes.black,
                        collapsedIconColor: AppThemes.black,
                        title: Text('About'),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 8.0),
                              child: Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc maecenas tempor aliquam nunc amet morbi vitae.'),
                            ),
                          ),
                        ],
                      ),
                      const ExpansionTile(
                        iconColor: AppThemes.black,
                        textColor: AppThemes.black,
                        collapsedTextColor: AppThemes.black,
                        collapsedIconColor: AppThemes.black,
                        title: Text('Ingredient'),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc maecenas tempor aliquam nunc amet morbi vitae.'),
                          ),
                        ],
                      ),
                      const ExpansionTile(
                        iconColor: AppThemes.black,
                        textColor: AppThemes.black,
                        collapsedTextColor: AppThemes.black,
                        collapsedIconColor: AppThemes.black,
                        title: Text('Nutritional Facts'),
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Non nunc maecenas tempor aliquam nunc amet morbi vitae.'),
                          ),
                        ],
                      ),
                      Text("Ratings",
                          style: Theme.of(context).textTheme.titleLarge),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
