import 'package:arcadia_app/gen/gen.dart';
import 'package:arcadia_app/l10n/app_localizations.dart';
import 'package:arcadia_app/main.dart';
import 'package:arcadia_app/style/colors.dart';
import 'package:arcadia_app/widgets/slide.dart';
import 'package:flutter/material.dart';
import 'package:flutter_arc_text/flutter_arc_text.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum InfoOption {
  sismic,
  cargo,
  oil,
  whale,
  plane,
  chat,
  ear,
}

class Slide25 extends HookConsumerWidget {
  const Slide25({
    super.key,
    required this.currentSlide,
    required this.onAudioEnd,
  });

  final int currentSlide;
  final VoidCallback onAudioEnd;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final info = useState<InfoOption?>(null);
    final locale = ref.watch(localeProvider);
    return Slide(
      slide: 25,
      currentSlide: currentSlide,
      audioPath: locale.languageCode == 'en'
          ? Assets.audios.en.slide25
          : Assets.audios.pt.slide25,
      onAudioEnd: onAudioEnd,
      propsBuilder: (context, controller) {
        final l10n = AppLocalizations.of(context)!;
        const reverseCurve = Interval(0, 1, curve: Curves.easeOut);
        final whaleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0, 0.1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final boatsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.1, 0.2, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final peopleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.2, 0.3, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final chartCicleOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.3, 0.4, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final chartOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.4, 0.5, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final chartExtrasOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final letsOpacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.5, 0.6, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final infoCircle1Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.7, 0.8, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final infoCircle2Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.8, 0.9, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );
        final infoCircle3Opacity = Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: controller,
            curve: const Interval(0.9, 1, curve: Curves.easeIn),
            reverseCurve: reverseCurve,
          ),
        );

        return [
          Positioned(
            left: 176,
            top: 497.5,
            child:
                Assets.images.props.slide25Whale.image(opacity: whaleOpacity),
          ),
          Positioned(
            left: 173,
            top: 313,
            child:
                Assets.images.props.slide25Boats.image(opacity: boatsOpacity),
          ),
          Positioned(
            left: 555,
            top: 505,
            child:
                Assets.images.props.slide25People.image(opacity: peopleOpacity),
          ),
          Positioned(
            left: 1008,
            top: 178,
            child: FadeTransition(
              opacity: chartCicleOpacity,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.orange20,
                ),
                child: SizedBox(
                  width: 553,
                  height: 553,
                  child: Column(
                    children: [
                      const SizedBox(height: 60),
                      Text(
                        l10n.soundVolumes,
                        style: const TextStyle(
                          fontFamily: FontFamily.poppins,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                          height: 1.2,
                          color: AppColors.darkBlue,
                        ),
                      ),
                      const SizedBox(height: 15),
                      FadeTransition(
                        opacity: chartOpacity,
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  l10n.decibels,
                                  style: const TextStyle(
                                    fontFamily: FontFamily.poppins,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15,
                                    height: 1.2,
                                    color: AppColors.darkBlue50,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(width: 18),
                              DefaultTextStyle(
                                style: const TextStyle(
                                  fontFamily: FontFamily.poppins,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                  height: 1.2,
                                  color: AppColors.darkBlue,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: const [
                                    SizedBox(height: 42),
                                    Text('250'),
                                    Spacer(),
                                    Text('200'),
                                    Spacer(),
                                    Text('150'),
                                    Spacer(),
                                    Text('100'),
                                    Spacer(),
                                    Text('50'),
                                    Spacer(),
                                    Text('0'),
                                    SizedBox(height: 63),
                                  ],
                                ),
                              ),
                              const SizedBox(width: 5),
                              Stack(
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 50),
                                    child: Assets.images.props.slide25Chart
                                        .image(),
                                  ),
                                  Positioned(
                                    top: 0,
                                    left: 48,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.sismic) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.sismic;
                                          }
                                        },
                                        child: Positioned.fill(
                                          top: 5,
                                          child: Assets
                                              .images.props.slide25Sismic
                                              .image(fit: BoxFit.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 80,
                                    left: 81,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.cargo) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.cargo;
                                          }
                                        },
                                        child: Positioned.fill(
                                          bottom: 8,
                                          child: Assets
                                              .images.props.slide25Cargo
                                              .image(),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 116,
                                    left: 124,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.oil) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.oil;
                                          }
                                        },
                                        child: Positioned.fill(
                                          left: 4,
                                          bottom: 5,
                                          child: Assets.images.props.slide25Oil
                                              .image(fit: BoxFit.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 170,
                                    left: 145,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.whale) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.whale;
                                          }
                                        },
                                        child: Positioned.fill(
                                          right: 6,
                                          child: Assets
                                              .images.props.slide25MiniWhale
                                              .image(fit: BoxFit.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 220,
                                    left: 148,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.plane) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.plane;
                                          }
                                        },
                                        child: Positioned.fill(
                                          bottom: 6,
                                          child: Assets
                                              .images.props.slide25Airplane
                                              .image(fit: BoxFit.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    top: 290,
                                    left: 78,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.chat) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.chat;
                                          }
                                        },
                                        child: Positioned.fill(
                                          left: 6,
                                          bottom: 2,
                                          child: Assets.images.props.slide25Chat
                                              .image(fit: BoxFit.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 176,
                                    bottom: 15,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: _InfoButton(
                                        onTap: () {
                                          if (info.value == InfoOption.ear) {
                                            info.value = null;
                                          } else {
                                            info.value = InfoOption.ear;
                                          }
                                        },
                                        child: Positioned.fill(
                                          child: Assets
                                              .images.props.slide25EarDanger
                                              .image(fit: BoxFit.none),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    right: 0,
                                    top: 15,
                                    child: FadeTransition(
                                      opacity: chartExtrasOpacity,
                                      child: Column(
                                        children: [
                                          Assets.images.props.slide25Click
                                              .image(),
                                          const SizedBox(height: 8),
                                          Text(
                                            l10n.clickOnIcons,
                                            style: const TextStyle(
                                              fontFamily: FontFamily.poppins,
                                              fontSize: 15,
                                              height: 1.1,
                                              color: AppColors.red,
                                            ),
                                            textAlign: TextAlign.center,
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(width: 35),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 1248,
            top: 711,
            child: Assets.images.props.slide25Arrow.image(opacity: letsOpacity),
          ),
          Positioned(
            left: 1155,
            top: 1135,
            child: FadeTransition(
              opacity: letsOpacity,
              child: ArcText(
                radius: 300,
                text: l10n.letsReduce,
                textStyle: const TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  fontSize: 39,
                  color: AppColors.blue,
                  height: 1.1,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1155,
            top: 1135,
            child: FadeTransition(
              opacity: letsOpacity,
              child: ArcText(
                radius: 300,
                text: l10n.theNoise,
                placement: Placement.inside,
                textStyle: const TextStyle(
                  fontFamily: FontFamily.quotesScript,
                  fontSize: 39,
                  color: AppColors.blue,
                  height: 1.1,
                ),
              ),
            ),
          ),
          Positioned(
            left: 1343,
            top: 679,
            child: FadeTransition(
              opacity: infoCircle1Opacity,
              child: _InfoCircle(
                radius: 90,
                title: l10n.lets1Label,
                text: l10n.lets1Text,
              ),
            ),
          ),
          Positioned(
            left: 1523,
            top: 583,
            child: FadeTransition(
              opacity: infoCircle2Opacity,
              child: _InfoCircle(
                radius: 92,
                title: l10n.lets2Label,
                text: l10n.lets2Text,
              ),
            ),
          ),
          Positioned(
            left: 1512,
            top: 781,
            child: FadeTransition(
              opacity: infoCircle3Opacity,
              child: _InfoCircle(
                radius: 100,
                title: l10n.lets3Label,
                text: l10n.lets3Text,
              ),
            ),
          ),
          if (info.value == InfoOption.sismic)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.seismicAirGun,
                dB: 255,
              ),
            )
          else if (info.value == InfoOption.cargo)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.containerShip,
                dB: 198,
              ),
            )
          else if (info.value == InfoOption.oil)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.offshoreDrillRig,
                dB: 185,
              ),
            )
          else if (info.value == InfoOption.whale)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.blueWhaleDB,
                dB: 165,
              ),
            )
          else if (info.value == InfoOption.plane)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.jetEngine,
                dB: 140,
              ),
            )
          else if (info.value == InfoOption.chat)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.talkingToFriend,
                dB: 60,
              ),
            )
          else if (info.value == InfoOption.ear)
            Positioned(
              left: 1400,
              top: 450,
              child: _DBInfoCircle(
                title: l10n.painfulHumanEar,
                dB: 130,
              ),
            )
        ];
      },
    );
  }
}

