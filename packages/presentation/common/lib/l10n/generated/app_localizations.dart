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
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
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
  /// **'Рядом'**
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
  /// **'Пожалуйста, заполните все поля правильно'**
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
  /// **'Водительское удостоверение'**
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

  /// No description provided for @car_detail.
  ///
  /// In ru, this message translates to:
  /// **'Детали автомобиля'**
  String get car_detail;

  /// No description provided for @model.
  ///
  /// In ru, this message translates to:
  /// **'Модель'**
  String get model;

  /// No description provided for @number.
  ///
  /// In ru, this message translates to:
  /// **'Число'**
  String get number;

  /// No description provided for @rental_details.
  ///
  /// In ru, this message translates to:
  /// **'Подробности аренды'**
  String get rental_details;

  /// No description provided for @date_of_receipt.
  ///
  /// In ru, this message translates to:
  /// **'Дата получения'**
  String get date_of_receipt;

  /// No description provided for @return_date.
  ///
  /// In ru, this message translates to:
  /// **'Дата возврата'**
  String get return_date;

  /// No description provided for @deposit.
  ///
  /// In ru, this message translates to:
  /// **'Депозит'**
  String get deposit;

  /// No description provided for @the_remaining.
  ///
  /// In ru, this message translates to:
  /// **'Оставшийся'**
  String get the_remaining;

  /// No description provided for @total_payment_amount.
  ///
  /// In ru, this message translates to:
  /// **'Общая сумма оплаты'**
  String get total_payment_amount;

  /// No description provided for @booking_status.
  ///
  /// In ru, this message translates to:
  /// **'Статус бронирования'**
  String get booking_status;

  /// No description provided for @status.
  ///
  /// In ru, this message translates to:
  /// **'Статус'**
  String get status;

  /// No description provided for @completed.
  ///
  /// In ru, this message translates to:
  /// **'Завершенный'**
  String get completed;

  /// No description provided for @extend_booking_time.
  ///
  /// In ru, this message translates to:
  /// **'Продлить время бронирования'**
  String get extend_booking_time;

  /// No description provided for @popular_car.
  ///
  /// In ru, this message translates to:
  /// **'Популярный автомобиль'**
  String get popular_car;

  /// No description provided for @view_all.
  ///
  /// In ru, this message translates to:
  /// **'Посмотреть все'**
  String get view_all;

  /// No description provided for @recommendation_car.
  ///
  /// In ru, this message translates to:
  /// **'Рекомендация Автомобиль'**
  String get recommendation_car;

  /// No description provided for @car_type.
  ///
  /// In ru, this message translates to:
  /// **'Тип автомобиля'**
  String get car_type;

  /// No description provided for @capacity.
  ///
  /// In ru, this message translates to:
  /// **'Емкость'**
  String get capacity;

  /// No description provided for @steering.
  ///
  /// In ru, this message translates to:
  /// **'Рулевое управление'**
  String get steering;

  /// No description provided for @rent.
  ///
  /// In ru, this message translates to:
  /// **'Арендовать'**
  String get rent;

  /// No description provided for @reviews.
  ///
  /// In ru, this message translates to:
  /// **'Обзоры'**
  String get reviews;

  /// No description provided for @car_model.
  ///
  /// In ru, this message translates to:
  /// **'Модель автомобиля'**
  String get car_model;

  /// No description provided for @travel_dates.
  ///
  /// In ru, this message translates to:
  /// **'Даты поездки'**
  String get travel_dates;

  /// No description provided for @your_account.
  ///
  /// In ru, this message translates to:
  /// **'Ваш аккаунт'**
  String get your_account;

  /// No description provided for @notifications.
  ///
  /// In ru, this message translates to:
  /// **'Уведомления'**
  String get notifications;

  /// No description provided for @open.
  ///
  /// In ru, this message translates to:
  /// **'Открыть'**
  String get open;

  /// No description provided for @history.
  ///
  /// In ru, this message translates to:
  /// **'История'**
  String get history;

  /// No description provided for @version.
  ///
  /// In ru, this message translates to:
  /// **'Версия:'**
  String get version;

  /// No description provided for @registration.
  ///
  /// In ru, this message translates to:
  /// **'Регистрация'**
  String get registration;

  /// No description provided for @body_type.
  ///
  /// In ru, this message translates to:
  /// **'Тип кузова'**
  String get body_type;

  /// No description provided for @number_of_seats.
  ///
  /// In ru, this message translates to:
  /// **'Количество мест'**
  String get number_of_seats;

  /// No description provided for @city.
  ///
  /// In ru, this message translates to:
  /// **'Город'**
  String get city;

  /// No description provided for @price.
  ///
  /// In ru, this message translates to:
  /// **'Цена'**
  String get price;

  /// No description provided for @max_price_sum.
  ///
  /// In ru, this message translates to:
  /// **'Макс. {max_price} сум'**
  String max_price_sum(Object max_price);

  /// No description provided for @choose.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать'**
  String get choose;

  /// No description provided for @current.
  ///
  /// In ru, this message translates to:
  /// **'ТЕКУЩИЕ'**
  String get current;

  /// No description provided for @all.
  ///
  /// In ru, this message translates to:
  /// **'ВСЕ'**
  String get all;

  /// No description provided for @state_number.
  ///
  /// In ru, this message translates to:
  /// **'Гос. номер'**
  String get state_number;

  /// No description provided for @car_owner.
  ///
  /// In ru, this message translates to:
  /// **'Владелец автомобиля'**
  String get car_owner;

  /// No description provided for @reports.
  ///
  /// In ru, this message translates to:
  /// **'Отчеты'**
  String get reports;

  /// No description provided for @cost_per_day.
  ///
  /// In ru, this message translates to:
  /// **'Стоимость за день'**
  String get cost_per_day;

  /// No description provided for @security_deposit.
  ///
  /// In ru, this message translates to:
  /// **'Залог'**
  String get security_deposit;

  /// No description provided for @total_cost.
  ///
  /// In ru, this message translates to:
  /// **'Итоговая стоимость'**
  String get total_cost;

  /// No description provided for @in_progress.
  ///
  /// In ru, this message translates to:
  /// **'В ходе выполнения'**
  String get in_progress;

  /// No description provided for @upload_power_of_attorney.
  ///
  /// In ru, this message translates to:
  /// **'Загрузить доверенность'**
  String get upload_power_of_attorney;

  /// No description provided for @download_contract.
  ///
  /// In ru, this message translates to:
  /// **'Загрузить договор'**
  String get download_contract;

  /// No description provided for @download_insurance.
  ///
  /// In ru, this message translates to:
  /// **'Загрузить страховку'**
  String get download_insurance;

  /// No description provided for @end_your_lease.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите завершить аренду?'**
  String get end_your_lease;

  /// No description provided for @no.
  ///
  /// In ru, this message translates to:
  /// **'Нет'**
  String get no;

  /// No description provided for @yes.
  ///
  /// In ru, this message translates to:
  /// **'Да'**
  String get yes;

  /// No description provided for @finish.
  ///
  /// In ru, this message translates to:
  /// **'Завершить'**
  String get finish;

  /// No description provided for @payment_status.
  ///
  /// In ru, this message translates to:
  /// **'Статус оплаты'**
  String get payment_status;

  /// No description provided for @not_paid.
  ///
  /// In ru, this message translates to:
  /// **'Не оплачен'**
  String get not_paid;

  /// No description provided for @cancel_order.
  ///
  /// In ru, this message translates to:
  /// **'Отменить заказ'**
  String get cancel_order;

  /// No description provided for @ready_to_transfer.
  ///
  /// In ru, this message translates to:
  /// **'Готово к передаче'**
  String get ready_to_transfer;

  /// No description provided for @did_you_like_the_car.
  ///
  /// In ru, this message translates to:
  /// **'Вам понравилась машина?'**
  String get did_you_like_the_car;

  /// No description provided for @description.
  ///
  /// In ru, this message translates to:
  /// **'Описание'**
  String get description;

  /// No description provided for @select.
  ///
  /// In ru, this message translates to:
  /// **'Подобрать:'**
  String get select;

  /// No description provided for @landing.
  ///
  /// In ru, this message translates to:
  /// **'Высадка:'**
  String get landing;

  /// No description provided for @reviewers.
  ///
  /// In ru, this message translates to:
  /// **'{reviews_count} рецензентов'**
  String reviewers(Object reviews_count);

  /// No description provided for @sum_day.
  ///
  /// In ru, this message translates to:
  /// **'сум/день'**
  String get sum_day;

  /// No description provided for @internet_connection_is_unavailable.
  ///
  /// In ru, this message translates to:
  /// **'Подключение к Интернету недоступно'**
  String get internet_connection_is_unavailable;

  /// No description provided for @please_check_connection.
  ///
  /// In ru, this message translates to:
  /// **'Проверьте подключение к Wi-Fi или мобильной сети и повторите попытку.'**
  String get please_check_connection;

  /// No description provided for @try_again.
  ///
  /// In ru, this message translates to:
  /// **'Повторить попытку'**
  String get try_again;

  /// No description provided for @telegram.
  ///
  /// In ru, this message translates to:
  /// **'Телеграм'**
  String get telegram;

  /// No description provided for @call.
  ///
  /// In ru, this message translates to:
  /// **'Позвонить'**
  String get call;

  /// No description provided for @the_car_created.
  ///
  /// In ru, this message translates to:
  /// **'Автомобиль успешно создан'**
  String get the_car_created;

  /// No description provided for @leave.
  ///
  /// In ru, this message translates to:
  /// **'Оставлять'**
  String get leave;

  /// No description provided for @back.
  ///
  /// In ru, this message translates to:
  /// **'Назад'**
  String get back;

  /// No description provided for @review.
  ///
  /// In ru, this message translates to:
  /// **'Обзор'**
  String get review;

  /// No description provided for @rent_out_your_car_with_ease.
  ///
  /// In ru, this message translates to:
  /// **'Сдавайте автомобиль в аренду с легкостью!'**
  String get rent_out_your_car_with_ease;

  /// No description provided for @earn_extra_income_text.
  ///
  /// In ru, this message translates to:
  /// **'Получайте дополнительный доход, делясь своим автомобилем через нашу платформу! Просто предоставьте необходимые данные о вашем автомобиле, включая марку, модель, год, состояние, доступность и цену. Убедитесь, что ваш автомобиль оснащен устройством GPS для бесперебойного отслеживания и безопасности во время аренды.'**
  String get earn_extra_income_text;

  /// No description provided for @what_you_will_need_to_get_started.
  ///
  /// In ru, this message translates to:
  /// **'Что вам понадобится для начала:'**
  String get what_you_will_need_to_get_started;

  /// No description provided for @what_you_will_need_to_get_started_text.
  ///
  /// In ru, this message translates to:
  /// **'1. Полные данные об автомобиле (марка, модель, год выпуска, номерной знак и т. д.).\n2. Фотографии вашего автомобиля (внутри и снаружи).\n3. Подтверждение страховки и регистрации.\n4. Устройство GPS-слежения, установленное в вашем автомобиле.\n5. Безопасность вашего автомобиля и ваше спокойствие — наши главные приоритеты!'**
  String get what_you_will_need_to_get_started_text;

  /// No description provided for @fill_in_the_details_below.
  ///
  /// In ru, this message translates to:
  /// **'Заполните данные ниже'**
  String get fill_in_the_details_below;

  /// No description provided for @brand.
  ///
  /// In ru, this message translates to:
  /// **'Марка'**
  String get brand;

  /// No description provided for @transmission.
  ///
  /// In ru, this message translates to:
  /// **'Коробка передач'**
  String get transmission;

  /// No description provided for @machine.
  ///
  /// In ru, this message translates to:
  /// **'Автомат'**
  String get machine;

  /// No description provided for @mechanics.
  ///
  /// In ru, this message translates to:
  /// **'Механика'**
  String get mechanics;

  /// No description provided for @passenger_capacity.
  ///
  /// In ru, this message translates to:
  /// **'Вместимость пассажиров'**
  String get passenger_capacity;

  /// No description provided for @location.
  ///
  /// In ru, this message translates to:
  /// **'Местоположение'**
  String get location;

  /// No description provided for @vehicle_condition.
  ///
  /// In ru, this message translates to:
  /// **'Состояние транспортного средства'**
  String get vehicle_condition;

  /// No description provided for @year_of_issue.
  ///
  /// In ru, this message translates to:
  /// **'Год выпуска'**
  String get year_of_issue;

  /// No description provided for @mileage.
  ///
  /// In ru, this message translates to:
  /// **'Пробег'**
  String get mileage;

  /// No description provided for @capacity_passengers.
  ///
  /// In ru, this message translates to:
  /// **'Вместимость пассажиров'**
  String get capacity_passengers;

  /// No description provided for @upload_photo_of_your_vehicle.
  ///
  /// In ru, this message translates to:
  /// **'Загрузите фото автомобиля'**
  String get upload_photo_of_your_vehicle;

  /// No description provided for @supported_formats.
  ///
  /// In ru, this message translates to:
  /// **'Поддерживаемые форматы: JPEG, PNG, PDG (до 10 МБ)'**
  String get supported_formats;

  /// No description provided for @payment_and_prices.
  ///
  /// In ru, this message translates to:
  /// **'Оплата и цены'**
  String get payment_and_prices;

  /// No description provided for @insurance_and_documents.
  ///
  /// In ru, this message translates to:
  /// **'Страхование и документы'**
  String get insurance_and_documents;

  /// No description provided for @gps_installation_is_required.
  ///
  /// In ru, this message translates to:
  /// **'Для сдачи автомобиля в аренду необходима установка GPS!'**
  String get gps_installation_is_required;

  /// No description provided for @gps_data.
  ///
  /// In ru, this message translates to:
  /// **'GPS-данные'**
  String get gps_data;

  /// No description provided for @port.
  ///
  /// In ru, this message translates to:
  /// **'Порт'**
  String get port;

  /// No description provided for @unique_id.
  ///
  /// In ru, this message translates to:
  /// **'Уникальный ID'**
  String get unique_id;

  /// No description provided for @do_you_have_car_insurance.
  ///
  /// In ru, this message translates to:
  /// **'У вас есть страховка автомобиля?'**
  String get do_you_have_car_insurance;

  /// No description provided for @upload_your_registration_confirmation.
  ///
  /// In ru, this message translates to:
  /// **'Загрузить подтверждение регистрации'**
  String get upload_your_registration_confirmation;

  /// No description provided for @photo_library.
  ///
  /// In ru, this message translates to:
  /// **'Фотобиблиотека'**
  String get photo_library;

  /// No description provided for @camera.
  ///
  /// In ru, this message translates to:
  /// **'Камера'**
  String get camera;

  /// No description provided for @sum.
  ///
  /// In ru, this message translates to:
  /// **'сум'**
  String get sum;

  /// No description provided for @confirm_your_reservation.
  ///
  /// In ru, this message translates to:
  /// **'Подтвердить бронь'**
  String get confirm_your_reservation;

  /// No description provided for @car_for_rent.
  ///
  /// In ru, this message translates to:
  /// **'Автомобиль в аренде'**
  String get car_for_rent;

  /// No description provided for @accept_the_car.
  ///
  /// In ru, this message translates to:
  /// **'Принять машину'**
  String get accept_the_car;

  /// No description provided for @lock.
  ///
  /// In ru, this message translates to:
  /// **'Замок'**
  String get lock;

  /// No description provided for @you_want_to_change_status.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите изменить статус машину ?'**
  String get you_want_to_change_status;

  /// No description provided for @delete.
  ///
  /// In ru, this message translates to:
  /// **'Удалить'**
  String get delete;

  /// No description provided for @remove_the_vehicle.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены, что хотите удалить автомобиль из своей учетной записи?'**
  String get remove_the_vehicle;

  /// No description provided for @the_process_of_getting_car.
  ///
  /// In ru, this message translates to:
  /// **'Процесс получения автомобиля'**
  String get the_process_of_getting_car;

  /// No description provided for @rental_period.
  ///
  /// In ru, this message translates to:
  /// **'Срок аренды'**
  String get rental_period;

  /// No description provided for @total_rent_amount.
  ///
  /// In ru, this message translates to:
  /// **'Общая сумма аренды'**
  String get total_rent_amount;

  /// No description provided for @client_information.
  ///
  /// In ru, this message translates to:
  /// **'Информация о клиенте'**
  String get client_information;

  /// No description provided for @upload_the_power_of_attorney_file.
  ///
  /// In ru, this message translates to:
  /// **'Загрузите файл доверенности'**
  String get upload_the_power_of_attorney_file;

  /// No description provided for @accept.
  ///
  /// In ru, this message translates to:
  /// **'Принять'**
  String get accept;

  /// No description provided for @payment_successfully_made.
  ///
  /// In ru, this message translates to:
  /// **'Платеж успешно произведен'**
  String get payment_successfully_made;

  /// No description provided for @payment_is_being_processed.
  ///
  /// In ru, this message translates to:
  /// **'Платеж обрабатывается'**
  String get payment_is_being_processed;

  /// No description provided for @receiving_the_car.
  ///
  /// In ru, this message translates to:
  /// **'Получение автомобиля'**
  String get receiving_the_car;

  /// No description provided for @payment_method.
  ///
  /// In ru, this message translates to:
  /// **'Способ оплаты'**
  String get payment_method;

  /// No description provided for @please_enter_payment_method.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, введите способ оплаты'**
  String get please_enter_payment_method;

  /// No description provided for @confirmation.
  ///
  /// In ru, this message translates to:
  /// **'Подтверждение'**
  String get confirmation;

  /// No description provided for @we_are_approaching_the_end.
  ///
  /// In ru, this message translates to:
  /// **'Мы приближаемся к концу. Всего несколько кликов и ваша аренда готова!'**
  String get we_are_approaching_the_end;

  /// No description provided for @i_agree_to_receive_sms_notifications.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен на отправку СМС-уведомлений.'**
  String get i_agree_to_receive_sms_notifications;

  /// No description provided for @agreement_privacy_policy.
  ///
  /// In ru, this message translates to:
  /// **'Я согласен с нашими условиями и политикой конфиденциальности!'**
  String get agreement_privacy_policy;

  /// No description provided for @all_your_data_is_safe.
  ///
  /// In ru, this message translates to:
  /// **'Все ваши данные в безопасности'**
  String get all_your_data_is_safe;

  /// No description provided for @advanced_security_experience.
  ///
  /// In ru, this message translates to:
  /// **'Мы используем самые передовые средства безопасности, чтобы обеспечить вам наилучшие впечатления.'**
  String get advanced_security_experience;

  /// No description provided for @ratings_and_reviews.
  ///
  /// In ru, this message translates to:
  /// **'Рейтинги и отзывы'**
  String get ratings_and_reviews;

  /// No description provided for @show_all.
  ///
  /// In ru, this message translates to:
  /// **'Показать все'**
  String get show_all;

  /// No description provided for @return_lang.
  ///
  /// In ru, this message translates to:
  /// **'Возврат'**
  String get return_lang;

  /// No description provided for @receive.
  ///
  /// In ru, this message translates to:
  /// **'Получение'**
  String get receive;

  /// No description provided for @cancel.
  ///
  /// In ru, this message translates to:
  /// **'Отмена'**
  String get cancel;

  /// No description provided for @set.
  ///
  /// In ru, this message translates to:
  /// **'Установить'**
  String get set;

  /// No description provided for @changeLanguage.
  ///
  /// In ru, this message translates to:
  /// **'Изменить язык'**
  String get changeLanguage;

  /// No description provided for @exitAccount.
  ///
  /// In ru, this message translates to:
  /// **'Вы уверены что хотите выйти из аккаунта ?'**
  String get exitAccount;

  /// No description provided for @passwordLength.
  ///
  /// In ru, this message translates to:
  /// **'Пароль из 8 и более символов'**
  String get passwordLength;

  /// No description provided for @enterNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер'**
  String get enterNumber;

  /// No description provided for @enterSpecialSymbols.
  ///
  /// In ru, this message translates to:
  /// **'!~* Введите специальный символ'**
  String get enterSpecialSymbols;

  /// No description provided for @enterCapitalLatter.
  ///
  /// In ru, this message translates to:
  /// **'Введите заглавную букву'**
  String get enterCapitalLatter;

  /// No description provided for @enterLowerCase.
  ///
  /// In ru, this message translates to:
  /// **'Введите строчную букву'**
  String get enterLowerCase;

  /// No description provided for @more2Name.
  ///
  /// In ru, this message translates to:
  /// **'должно быть длиннее 2 букв'**
  String get more2Name;

  /// No description provided for @more2LastName.
  ///
  /// In ru, this message translates to:
  /// **'должна быть длиннее 2 букв'**
  String get more2LastName;

  /// No description provided for @more2Firstname.
  ///
  /// In ru, this message translates to:
  /// **'должно быть длиннее двух букв'**
  String get more2Firstname;

  /// No description provided for @pnfl.
  ///
  /// In ru, this message translates to:
  /// **'Должен состоять из 14 цифр'**
  String get pnfl;

  /// No description provided for @driverLicense.
  ///
  /// In ru, this message translates to:
  /// **'Длина водительского удостоверения должна быть не менее 9 символов'**
  String get driverLicense;

  /// No description provided for @human.
  ///
  /// In ru, this message translates to:
  /// **'Люди'**
  String get human;

  /// No description provided for @daySum.
  ///
  /// In ru, this message translates to:
  /// **'сум/день'**
  String get daySum;

  /// No description provided for @pickUpAndReturn.
  ///
  /// In ru, this message translates to:
  /// **'Самовывоз и возврат'**
  String get pickUpAndReturn;

  /// No description provided for @to.
  ///
  /// In ru, this message translates to:
  /// **'до'**
  String get to;

  /// No description provided for @dateReturn.
  ///
  /// In ru, this message translates to:
  /// **'Выберите дату получения и возврата'**
  String get dateReturn;

  /// No description provided for @dateTimeReturn.
  ///
  /// In ru, this message translates to:
  /// **'Выберите время получения и возврата'**
  String get dateTimeReturn;

  /// No description provided for @acquainted.
  ///
  /// In ru, this message translates to:
  /// **'Я ознакомился с офертой'**
  String get acquainted;

  /// No description provided for @scrollDown.
  ///
  /// In ru, this message translates to:
  /// **'Прокрутите вниз'**
  String get scrollDown;

  /// No description provided for @paymentNotSuccess.
  ///
  /// In ru, this message translates to:
  /// **'Платеж не прошел,\nПлатеж был выведен из состояния ожидания'**
  String get paymentNotSuccess;

  /// No description provided for @cost.
  ///
  /// In ru, this message translates to:
  /// **'Оплата'**
  String get cost;

  /// No description provided for @pleaseWait.
  ///
  /// In ru, this message translates to:
  /// **'Пожалуйста, подождите'**
  String get pleaseWait;

  /// No description provided for @send2.
  ///
  /// In ru, this message translates to:
  /// **'Отправить'**
  String get send2;

  /// No description provided for @cancel_order2.
  ///
  /// In ru, this message translates to:
  /// **'Вы хотите отменить заказ?'**
  String get cancel_order2;

  /// No description provided for @select2.
  ///
  /// In ru, this message translates to:
  /// **'Выбирать'**
  String get select2;

  /// No description provided for @checkInfo.
  ///
  /// In ru, this message translates to:
  /// **'Проверить информацию'**
  String get checkInfo;

  /// No description provided for @chooseBrand.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать марку автомобиля'**
  String get chooseBrand;

  /// No description provided for @chooseModel.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать модель автомобиля'**
  String get chooseModel;

  /// No description provided for @chooseCity.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать город'**
  String get chooseCity;

  /// No description provided for @chooseCarTransmission.
  ///
  /// In ru, this message translates to:
  /// **'Выбрать коробка передач'**
  String get chooseCarTransmission;

  /// No description provided for @enterCarNumber.
  ///
  /// In ru, this message translates to:
  /// **'Введите номер автомобиля'**
  String get enterCarNumber;

  /// No description provided for @clear.
  ///
  /// In ru, this message translates to:
  /// **'Очищать'**
  String get clear;

  /// No description provided for @chooseAnOtherDate.
  ///
  /// In ru, this message translates to:
  /// **'Выберите другую дату'**
  String get chooseAnOtherDate;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ru', 'uz'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ru':
      return AppLocalizationsRu();
    case 'uz':
      return AppLocalizationsUz();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
