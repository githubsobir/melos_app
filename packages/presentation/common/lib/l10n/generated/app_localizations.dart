import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ru.dart';
import 'app_localizations_uz.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
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
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
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

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
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
    Locale('ru'),
    Locale('uz')
  ];

  /// No description provided for @next.
  ///
  /// In ru, this message translates to:
  /// **'Следующий'**
  String get next;

  /// No description provided for @change.
  ///
  /// In ru, this message translates to:
  /// **'Изменять'**
  String get change;

  /// No description provided for @begin.
  ///
  /// In ru, this message translates to:
  /// **'Начать'**
  String get begin;

  /// No description provided for @language_text.
  ///
  /// In ru, this message translates to:
  /// **'Русский'**
  String get language_text;

  /// No description provided for @booking.
  ///
  /// In ru, this message translates to:
  /// **'Бронирование'**
  String get booking;

  /// No description provided for @booking_history.
  ///
  /// In ru, this message translates to:
  /// **'История бронирования'**
  String get booking_history;

  /// No description provided for @payment_details.
  ///
  /// In ru, this message translates to:
  /// **'Реквизиты для оплаты'**
  String get payment_details;

  /// No description provided for @my_cars.
  ///
  /// In ru, this message translates to:
  /// **'Мои машины'**
  String get my_cars;

  /// No description provided for @help.
  ///
  /// In ru, this message translates to:
  /// **'Помощь'**
  String get help;

  /// No description provided for @exit.
  ///
  /// In ru, this message translates to:
  /// **'Выйти'**
  String get exit;

  /// No description provided for @dark.
  ///
  /// In ru, this message translates to:
  /// **'Темный'**
  String get dark;

  /// No description provided for @light.
  ///
  /// In ru, this message translates to:
  /// **'Свет'**
  String get light;

  /// No description provided for @home.
  ///
  /// In ru, this message translates to:
  /// **'Главная'**
  String get home;

  /// No description provided for @next_to_me.
  ///
  /// In ru, this message translates to:
  /// **'Рядом со мной'**
  String get next_to_me;

  /// No description provided for @saved.
  ///
  /// In ru, this message translates to:
  /// **'Сохранено'**
  String get saved;

  /// No description provided for @profile.
  ///
  /// In ru, this message translates to:
  /// **'Профиль'**
  String get profile;

  /// No description provided for @please_fill_in_all_fields.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, заполните все поля'**
  String get please_fill_in_all_fields;

  /// No description provided for @new_password_difference.
  ///
  /// In ru, this message translates to:
  /// **'Ваш новый пароль должен отличаться от ранее использованного пароля.'**
  String get new_password_difference;

  /// No description provided for @password.
  ///
  /// In ru, this message translates to:
  /// **'Пароль'**
  String get password;

  /// No description provided for @repeat_password.
  ///
  /// In ru, this message translates to:
  /// **'Повторите пароль'**
  String get repeat_password;

  /// No description provided for @change_password.
  ///
  /// In ru, this message translates to:
  /// **'Изменить пароль'**
  String get change_password;

  /// No description provided for @enter.
  ///
  /// In ru, this message translates to:
  /// **'Войти'**
  String get enter;

  /// No description provided for @enter_number.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер'**
  String get enter_number;

  /// No description provided for @continue_x.
  ///
  /// In ru, this message translates to:
  /// **'Продолжать'**
  String get continue_x;

  /// No description provided for @authentication.
  ///
  /// In ru, this message translates to:
  /// **'Аутентификация'**
  String get authentication;

  /// No description provided for @enter_the_code.
  ///
  /// In ru, this message translates to:
  /// **'Введите код аутентификации, отправленный на ваш телефон.'**
  String get enter_the_code;

  /// No description provided for @send.
  ///
  /// In ru, this message translates to:
  /// **'Отправлять'**
  String get send;

  /// No description provided for @did_not_receive_the_code.
  ///
  /// In ru, this message translates to:
  /// **'Не получили код?'**
  String get did_not_receive_the_code;

  /// No description provided for @log_in.
  ///
  /// In ru, this message translates to:
  /// **'Авторизоваться'**
  String get log_in;

  /// No description provided for @registration_error.
  ///
  /// In ru, this message translates to:
  /// **'Ошибка регистрации'**
  String get registration_error;

  /// No description provided for @forgot_your_password.
  ///
  /// In ru, this message translates to:
  /// **'Забыли пароль?'**
  String get forgot_your_password;

  /// No description provided for @enter_your_number.
  ///
  /// In ru, this message translates to:
  /// **'Введите свой номер, чтобы получить проверочный код!'**
  String get enter_your_number;

  /// No description provided for @contact_phone.
  ///
  /// In ru, this message translates to:
  /// **'Контактный телефон'**
  String get contact_phone;

  /// No description provided for @surname.
  ///
  /// In ru, this message translates to:
  /// **'Фамилия'**
  String get surname;

  /// No description provided for @name.
  ///
  /// In ru, this message translates to:
  /// **'Имя'**
  String get name;

  /// No description provided for @patronymics.
  ///
  /// In ru, this message translates to:
  /// **'Отчества'**
  String get patronymics;

  /// No description provided for @pinfl.
  ///
  /// In ru, this message translates to:
  /// **'ПИНФЛ'**
  String get pinfl;

  /// No description provided for @drivers_license.
  ///
  /// In ru, this message translates to:
  /// **'Вод Прав'**
  String get drivers_license;

  /// No description provided for @i_have_an_account.
  ///
  /// In ru, this message translates to:
  /// **'У меня есть аккаунт. '**
  String get i_have_an_account;

  /// No description provided for @save.
  ///
  /// In ru, this message translates to:
  /// **'Сохранять'**
  String get save;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru': return AppLocalizationsRu();
    case 'uz': return AppLocalizationsUz();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
