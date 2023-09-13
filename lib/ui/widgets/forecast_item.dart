import 'package:flutter/material.dart';
import 'package:task/common/constants.dart';
import 'package:task/common/utils.dart';
import 'package:task/core/extension/locale.dart';
import 'package:task/core/extension/localizations.dart';
import 'package:task/core/theme/app_font_style.dart';
import 'package:task/domain/models/models.dart';

class ForecastItem extends StatelessWidget {
  const ForecastItem({
    super.key,
    required this.item,
  });

  final ListItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: Colors.grey.shade300,
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 10),
            width: 80,
            height: 80,
            child: FadeInImage(
              placeholderFit: BoxFit.cover,
              placeholder: const AssetImage(
                'assets/images/placeholder.png',
              ),
              image: NetworkImage(
                '$baseUrlImage/img/wn/${item.weather.first.icon}@2x.png',
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    Utils.convertDate(
                      item.dt * 1000,
                      context.locale.languageCode,
                    ),
                    style: AppFontStyles.robotoBlack16w400,
                  ),
                  const SizedBox(height: 5),
                  Text(item.weather.first.description),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(
                        Icons.arrow_upward,
                        color: Colors.red,
                      ),
                      Text('${item.main.tempMax}ºC'),
                      const SizedBox(width: 20),
                      const Icon(
                        Icons.arrow_downward,
                        color: Colors.blue,
                      ),
                      Text('${item.main.tempMin}ºC')
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(
                        '${item.main.temp} ºC',
                        style: AppFontStyles.robotoBlack20w700,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '-',
                        style: AppFontStyles.robotoBlack20w700,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        '${item.main.humidity}% ${context.localizations.humidity}',
                        style: AppFontStyles.robotoBlack20w700,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
