import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bingus_bongus/common/providers.dart';
import 'package:hive/hive.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../util/env.dart';
import '../util/storage.service.dart';

class BingusBongusConstants {
  static const double maxAppWidth = 1024;
  static const double appWidthGutterOffset = 2;
  static const double maxBodyWidth = 940;
  static const double logoHeight = 45;
  static const double defaultPadding = 15;
  static const double defaultOrdersPadding = 50;
  static const double brandLogoWidth = 75;
  static const double brandLogoHeight = 43;
  static const double orderCardHeaderItemWidth = 110;
  static const double carouselMaxHeight = 400;
  static const double carouselAnchor = 0;
  static const bool carouselCenter = false;
  static const double carouselVelocityFactor = 0.8;
  static const double carouselItemExtent = 315;
  static const double maxPadding = 80.0;
  static const double carouselRatio = carouselItemExtent / maxPadding;
  static const double carouselDefaultImageMaxWidth = 300;
  static const double modalWidth = 330;
  static const double modalHeight = 400;
  static const double modalSeparatorHeight = 40;
  static const double defaultAppBarLetterSpacing = 2.5;
  static const double defaultTitleLetterSpacing = 1.5;
  static const double defaultTitleFontSize = 18;
  static const double defaultTextFontSize = 14;

  static bingusBongusSpacer({factor = 1}) => SizedBox(height: factor * 10);
  static const int bingusBongusYellowNumber = 0xFFF5E925;
  static const int bingusBongusBlackNumber = 0xFF171618;
  static const Color bingusBongusYellow = Color(bingusBongusYellowNumber);
  static const Color bingusBongusBlack = Color(bingusBongusBlackNumber);
  static const TextStyle defaultButtonTextStyle = TextStyle(fontSize: defaultTitleFontSize, fontWeight: FontWeight.w600);
  static const TextStyle defaultMutedTextStyle = TextStyle(color: Colors.grey);
  static const TextStyle defaultBoldTextStyle = TextStyle(fontWeight: FontWeight.bold);
  static const TextStyle defaultBoldTitleTextStyle = TextStyle(fontWeight: FontWeight.w700, fontSize: defaultTitleFontSize);
  static const TextStyle defaultTitleTextStyle = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
  static const TextStyle defaultBlackTextStyle = TextStyle(color: Colors.black);
  static const TextStyle defaultWhiteTextStyle = TextStyle(color: Colors.white);
  static const TextStyle defaultBlueTextStyle = TextStyle(color: Colors.blue);
  static const TextStyle textStyleSz14Spacing1_5 = TextStyle(fontSize: defaultTextFontSize, letterSpacing: defaultTitleLetterSpacing);
  static const TextStyle defaultYellowTextStyle = TextStyle(
    color: bingusBongusYellow,
    letterSpacing: defaultTitleLetterSpacing,
    fontSize: defaultTitleFontSize,
    fontWeight: FontWeight.w200,
  );
  static final TextStyle logoTextStyle = GoogleFonts.syne(fontWeight: FontWeight.w400, color: Colors.white, fontSize: 34, letterSpacing: 2);
  static const TextStyle defaultAppBarWhiteTextStyle = TextStyle(
    fontWeight: FontWeight.w200,
    color: Colors.white,
    fontSize: defaultTitleFontSize,
    letterSpacing: defaultAppBarLetterSpacing,
  );
  static const Color defaultCardBorderColor = Colors.black12;

  static const OutlineInputBorder defaultInputBorder =
      OutlineInputBorder(borderSide: BorderSide(color: Colors.black), borderRadius: BorderRadius.all(Radius.circular(0)));

  static final BorderRadius defaultBorderRadius = BorderRadius.circular(0);
  static final BorderRadius defaultModalBorderRadius = BorderRadius.circular(0);

  static final DateFormat month = DateFormat('MMMM');
  static final DateFormat defaultDateFormat = DateFormat('MMMM dd, yyyy');
  static final DateFormat orderDetailsDateFormat = DateFormat.MMMMd();

  static final List<BingusBongusAdapter> HiveAdapters = [
    // BingusBongusAdapter<OtpRequestDto>(BingusBongusAdapterNames.userEmailAdapter, OtpRequestDtoImplAdapter()),
    // BingusBongusAdapter<OtpAuthenticateResponseDto>(BingusBongusAdapterNames.authTokenAdapter, OtpAuthenticateResponseDtoImplAdapter()),
  ];

  static const String paymentFailedStatus = "PAYMENT_FAILED";

  static final Future<bool> launchSupportEmail = launchUrlString('mailto:${Env.supportEmail}');

  static logout(BuildContext context, WidgetRef ref) {
    ref.read(isAuthenticatedProvider.notifier).state = false;
    StorageService().clearAuth();
    // BingusBongusRoute.login.go(context);
  }
}

enum BingusBongusFormFields {
  email,
  emailOrPhone,
  otp,
  reason;
}

enum BingusBongusAdapterNames {
  userEmailAdapter(),
  authTokenAdapter();

  @override
  String toString() => name;
}

enum BingusBongusHiveBoxes {
  defaultBox('default'),
  auth('auth');

  const BingusBongusHiveBoxes(this.path);

  final String path;

  @override
  String toString() => path;
}

class BingusBongusAdapter<T> {
  BingusBongusAdapter(BingusBongusAdapterNames adapterName, this.adapter) {
    name = adapterName.toString();
    Hive.registerAdapter<T>(adapter);
  }

  late final String name;

  Type get type => T;
  final TypeAdapter<T> adapter;

  @override
  String toString() => name;
}

enum HiveFields {
  auth,
}
