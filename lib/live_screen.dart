
import 'package:flutter/material.dart';
import 'package:flutter_live_streaming_app/utils.dart';
import 'dart:math';

import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';


// Live Page Prebuilt UI from ZEGOCLOUD UIKits
class LiveScreenView extends StatelessWidget {
  final String liveID , userID;
  final bool isHost;

  LiveScreenView({
    super.key,
    required this.liveID,
    this.isHost = false,
    required this.userID
  });

  // Add your app id here and app sign in
  // Make sure you replace with your own
  // final int appID = int.parse('1388328618');
  final int appID = Utils.appId;
  final String appSign = Utils.appSignin;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: appID,
        appSign: appSign,
        userID: userID,
        userName: 'user_$userID',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host()
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience()
          ..audioVideoViewConfig.showAvatarInAudioMode = true
          ..audioVideoViewConfig.showSoundWavesInAudioMode = true,
      ),
    );
  }
}