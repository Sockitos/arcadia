
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pt.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations returned
/// by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pt')
  ];

  /// No description provided for @whalesDoWhat.
  ///
  /// In en, this message translates to:
  /// **'Whales\ndo what?'**
  String get whalesDoWhat;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @sources.
  ///
  /// In en, this message translates to:
  /// **'Sources'**
  String get sources;

  /// No description provided for @youreHere.
  ///
  /// In en, this message translates to:
  /// **'You\'re\nhere'**
  String get youreHere;

  /// No description provided for @twoLeggedCreatures.
  ///
  /// In en, this message translates to:
  /// **'Two-legged\nCreatures'**
  String get twoLeggedCreatures;

  /// No description provided for @populationOverTime.
  ///
  /// In en, this message translates to:
  /// **'Blue Whale population\nover time'**
  String get populationOverTime;

  /// No description provided for @commercialWhalingPeak.
  ///
  /// In en, this message translates to:
  /// **'Commercial\nwhaling\npeak'**
  String get commercialWhalingPeak;

  /// No description provided for @nearExtinction.
  ///
  /// In en, this message translates to:
  /// **'Near-extinction'**
  String get nearExtinction;

  /// No description provided for @commercialWhalingBan.
  ///
  /// In en, this message translates to:
  /// **'Commercial\nwhaling ban'**
  String get commercialWhalingBan;

  /// No description provided for @numbersSlowlyRising.
  ///
  /// In en, this message translates to:
  /// **'Number are\nslowly rising!'**
  String get numbersSlowlyRising;

  /// No description provided for @whenBorn.
  ///
  /// In en, this message translates to:
  /// **'When were you born?'**
  String get whenBorn;

  /// No description provided for @notLongUntilBan.
  ///
  /// In en, this message translates to:
  /// **'Not long until\nthe whaling ban.'**
  String get notLongUntilBan;

  /// No description provided for @populationsGrowSoon.
  ///
  /// In en, this message translates to:
  /// **'Whale populations\nwill start to grow soon :)'**
  String get populationsGrowSoon;

  /// No description provided for @populationsRecovering.
  ///
  /// In en, this message translates to:
  /// **'Whale populations\nare already recovering :D'**
  String get populationsRecovering;

  /// No description provided for @carbon.
  ///
  /// In en, this message translates to:
  /// **'Carbon'**
  String get carbon;

  /// No description provided for @oxygen.
  ///
  /// In en, this message translates to:
  /// **'Oxygen'**
  String get oxygen;

  /// No description provided for @breathing.
  ///
  /// In en, this message translates to:
  /// **'breathing'**
  String get breathing;

  /// No description provided for @feeding.
  ///
  /// In en, this message translates to:
  /// **'feeding'**
  String get feeding;

  /// No description provided for @phytoplankton.
  ///
  /// In en, this message translates to:
  /// **'fitoplâncton'**
  String get phytoplankton;

  /// No description provided for @chooseCountry.
  ///
  /// In en, this message translates to:
  /// **'Choose your country:'**
  String get chooseCountry;

  /// No description provided for @pooIsImportant.
  ///
  /// In en, this message translates to:
  /// **'My poo\n is important?!'**
  String get pooIsImportant;

  /// No description provided for @emitted.
  ///
  /// In en, this message translates to:
  /// **'Emitted'**
  String get emitted;

  /// No description provided for @absorbed.
  ///
  /// In en, this message translates to:
  /// **'Absorbed'**
  String get absorbed;

  /// No description provided for @tonsPerYear.
  ///
  /// In en, this message translates to:
  /// **'(in tons / per year)'**
  String get tonsPerYear;

  /// No description provided for @worldwide.
  ///
  /// In en, this message translates to:
  /// **'worldwide'**
  String get worldwide;

  /// No description provided for @billion.
  ///
  /// In en, this message translates to:
  /// **'billion'**
  String get billion;

  /// No description provided for @trees.
  ///
  /// In en, this message translates to:
  /// **'trees'**
  String get trees;

  /// No description provided for @equivalent.
  ///
  /// In en, this message translates to:
  /// **'Equivalent to\n4 Amazon'**
  String get equivalent;

  /// No description provided for @amazonForests.
  ///
  /// In en, this message translates to:
  /// **'4 Amazon\nForests!'**
  String get amazonForests;

  /// No description provided for @blueWhale.
  ///
  /// In en, this message translates to:
  /// **'Blue Whale'**
  String get blueWhale;

  /// No description provided for @human.
  ///
  /// In en, this message translates to:
  /// **'Human'**
  String get human;

  /// No description provided for @brachiosaurus.
  ///
  /// In en, this message translates to:
  /// **'Brachiosaurus'**
  String get brachiosaurus;

  /// No description provided for @greatWhiteShake.
  ///
  /// In en, this message translates to:
  /// **'Great white shark'**
  String get greatWhiteShake;

  /// No description provided for @bus.
  ///
  /// In en, this message translates to:
  /// **'Bus'**
  String get bus;

  /// No description provided for @you.
  ///
  /// In en, this message translates to:
  /// **'You!'**
  String get you;

  /// No description provided for @hadNoIdea.
  ///
  /// In en, this message translates to:
  /// **'I had no idea!'**
  String get hadNoIdea;

  /// No description provided for @carbonDeepWhenTheyDie.
  ///
  /// In en, this message translates to:
  /// **'Carbon (CO₂) shuttled to the deep\nsea by baleen whales when they die'**
  String get carbonDeepWhenTheyDie;

  /// No description provided for @whalesToday.
  ///
  /// In en, this message translates to:
  /// **'Whales\nToday'**
  String get whalesToday;

  /// No description provided for @ifWhalesRecovered.
  ///
  /// In en, this message translates to:
  /// **'If whale\npopulations\nrecovered to\npre-whaling\nnumbers'**
  String get ifWhalesRecovered;

  /// No description provided for @equivalentToCO2.
  ///
  /// In en, this message translates to:
  /// **'That\'s equivalent to\nthe CO2 absorbed by:'**
  String get equivalentToCO2;

  /// No description provided for @doOurPart.
  ///
  /// In en, this message translates to:
  /// **'But we must do our part!'**
  String get doOurPart;

  /// No description provided for @touchToFlip.
  ///
  /// In en, this message translates to:
  /// **'touch to flip'**
  String get touchToFlip;

  /// No description provided for @ourPart1Label.
  ///
  /// In en, this message translates to:
  /// **'Reduce food waste'**
  String get ourPart1Label;

  /// No description provided for @ourPart1Text.
  ///
  /// In en, this message translates to:
  /// **'Food waste is responsible for 6% of total global emissions'**
  String get ourPart1Text;

  /// No description provided for @ourPart2Label.
  ///
  /// In en, this message translates to:
  /// **'Eat a Plant-rich diet'**
  String get ourPart2Label;

  /// No description provided for @ourPart2Text.
  ///
  /// In en, this message translates to:
  /// **'Plant-rich diets reduce emissions and also tend to be healtier'**
  String get ourPart2Text;

  /// No description provided for @ourPart3Label.
  ///
  /// In en, this message translates to:
  /// **'Make your home more efficient'**
  String get ourPart3Label;

  /// No description provided for @ourPart3Text.
  ///
  /// In en, this message translates to:
  /// **'Weatherize, use led lights, be conscious of energy use'**
  String get ourPart3Text;

  /// No description provided for @ourPart4Label.
  ///
  /// In en, this message translates to:
  /// **'Shift to alternative transportation'**
  String get ourPart4Label;

  /// No description provided for @ourPart4Text.
  ///
  /// In en, this message translates to:
  /// **'Public transportation, Bicycles, Car-pool, walk'**
  String get ourPart4Text;

  /// No description provided for @ourPart5Label.
  ///
  /// In en, this message translates to:
  /// **'Buyn less stuff'**
  String get ourPart5Label;

  /// No description provided for @ourPart5Text.
  ///
  /// In en, this message translates to:
  /// **'Try to refurbish or repurpose existing items'**
  String get ourPart5Text;

  /// No description provided for @ourPart6Label.
  ///
  /// In en, this message translates to:
  /// **'Support equality'**
  String get ourPart6Label;

  /// No description provided for @ourPart6Text.
  ///
  /// In en, this message translates to:
  /// **'Access to high-quality, inclusive education and voluntary reproductive'**
  String get ourPart6Text;

  /// No description provided for @krill.
  ///
  /// In en, this message translates to:
  /// **'Krill'**
  String get krill;

  /// No description provided for @microplastics.
  ///
  /// In en, this message translates to:
  /// **'Microplastics'**
  String get microplastics;

  /// No description provided for @plasticWasteCreate.
  ///
  /// In en, this message translates to:
  /// **'Plastic waste created'**
  String get plasticWasteCreate;

  /// No description provided for @whereYouFrom.
  ///
  /// In en, this message translates to:
  /// **'Where are you from?'**
  String get whereYouFrom;

  /// No description provided for @tons.
  ///
  /// In en, this message translates to:
  /// **'tons'**
  String get tons;

  /// No description provided for @adultAfricanElephants.
  ///
  /// In en, this message translates to:
  /// **'Adult African\nElephants'**
  String get adultAfricanElephants;

  /// No description provided for @whatCanYouDo.
  ///
  /// In en, this message translates to:
  /// **'What can\nyou do?'**
  String get whatCanYouDo;

  /// No description provided for @canDo1Label.
  ///
  /// In en, this message translates to:
  /// **'Take a reusable bag with you'**
  String get canDo1Label;

  /// No description provided for @canDo2Label.
  ///
  /// In en, this message translates to:
  /// **'Respect natural environments'**
  String get canDo2Label;

  /// No description provided for @canDo2Text.
  ///
  /// In en, this message translates to:
  /// **'and leave them cleaner then you found them'**
  String get canDo2Text;

  /// No description provided for @canDo3Label.
  ///
  /// In en, this message translates to:
  /// **'Look for natural fibres'**
  String get canDo3Label;

  /// No description provided for @canDo3Text.
  ///
  /// In en, this message translates to:
  /// **'Synthetic fibres like polyester & nylon release plastic microfibers when washed'**
  String get canDo3Text;

  /// No description provided for @canDo4Label.
  ///
  /// In en, this message translates to:
  /// **'Stop using single-use plastics'**
  String get canDo4Label;

  /// No description provided for @canDo5Label.
  ///
  /// In en, this message translates to:
  /// **'Buy vegies & fruit not wrapped in plastic'**
  String get canDo5Label;

  /// No description provided for @canDo6Label.
  ///
  /// In en, this message translates to:
  /// **'When you can\'t really avoid using plastic, recycle it after'**
  String get canDo6Label;

  /// No description provided for @baltazarMigration.
  ///
  /// In en, this message translates to:
  /// **'Baltazar\'s Migration\n6,400 km/year'**
  String get baltazarMigration;

  /// No description provided for @feedingGrounds.
  ///
  /// In en, this message translates to:
  /// **'feeding grounds'**
  String get feedingGrounds;

  /// No description provided for @breedingGround.
  ///
  /// In en, this message translates to:
  /// **'breeding grounds'**
  String get breedingGround;

  /// No description provided for @clickToSeeDistance.
  ///
  /// In en, this message translates to:
  /// **'Click to see distance\nfrom where you are from'**
  String get clickToSeeDistance;

  /// No description provided for @migrationCorridors.
  ///
  /// In en, this message translates to:
  /// **'Blue whales\nmigration corridors'**
  String get migrationCorridors;

  /// No description provided for @shippingDensity.
  ///
  /// In en, this message translates to:
  /// **'Shipping density'**
  String get shippingDensity;

  /// No description provided for @slide.
  ///
  /// In en, this message translates to:
  /// **'slide'**
  String get slide;

  /// No description provided for @weNeedTo.
  ///
  /// In en, this message translates to:
  /// **'We need to...'**
  String get weNeedTo;

  /// No description provided for @needTo1Label.
  ///
  /// In en, this message translates to:
  /// **'Slow ships down'**
  String get needTo1Label;

  /// No description provided for @needTo1Text.
  ///
  /// In en, this message translates to:
  /// **'especially in the migration corridors'**
  String get needTo1Text;

  /// No description provided for @needTo2Label.
  ///
  /// In en, this message translates to:
  /// **'Avoid certain areas at particular periods'**
  String get needTo2Label;

  /// No description provided for @needTo2Text.
  ///
  /// In en, this message translates to:
  /// **'Adapt to marine life patterns'**
  String get needTo2Text;

  /// No description provided for @needTo3Label.
  ///
  /// In en, this message translates to:
  /// **'Buy local products'**
  String get needTo3Label;

  /// No description provided for @needTo3Text.
  ///
  /// In en, this message translates to:
  /// **'Support local economies and avoid long transport'**
  String get needTo3Text;

  /// No description provided for @noiceVolume.
  ///
  /// In en, this message translates to:
  /// **'Noise volume'**
  String get noiceVolume;

  /// No description provided for @realOceanNoice.
  ///
  /// In en, this message translates to:
  /// **'(real ocean noise)'**
  String get realOceanNoice;

  /// No description provided for @soundVolumes.
  ///
  /// In en, this message translates to:
  /// **'Sound volumes'**
  String get soundVolumes;

  /// No description provided for @clickOnIcons.
  ///
  /// In en, this message translates to:
  /// **'Click on\nthe icons'**
  String get clickOnIcons;

  /// No description provided for @decibels.
  ///
  /// In en, this message translates to:
  /// **'decibels (dB)'**
  String get decibels;

  /// No description provided for @reduceNoise.
  ///
  /// In en, this message translates to:
  /// **'Let\'s reduce\nthe noise'**
  String get reduceNoise;

  /// No description provided for @lets1Label.
  ///
  /// In en, this message translates to:
  /// **'Less noisy vessels'**
  String get lets1Label;

  /// No description provided for @lets1Text.
  ///
  /// In en, this message translates to:
  /// **'For example, replace propellers'**
  String get lets1Text;

  /// No description provided for @lets2Label.
  ///
  /// In en, this message translates to:
  /// **'Avoid sensitive areas'**
  String get lets2Label;

  /// No description provided for @lets2Text.
  ///
  /// In en, this message translates to:
  /// **'Adapt to ocean life'**
  String get lets2Text;

  /// No description provided for @lets3Label.
  ///
  /// In en, this message translates to:
  /// **'Alternative Energy'**
  String get lets3Label;

  /// No description provided for @lets3Text.
  ///
  /// In en, this message translates to:
  /// **'Support renewables instead of oil drilling'**
  String get lets3Text;

  /// No description provided for @sameCO2Captured.
  ///
  /// In en, this message translates to:
  /// **'The same CO₂\n captured by'**
  String get sameCO2Captured;

  /// No description provided for @treesInOnYear.
  ///
  /// In en, this message translates to:
  /// **'trees in\none year'**
  String get treesInOnYear;

  /// No description provided for @letsDoThis.
  ///
  /// In en, this message translates to:
  /// **'Let\'s do this\ntogether!'**
  String get letsDoThis;

  /// No description provided for @bePartOfThisStory.
  ///
  /// In en, this message translates to:
  /// **'And now, leave your mark on our walls.\nBe part of this story. :)'**
  String get bePartOfThisStory;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
