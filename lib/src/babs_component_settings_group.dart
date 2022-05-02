import 'package:babstrap_settings_screen/src/babs_component_settings_item.dart';
import 'package:babstrap_settings_screen/src/settings_screen_utils.dart';
import 'package:flutter/material.dart';

/// This component group the Settings items (BabsComponentSettingsItem)
/// All one BabsComponentSettingsGroup have a title and the developper can improve the design.
class SettingsGroup extends StatelessWidget {
  String? settingsGroupTitle;
  TextStyle? settingsGroupTitleStyle;
  List<SettingsItem> items;
  double? iconItemSize;
  Color backgroundColor;

  SettingsGroup({
    this.settingsGroupTitle,
    this.settingsGroupTitleStyle,
    required this.items,
    this.iconItemSize = 25,
    this.backgroundColor = Colors.white
  });

  @override
  Widget build(BuildContext context) {
    if (this.iconItemSize != null)
      SettingsScreenUtils.settingsGroupIconSize = iconItemSize;

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // The title
          (settingsGroupTitle != null)
              ? Padding(
                  padding: const EdgeInsets.only(left: 10, bottom: 8),
                  child: Text(
                    settingsGroupTitle!,
                    style: (settingsGroupTitleStyle == null)
                        ? TextStyle(fontSize: 25, fontWeight: FontWeight.bold)
                        : settingsGroupTitleStyle,
                  ),
                )
              : Container(),
          // The SettingsGroup sections
          Container(
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListView.separated(
              padding: EdgeInsets.zero,
              physics: ScrollPhysics(),
              separatorBuilder: (context, index) {
                return Divider();
              },
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                if (index == 0) return Padding(padding: EdgeInsets.only(top: 10), child: items[index]);
                if (index == items.length - 1) return Padding(padding: EdgeInsets.only(bottom: 5), child: items[index]);
                return items[index];
              },
              shrinkWrap: true,
            ),
          ),
        ],
      ),
    );
  }
}
