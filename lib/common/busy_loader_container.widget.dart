import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bingus_bongus/common/providers.dart';
import 'package:bingus_bongus/util/responsive.widget.dart';

class BusyLoaderContainer extends StatelessWidget {
  final Widget child;

  const BusyLoaderContainer({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          child,
          Consumer(
            builder: (BuildContext context, WidgetRef ref, Widget? child) {
              final bool isLoading = ref.watch(isLoadingProvider);
              return IgnorePointer(
                ignoring: !isLoading,
                child: Opacity(opacity: isLoading ? 0.9 : 0, child: _spinner(context)),
              );
            },
          ),
        ],
      );

  _spinner(BuildContext context) => Container(
        height: MediaQuery.of(context).size.height,
        width: ResponsiveWidget.getMaxAppWidth(context),
        color: Colors.grey.withOpacity(0.4),
        child: const Center(child: CircularProgressIndicator()),
      );
}
