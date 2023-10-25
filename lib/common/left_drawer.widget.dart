import 'package:bingus_bongus/common/constants.dart';
import 'package:bingus_bongus/common/providers.dart';
import 'package:bingus_bongus/common/text.constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        backgroundColor: BingusBongusConstants.bingusBongusBlack,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: BingusBongusConstants.bingusBongusBlack),
              child: Text(BingusBongusText.title),
            ),
            Consumer(
              builder: (BuildContext context, WidgetRef ref, Widget? child) {
                return ListTile(
                  title: Text(BingusBongusText.logout.toUpperCase(), style: BingusBongusConstants.defaultAppBarWhiteTextStyle),
                  onTap: () => BingusBongusConstants.logout(context, ref),
                );
              },
            ),
            if (kDebugMode) ..._devControls(context),
          ],
        ),
      );

  List<Widget> _devControls(BuildContext context) => [
        const ListTile(
          title: Text(BingusBongusText.devControls, style: BingusBongusConstants.defaultAppBarWhiteTextStyle),
          style: ListTileStyle.list,
          iconColor: Colors.red,
          tileColor: Colors.red,
        ),
        Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final bool devicePreviewEnabled = ref.watch(devicePreviewProvider);
            return ListTile(
              title: Row(
                children: [
                  const Text(BingusBongusText.devicePreview, style: BingusBongusConstants.defaultAppBarWhiteTextStyle),
                  Switch(
                    value: devicePreviewEnabled,
                    activeColor: Colors.red,
                    onChanged: (bool value) => ref.read(devicePreviewProvider.notifier).state = value,
                  ),
                ],
              ),
              onTap: () => ref.read(devicePreviewProvider.notifier).state = !ref.read(devicePreviewProvider),
            );
          },
        ),
      ];
}
