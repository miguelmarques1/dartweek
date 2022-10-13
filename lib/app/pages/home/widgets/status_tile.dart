import 'package:dartweek/app/core/ui/styles/colors_app.dart';
import 'package:dartweek/app/core/ui/styles/text_styles.dart';
import 'package:flutter/material.dart';

class StatusTile extends StatelessWidget {

  final String title;
  final String value;
  final Image? image;

  const StatusTile({super.key, required this.image, required this.value, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: ListTile(
                        leading: SizedBox(
                          width: 46,
                           child: CircleAvatar(
                            radius: 46,
                            backgroundColor: context.colors.grey,
                            child: image,
                            ),
                            ),
                            contentPadding: EdgeInsets.zero,
                            title: Text(title,
                            style: context.textStyles.textPrimaryFontRegular.copyWith(
                              color: Colors.white
                            ),),
                            trailing: Text(value,
                            style: context.textStyles.textPrimaryFontMedium.copyWith(
                              color: Colors.white
                            ),),
                      ),
                    );
  }
}