class _InfoCircle extends StatelessWidget {
  const _InfoCircle({
    required this.radius,
    required this.title,
    required this.text,
  });

  final double radius;
  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.orange30,
        border: Border.all(
          color: AppColors.orange,
          width: 4,
        ),
      ),
      child: SizedBox(
        width: radius * 2,
        height: radius * 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.bold,
                fontSize: 21,
                height: 1.2,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 2),
            Text(
              text,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontSize: 17,
                height: 1.2,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoButton extends StatelessWidget {
  const _InfoButton({
    required this.child,
    this.onTap,
  });

  final Widget child;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Material(
            type: MaterialType.circle,
            color: AppColors.white,
            child: SizedBox(
              width: 30,
              height: 30,
              child: InkWell(
                onTap: onTap,
                customBorder: const CircleBorder(),
              ),
            ),
          ),
          IgnorePointer(
            child: SizedBox(
              width: 50,
              height: 50,
              child: Stack(
                children: [
                  child,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _DBInfoCircle extends StatelessWidget {
  const _DBInfoCircle({
    required this.title,
    required this.dB,
  });

  final String title;
  final int dB;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white,
        border: Border.all(
          color: AppColors.lightBlue,
          width: 2,
        ),
      ),
      child: SizedBox(
        width: 130,
        height: 130,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontSize: 16,
                height: 1.2,
                color: AppColors.darkBlue,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 5),
            Text(
              '${dB}dB',
              style: const TextStyle(
                fontFamily: FontFamily.poppins,
                fontWeight: FontWeight.bold,
                fontSize: 16,
                height: 1.2,
                color: AppColors.lightBlue,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
