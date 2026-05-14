// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Find you dream car`
  String get findYouCar {
    return Intl.message(
      'Find you dream car',
      name: 'findYouCar',
      desc: '',
      args: [],
    );
  }

  /// `Cars Market`
  String get carsMarket {
    return Intl.message('Cars Market', name: 'carsMarket', desc: '', args: []);
  }

  /// `Personal Information`
  String get personalInformation {
    return Intl.message(
      'Personal Information',
      name: 'personalInformation',
      desc: '',
      args: [],
    );
  }

  /// `Listed Cars`
  String get listedCars {
    return Intl.message('Listed Cars', name: 'listedCars', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }

  /// `ACCOUNT`
  String get account {
    return Intl.message('ACCOUNT', name: 'account', desc: '', args: []);
  }

  /// `Update`
  String get update {
    return Intl.message('Update', name: 'update', desc: '', args: []);
  }

  /// `Steps`
  String get steps {
    return Intl.message('Steps', name: 'steps', desc: '', args: []);
  }

  /// `of`
  String get ofd {
    return Intl.message('of', name: 'ofd', desc: '', args: []);
  }

  /// `No Listed Cars Found`
  String get noListedCarFound {
    return Intl.message(
      'No Listed Cars Found',
      name: 'noListedCarFound',
      desc: '',
      args: [],
    );
  }

  /// `Created At`
  String get createdAt {
    return Intl.message('Created At', name: 'createdAt', desc: '', args: []);
  }

  /// `Log Out`
  String get logout {
    return Intl.message('Log Out', name: 'logout', desc: '', args: []);
  }

  /// `Name Update`
  String get updateName {
    return Intl.message('Name Update', name: 'updateName', desc: '', args: []);
  }

  /// `New Name`
  String get newName {
    return Intl.message('New Name', name: 'newName', desc: '', args: []);
  }

  /// `Contact Details`
  String get contactDetails {
    return Intl.message(
      'Contact Details',
      name: 'contactDetails',
      desc: '',
      args: [],
    );
  }

  /// `Profile Account`
  String get profileAccount {
    return Intl.message(
      'Profile Account',
      name: 'profileAccount',
      desc: '',
      args: [],
    );
  }

  /// `Email Verification Pending`
  String get emailVerificationPending {
    return Intl.message(
      'Email Verification Pending',
      name: 'emailVerificationPending',
      desc: '',
      args: [],
    );
  }

  /// `Views`
  String get views {
    return Intl.message('Views', name: 'views', desc: '', args: []);
  }

  /// `Leads`
  String get leads {
    return Intl.message('Leads', name: 'leads', desc: '', args: []);
  }

  /// `Active`
  String get active {
    return Intl.message('Active', name: 'active', desc: '', args: []);
  }

  /// `Deactivated`
  String get deactivated {
    return Intl.message('Deactivated', name: 'deactivated', desc: '', args: []);
  }

  /// `Pending Review`
  String get pendingReview {
    return Intl.message(
      'Pending Review',
      name: 'pendingReview',
      desc: '',
      args: [],
    );
  }

  /// `Rejected`
  String get rejected {
    return Intl.message('Rejected', name: 'rejected', desc: '', args: []);
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Are you sure you want to delete your account? This action cannot be undone.`
  String get deleteAccountConfirmation {
    return Intl.message(
      'Are you sure you want to delete your account? This action cannot be undone.',
      name: 'deleteAccountConfirmation',
      desc: '',
      args: [],
    );
  }

  /// `Check Your Mail Box to verify your email and login again`
  String get checkYourMailBox {
    return Intl.message(
      'Check Your Mail Box to verify your email and login again',
      name: 'checkYourMailBox',
      desc: '',
      args: [],
    );
  }

  /// `{name} Updated Successfully`
  String updateSuccess(String name) {
    return Intl.message(
      '$name Updated Successfully',
      name: 'updateSuccess',
      desc: 'Success message when a field is updated',
      args: [name],
    );
  }

  /// `Enter Your New Name`
  String get updateNameTitle {
    return Intl.message(
      'Enter Your New Name',
      name: 'updateNameTitle',
      desc: '',
      args: [],
    );
  }

  /// `New name is required`
  String get newNameIsRequired {
    return Intl.message(
      'New name is required',
      name: 'newNameIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `New email is required`
  String get newEmailIsRequired {
    return Intl.message(
      'New email is required',
      name: 'newEmailIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `New phone is required`
  String get newPhoneIsRequired {
    return Intl.message(
      'New phone is required',
      name: 'newPhoneIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `New password is required`
  String get newPasswordIsRequired {
    return Intl.message(
      'New password is required',
      name: 'newPasswordIsRequired',
      desc: '',
      args: [],
    );
  }

  /// `Email Update `
  String get updateEmail {
    return Intl.message(
      'Email Update ',
      name: 'updateEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Email Address`
  String get updateEmailTitle {
    return Intl.message(
      'Enter Your New Email Address',
      name: 'updateEmailTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Email`
  String get newEmail {
    return Intl.message('New Email', name: 'newEmail', desc: '', args: []);
  }

  /// `Phone Number Update`
  String get updatePhoneNumber {
    return Intl.message(
      'Phone Number Update',
      name: 'updatePhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `New Phone Number`
  String get newPhoneNumber {
    return Intl.message(
      'New Phone Number',
      name: 'newPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Phone Number`
  String get updatePhoneNumberTitle {
    return Intl.message(
      'Enter Your New Phone Number',
      name: 'updatePhoneNumberTitle',
      desc: '',
      args: [],
    );
  }

  /// `Password Update`
  String get updatePassword {
    return Intl.message(
      'Password Update',
      name: 'updatePassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter Your New Password`
  String get updatePasswordTitle {
    return Intl.message(
      'Enter Your New Password',
      name: 'updatePasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get newPassword {
    return Intl.message(
      'New Password',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `Delete Account`
  String get deleteAccount {
    return Intl.message(
      'Delete Account',
      name: 'deleteAccount',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message('Delete', name: 'delete', desc: '', args: []);
  }

  /// `Deactivate`
  String get deactivate {
    return Intl.message('Deactivate', name: 'deactivate', desc: '', args: []);
  }

  /// `Activate`
  String get reactivate {
    return Intl.message('Activate', name: 'reactivate', desc: '', args: []);
  }

  /// `PREFERENCES`
  String get preferences {
    return Intl.message('PREFERENCES', name: 'preferences', desc: '', args: []);
  }

  /// `Contact Support`
  String get support {
    return Intl.message('Contact Support', name: 'support', desc: '', args: []);
  }

  /// `Dark Mode`
  String get darkMode {
    return Intl.message('Dark Mode', name: 'darkMode', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back`
  String get welcome {
    return Intl.message('Welcome Back', name: 'welcome', desc: '', args: []);
  }

  /// `Error`
  String get error {
    return Intl.message('Error', name: 'error', desc: '', args: []);
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Specifications`
  String get spec {
    return Intl.message('Specifications', name: 'spec', desc: '', args: []);
  }

  /// `Exit !`
  String get confirmExitLab {
    return Intl.message('Exit !', name: 'confirmExitLab', desc: '', args: []);
  }

  /// `Are you sure you want to exit\n all your progress will be lost`
  String get confirmExitSub {
    return Intl.message(
      'Are you sure you want to exit\n all your progress will be lost',
      name: 'confirmExitSub',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message('Cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Exit`
  String get exit {
    return Intl.message('Exit', name: 'exit', desc: '', args: []);
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Search`
  String get search {
    return Intl.message('Search', name: 'search', desc: '', args: []);
  }

  /// `Please enter a valid OTP`
  String get otpValidation {
    return Intl.message(
      'Please enter a valid OTP',
      name: 'otpValidation',
      desc: '',
      args: [],
    );
  }

  /// `Maximum number of images reached only {imagesLimit} images allowed`
  String maxImagesLimitReached(int imagesLimit) {
    return Intl.message(
      'Maximum number of images reached only $imagesLimit images allowed',
      name: 'maxImagesLimitReached',
      desc: 'Error message when max images limit is reached',
      args: [imagesLimit],
    );
  }

  /// `Email verification sent check inbox`
  String get emailVerificationSent {
    return Intl.message(
      'Email verification sent check inbox',
      name: 'emailVerificationSent',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Complete your profile`
  String get completeYourProfile {
    return Intl.message(
      'Complete your profile',
      name: 'completeYourProfile',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get fullName {
    return Intl.message('Full Name', name: 'fullName', desc: '', args: []);
  }

  /// `Enter your full name`
  String get fullNameEx {
    return Intl.message(
      'Enter your full name',
      name: 'fullNameEx',
      desc: '',
      args: [],
    );
  }

  /// `Enter your phone number`
  String get phoneNumberEx {
    return Intl.message(
      'Enter your phone number',
      name: 'phoneNumberEx',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phoneNumber {
    return Intl.message(
      'Phone Number',
      name: 'phoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get save {
    return Intl.message('Save', name: 'save', desc: '', args: []);
  }

  /// `Start typing to search...`
  String get startTypingToSearch {
    return Intl.message(
      'Start typing to search...',
      name: 'startTypingToSearch',
      desc: '',
      args: [],
    );
  }

  /// `See All`
  String get seeAll {
    return Intl.message('See All', name: 'seeAll', desc: '', args: []);
  }

  /// `Continue`
  String get nextButtonLabel {
    return Intl.message(
      'Continue',
      name: 'nextButtonLabel',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `No Location Available`
  String get noLocationAvailable {
    return Intl.message(
      'No Location Available',
      name: 'noLocationAvailable',
      desc: '',
      args: [],
    );
  }

  /// `Verify Now`
  String get verifyNow {
    return Intl.message('Verify Now', name: 'verifyNow', desc: '', args: []);
  }

  /// `Verified`
  String get verified {
    return Intl.message('Verified', name: 'verified', desc: '', args: []);
  }

  /// `Resend Code`
  String get resendCode {
    return Intl.message('Resend Code', name: 'resendCode', desc: '', args: []);
  }

  /// `Phone Verification`
  String get phoneVerification {
    return Intl.message(
      'Phone Verification',
      name: 'phoneVerification',
      desc: '',
      args: [],
    );
  }

  /// `Enter the code`
  String get otpTitle {
    return Intl.message('Enter the code', name: 'otpTitle', desc: '', args: []);
  }

  /// `We sent a verification code to `
  String get otpSubTitle {
    return Intl.message(
      'We sent a verification code to ',
      name: 'otpSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `View Profile`
  String get viewProfile {
    return Intl.message(
      'View Profile',
      name: 'viewProfile',
      desc: '',
      args: [],
    );
  }

  /// `Search for cars...`
  String get searchForCars {
    return Intl.message(
      'Search for cars...',
      name: 'searchForCars',
      desc: '',
      args: [],
    );
  }

  /// `Filter Options`
  String get filterOptions {
    return Intl.message(
      'Filter Options',
      name: 'filterOptions',
      desc: '',
      args: [],
    );
  }

  /// `Year (from)`
  String get fromYear {
    return Intl.message('Year (from)', name: 'fromYear', desc: '', args: []);
  }

  /// `Year (to)`
  String get toYear {
    return Intl.message('Year (to)', name: 'toYear', desc: '', args: []);
  }

  /// `EX.2005`
  String get fromYearHint {
    return Intl.message('EX.2005', name: 'fromYearHint', desc: '', args: []);
  }

  /// `EX.2010`
  String get toYearHint {
    return Intl.message('EX.2010', name: 'toYearHint', desc: '', args: []);
  }

  /// `From`
  String get fromPrice {
    return Intl.message('From', name: 'fromPrice', desc: '', args: []);
  }

  /// `To`
  String get toPrice {
    return Intl.message('To', name: 'toPrice', desc: '', args: []);
  }

  /// `EX.600,000`
  String get fromPriceHint {
    return Intl.message(
      'EX.600,000',
      name: 'fromPriceHint',
      desc: '',
      args: [],
    );
  }

  /// `EX.800,000`
  String get toPriceHint {
    return Intl.message('EX.800,000', name: 'toPriceHint', desc: '', args: []);
  }

  /// `Min`
  String get min {
    return Intl.message('Min', name: 'min', desc: '', args: []);
  }

  /// `Max`
  String get max {
    return Intl.message('Max', name: 'max', desc: '', args: []);
  }

  /// `Kilometers (KM)`
  String get kmLabel {
    return Intl.message('Kilometers (KM)', name: 'kmLabel', desc: '', args: []);
  }

  /// `e.g.., 55000 KM`
  String get kmHint {
    return Intl.message('e.g.., 55000 KM', name: 'kmHint', desc: '', args: []);
  }

  /// `KM`
  String get km {
    return Intl.message('KM', name: 'km', desc: '', args: []);
  }

  /// `Horsepower (Optional)`
  String get hpLabel {
    return Intl.message(
      'Horsepower (Optional)',
      name: 'hpLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., 150 HP`
  String get hpHint {
    return Intl.message('e.g.., 150 HP', name: 'hpHint', desc: '', args: []);
  }

  /// `Horsepower`
  String get hp {
    return Intl.message('Horsepower', name: 'hp', desc: '', args: []);
  }

  /// `Top Speed (Optional)`
  String get topSpeedLabel {
    return Intl.message(
      'Top Speed (Optional)',
      name: 'topSpeedLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., 200 km/h`
  String get topSpeedHint {
    return Intl.message(
      'e.g.., 200 km/h',
      name: 'topSpeedHint',
      desc: '',
      args: [],
    );
  }

  /// `Top Speed`
  String get topSpeed {
    return Intl.message('Top Speed', name: 'topSpeed', desc: '', args: []);
  }

  /// `Fuel Consumption (Optional)`
  String get fuelConsumptionLabel {
    return Intl.message(
      'Fuel Consumption (Optional)',
      name: 'fuelConsumptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Consumption`
  String get fuelConsumptionDisplayLabel {
    return Intl.message(
      'Consumption',
      name: 'fuelConsumptionDisplayLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., 10 L/100 km`
  String get fuelConsumptionHint {
    return Intl.message(
      'e.g.., 10 L/100 km',
      name: 'fuelConsumptionHint',
      desc: '',
      args: [],
    );
  }

  /// `L/100 km`
  String get fuelConsumption {
    return Intl.message(
      'L/100 km',
      name: 'fuelConsumption',
      desc: '',
      args: [],
    );
  }

  /// `Price Range`
  String get priceFilterRange {
    return Intl.message(
      'Price Range',
      name: 'priceFilterRange',
      desc: '',
      args: [],
    );
  }

  /// `No Results Found`
  String get noResultsFound {
    return Intl.message(
      'No Results Found',
      name: 'noResultsFound',
      desc: '',
      args: [],
    );
  }

  /// `Used`
  String get usedLabel {
    return Intl.message('Used', name: 'usedLabel', desc: '', args: []);
  }

  /// `New`
  String get newLabel {
    return Intl.message('New', name: 'newLabel', desc: '', args: []);
  }

  /// `Accidented`
  String get accidentedLabel {
    return Intl.message(
      'Accidented',
      name: 'accidentedLabel',
      desc: '',
      args: [],
    );
  }

  /// `Yes`
  String get yes {
    return Intl.message('Yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get no {
    return Intl.message('No', name: 'no', desc: '', args: []);
  }

  /// `Condition`
  String get carConditionLabel {
    return Intl.message(
      'Condition',
      name: 'carConditionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please select condition`
  String get carConditionError {
    return Intl.message(
      'Please select condition',
      name: 'carConditionError',
      desc: '',
      args: [],
    );
  }

  /// `Loading...`
  String get loading {
    return Intl.message('Loading...', name: 'loading', desc: '', args: []);
  }

  /// `Location`
  String get location {
    return Intl.message('Location', name: 'location', desc: '', args: []);
  }

  /// `Listing your car...`
  String get listingYourCar {
    return Intl.message(
      'Listing your car...',
      name: 'listingYourCar',
      desc: '',
      args: [],
    );
  }

  /// `Please add at least 3 images`
  String get imagesError {
    return Intl.message(
      'Please add at least 3 images',
      name: 'imagesError',
      desc: '',
      args: [],
    );
  }

  /// `Warning`
  String get warning {
    return Intl.message('Warning', name: 'warning', desc: '', args: []);
  }

  /// `Message seller on WhatsApp`
  String get messageSellerOnWhatsApp {
    return Intl.message(
      'Message seller on WhatsApp',
      name: 'messageSellerOnWhatsApp',
      desc: '',
      args: [],
    );
  }

  /// `Oops!`
  String get oops {
    return Intl.message('Oops!', name: 'oops', desc: '', args: []);
  }

  /// `Photos`
  String get photos {
    return Intl.message('Photos', name: 'photos', desc: '', args: []);
  }

  /// `Okay`
  String get okay {
    return Intl.message('Okay', name: 'okay', desc: '', args: []);
  }

  /// `Car listed successfully`
  String get carListedSuccessfully {
    return Intl.message(
      'Car listed successfully',
      name: 'carListedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `List your car`
  String get list {
    return Intl.message('List your car', name: 'list', desc: '', args: []);
  }

  /// `Brand`
  String get brand {
    return Intl.message('Brand', name: 'brand', desc: '', args: []);
  }

  /// `Brand Not Found`
  String get brandNotFound {
    return Intl.message(
      'Brand Not Found',
      name: 'brandNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Model Not Found`
  String get modelNotFound {
    return Intl.message(
      'Model Not Found',
      name: 'modelNotFound',
      desc: '',
      args: [],
    );
  }

  /// `EV`
  String get ev {
    return Intl.message('EV', name: 'ev', desc: '', args: []);
  }

  /// `Select Brand`
  String get selectBrand {
    return Intl.message(
      'Select Brand',
      name: 'selectBrand',
      desc: '',
      args: [],
    );
  }

  /// `Search for brand`
  String get searchForBrand {
    return Intl.message(
      'Search for brand',
      name: 'searchForBrand',
      desc: '',
      args: [],
    );
  }

  /// `Search for model`
  String get searchForModel {
    return Intl.message(
      'Search for model',
      name: 'searchForModel',
      desc: '',
      args: [],
    );
  }

  /// `Year`
  String get yearLabel {
    return Intl.message('Year', name: 'yearLabel', desc: '', args: []);
  }

  /// `EX. 2010`
  String get yearHint {
    return Intl.message('EX. 2010', name: 'yearHint', desc: '', args: []);
  }

  /// `Selected Car`
  String get selectedCar {
    return Intl.message(
      'Selected Car',
      name: 'selectedCar',
      desc: '',
      args: [],
    );
  }

  /// `Select a car`
  String get selectCar {
    return Intl.message('Select a car', name: 'selectCar', desc: '', args: []);
  }

  /// `Please select a car`
  String get pleaseSelectCar {
    return Intl.message(
      'Please select a car',
      name: 'pleaseSelectCar',
      desc: '',
      args: [],
    );
  }

  /// `Version (Optional)`
  String get versionLabel {
    return Intl.message(
      'Version (Optional)',
      name: 'versionLabel',
      desc: '',
      args: [],
    );
  }

  /// `EX. LX, Sport, Limited`
  String get versionHint {
    return Intl.message(
      'EX. LX, Sport, Limited',
      name: 'versionHint',
      desc: '',
      args: [],
    );
  }

  /// `Version`
  String get version {
    return Intl.message('Version', name: 'version', desc: '', args: []);
  }

  /// `Model`
  String get model {
    return Intl.message('Model', name: 'model', desc: '', args: []);
  }

  /// `Select Model`
  String get selectModel {
    return Intl.message(
      'Select Model',
      name: 'selectModel',
      desc: '',
      args: [],
    );
  }

  /// `Choose`
  String get choose {
    return Intl.message('Choose', name: 'choose', desc: '', args: []);
  }

  /// `Non-Negotiable`
  String get nonNegotiablePrice {
    return Intl.message(
      'Non-Negotiable',
      name: 'nonNegotiablePrice',
      desc: '',
      args: [],
    );
  }

  /// `Negotiable`
  String get negotiablePrice {
    return Intl.message(
      'Negotiable',
      name: 'negotiablePrice',
      desc: '',
      args: [],
    );
  }

  /// `Safety Options Selected`
  String get safetyOptionsSelected {
    return Intl.message(
      'Safety Options Selected',
      name: 'safetyOptionsSelected',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message('Back', name: 'back', desc: '', args: []);
  }

  /// `Identification`
  String get stepIndicatorTitle1 {
    return Intl.message(
      'Identification',
      name: 'stepIndicatorTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Details`
  String get stepIndicatorTitle2 {
    return Intl.message(
      'Details',
      name: 'stepIndicatorTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Pricing & Publish`
  String get stepIndicatorTitle3 {
    return Intl.message(
      'Pricing & Publish',
      name: 'stepIndicatorTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Please select fuel type`
  String get fuelTypeError {
    return Intl.message(
      'Please select fuel type',
      name: 'fuelTypeError',
      desc: '',
      args: [],
    );
  }

  /// `No body type found`
  String get bodyTypeError {
    return Intl.message(
      'No body type found',
      name: 'bodyTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Please add at least 3 images`
  String get pleaseAddAtLeast3Images {
    return Intl.message(
      'Please add at least 3 images',
      name: 'pleaseAddAtLeast3Images',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Type`
  String get fuelTypeLabel {
    return Intl.message('Fuel Type', name: 'fuelTypeLabel', desc: '', args: []);
  }

  /// `Petrol`
  String get petrol {
    return Intl.message('Petrol', name: 'petrol', desc: '', args: []);
  }

  /// `Diesel`
  String get diesel {
    return Intl.message('Diesel', name: 'diesel', desc: '', args: []);
  }

  /// `Electric`
  String get electric {
    return Intl.message('Electric', name: 'electric', desc: '', args: []);
  }

  /// `Hybrid`
  String get hybrid {
    return Intl.message('Hybrid', name: 'hybrid', desc: '', args: []);
  }

  /// `Natural Gas`
  String get naturalGas {
    return Intl.message('Natural Gas', name: 'naturalGas', desc: '', args: []);
  }

  /// `Plug-in Hybrid`
  String get plugInHybrid {
    return Intl.message(
      'Plug-in Hybrid',
      name: 'plugInHybrid',
      desc: '',
      args: [],
    );
  }

  /// `Fuel Types`
  String get fuelTypes {
    return Intl.message('Fuel Types', name: 'fuelTypes', desc: '', args: []);
  }

  /// `Price (EGP)`
  String get priceLabel {
    return Intl.message('Price (EGP)', name: 'priceLabel', desc: '', args: []);
  }

  /// `EX. 100,000`
  String get priceHint {
    return Intl.message('EX. 100,000', name: 'priceHint', desc: '', args: []);
  }

  /// `Price`
  String get price {
    return Intl.message('Price', name: 'price', desc: '', args: []);
  }

  /// `Next`
  String get next {
    return Intl.message('Next', name: 'next', desc: '', args: []);
  }

  /// `List My Car Now `
  String get listMyCar {
    return Intl.message(
      'List My Car Now ',
      name: 'listMyCar',
      desc: '',
      args: [],
    );
  }

  /// `Negotiable ? `
  String get negotiableLabel {
    return Intl.message(
      'Negotiable ? ',
      name: 'negotiableLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please select negotiation`
  String get negotiableError {
    return Intl.message(
      'Please select negotiation',
      name: 'negotiableError',
      desc: '',
      args: [],
    );
  }

  /// `Available`
  String get available {
    return Intl.message('Available', name: 'available', desc: '', args: []);
  }

  /// `Non-Negotiable`
  String get nonNegotiable {
    return Intl.message(
      'Non-Negotiable',
      name: 'nonNegotiable',
      desc: '',
      args: [],
    );
  }

  /// `Negotiable`
  String get negotiable {
    return Intl.message('Negotiable', name: 'negotiable', desc: '', args: []);
  }

  /// `Transmission Type`
  String get transmissionTypeLabel {
    return Intl.message(
      'Transmission Type',
      name: 'transmissionTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `please select Transmission Type`
  String get transmissionTypeError {
    return Intl.message(
      'please select Transmission Type',
      name: 'transmissionTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Automatic`
  String get automatic {
    return Intl.message('Automatic', name: 'automatic', desc: '', args: []);
  }

  /// `Manual`
  String get manual {
    return Intl.message('Manual', name: 'manual', desc: '', args: []);
  }

  /// `Transmission Types`
  String get transmissionTypes {
    return Intl.message(
      'Transmission Types',
      name: 'transmissionTypes',
      desc: '',
      args: [],
    );
  }

  /// `Paint Color`
  String get paintColorLabel {
    return Intl.message(
      'Paint Color',
      name: 'paintColorLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please select paint color`
  String get pleaseSelectPaintColor {
    return Intl.message(
      'Please select paint color',
      name: 'pleaseSelectPaintColor',
      desc: '',
      args: [],
    );
  }

  /// `Select Paint Color`
  String get selectPaintColor {
    return Intl.message(
      'Select Paint Color',
      name: 'selectPaintColor',
      desc: '',
      args: [],
    );
  }

  /// `No paint colors found`
  String get noPaintColorsFound {
    return Intl.message(
      'No paint colors found',
      name: 'noPaintColorsFound',
      desc: '',
      args: [],
    );
  }

  /// `Paint Condition`
  String get paintConditionLabel {
    return Intl.message(
      'Paint Condition',
      name: 'paintConditionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Paint Conditions`
  String get paintConditions {
    return Intl.message(
      'Paint Conditions',
      name: 'paintConditions',
      desc: '',
      args: [],
    );
  }

  /// `Please select paint condition`
  String get paintConditionError {
    return Intl.message(
      'Please select paint condition',
      name: 'paintConditionError',
      desc: '',
      args: [],
    );
  }

  /// `Interior Features (Optional)`
  String get interiorFeatures {
    return Intl.message(
      'Interior Features (Optional)',
      name: 'interiorFeatures',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., Leather seats, Sunroof, Premium Sound System`
  String get interiorFeaturesHint {
    return Intl.message(
      'e.g.., Leather seats, Sunroof, Premium Sound System',
      name: 'interiorFeaturesHint',
      desc: '',
      args: [],
    );
  }

  /// `Features (Optional)`
  String get featuresLabel {
    return Intl.message(
      'Features (Optional)',
      name: 'featuresLabel',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get detailsfeaturesLabel {
    return Intl.message(
      'Features',
      name: 'detailsfeaturesLabel',
      desc: '',
      args: [],
    );
  }

  /// `+ Add Features`
  String get featuresHint {
    return Intl.message(
      '+ Add Features',
      name: 'featuresHint',
      desc: '',
      args: [],
    );
  }

  /// `Features Selected`
  String get featuresSelected {
    return Intl.message(
      'Features Selected',
      name: 'featuresSelected',
      desc: '',
      args: [],
    );
  }

  /// `Features`
  String get featuresTitle {
    return Intl.message('Features', name: 'featuresTitle', desc: '', args: []);
  }

  /// `Safety Options`
  String get safetyOptions {
    return Intl.message(
      'Safety Options',
      name: 'safetyOptions',
      desc: '',
      args: [],
    );
  }

  /// `Service History (Optional)`
  String get serviceHistoryLabelSellCar {
    return Intl.message(
      'Service History (Optional)',
      name: 'serviceHistoryLabelSellCar',
      desc: '',
      args: [],
    );
  }

  /// `Service History`
  String get serviceHistoryLabel {
    return Intl.message(
      'Service History',
      name: 'serviceHistoryLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., Full service history available, Last serviced at 50,000 km`
  String get serviceHistoryHint {
    return Intl.message(
      'e.g.., Full service history available, Last serviced at 50,000 km',
      name: 'serviceHistoryHint',
      desc: '',
      args: [],
    );
  }

  /// `Modifications (Optional)`
  String get modificationsLabelSellCar {
    return Intl.message(
      'Modifications (Optional)',
      name: 'modificationsLabelSellCar',
      desc: '',
      args: [],
    );
  }

  /// `Modifications`
  String get modificationsLabel {
    return Intl.message(
      'Modifications',
      name: 'modificationsLabel',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., Upgraded exhaust system, Custom wheels, if none, leave blank`
  String get modificationsHint {
    return Intl.message(
      'e.g.., Upgraded exhaust system, Custom wheels, if none, leave blank',
      name: 'modificationsHint',
      desc: '',
      args: [],
    );
  }

  /// `Model can't be empty`
  String get modelError {
    return Intl.message(
      'Model can\'t be empty',
      name: 'modelError',
      desc: '',
      args: [],
    );
  }

  /// `brand can't be empty`
  String get brandError {
    return Intl.message(
      'brand can\'t be empty',
      name: 'brandError',
      desc: '',
      args: [],
    );
  }

  /// `Description`
  String get description {
    return Intl.message('Description', name: 'description', desc: '', args: []);
  }

  /// `Description`
  String get descriptionHint {
    return Intl.message(
      'Description',
      name: 'descriptionHint',
      desc: '',
      args: [],
    );
  }

  /// `Description can't be empty or less than 100`
  String get descriptionError {
    return Intl.message(
      'Description can\'t be empty or less than 100',
      name: 'descriptionError',
      desc: '',
      args: [],
    );
  }

  /// `Add at least 3 photos of your car`
  String get addPhotosSubTitle {
    return Intl.message(
      'Add at least 3 photos of your car',
      name: 'addPhotosSubTitle',
      desc: '',
      args: [],
    );
  }

  /// `Add photos`
  String get addPhotos {
    return Intl.message('Add photos', name: 'addPhotos', desc: '', args: []);
  }

  /// `Car Details`
  String get carDetails {
    return Intl.message('Car Details', name: 'carDetails', desc: '', args: []);
  }

  /// `Upload photos`
  String get uploadPhotos {
    return Intl.message(
      'Upload photos',
      name: 'uploadPhotos',
      desc: '',
      args: [],
    );
  }

  /// `Please check your inbox to verify your email`
  String get inbox {
    return Intl.message(
      'Please check your inbox to verify your email',
      name: 'inbox',
      desc: '',
      args: [],
    );
  }

  /// `Please check your inbox to reset your password`
  String get inboxF {
    return Intl.message(
      'Please check your inbox to reset your password',
      name: 'inboxF',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password`
  String get forgotPasswordAppBarTitle {
    return Intl.message(
      'Forgot Password',
      name: 'forgotPasswordAppBarTitle',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get resetPassword {
    return Intl.message(
      'Reset Password',
      name: 'resetPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter you email address and we'll send you a link to rest your password.`
  String get forgotPasswordTitle {
    return Intl.message(
      'Enter you email address and we\'ll send you a link to rest your password.',
      name: 'forgotPasswordTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Create your account`
  String get cYourAccount {
    return Intl.message(
      'Create your account',
      name: 'cYourAccount',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get cAccount {
    return Intl.message('Create Account', name: 'cAccount', desc: '', args: []);
  }

  /// `Already have an account? `
  String get haveAccount {
    return Intl.message(
      'Already have an account? ',
      name: 'haveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAccount',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Confirm your password`
  String get confirmYourPassword {
    return Intl.message(
      'Confirm your password',
      name: 'confirmYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm password`
  String get confirmPassword {
    return Intl.message(
      'Confirm password',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Confirm new password`
  String get confirmNewPassword {
    return Intl.message(
      'Confirm new password',
      name: 'confirmNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email`
  String get enterEmail {
    return Intl.message(
      'Enter your email',
      name: 'enterEmail',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Password`
  String get enterPassword {
    return Intl.message(
      'Enter your Password',
      name: 'enterPassword',
      desc: '',
      args: [],
    );
  }

  /// `Continue as Guest`
  String get guestMode {
    return Intl.message(
      'Continue as Guest',
      name: 'guestMode',
      desc: '',
      args: [],
    );
  }

  /// `Login to access your account`
  String get loginTO {
    return Intl.message(
      'Login to access your account',
      name: 'loginTO',
      desc: '',
      args: [],
    );
  }

  /// `Create one here`
  String get createOne {
    return Intl.message(
      'Create one here',
      name: 'createOne',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Home`
  String get homeL {
    return Intl.message('Home', name: 'homeL', desc: '', args: []);
  }

  /// `Search`
  String get searchLabel {
    return Intl.message('Search', name: 'searchLabel', desc: '', args: []);
  }

  /// `Sell`
  String get addL {
    return Intl.message('Sell', name: 'addL', desc: '', args: []);
  }

  /// `Favorites`
  String get favoritesL {
    return Intl.message('Favorites', name: 'favoritesL', desc: '', args: []);
  }

  /// `Profile`
  String get profileL {
    return Intl.message('Profile', name: 'profileL', desc: '', args: []);
  }

  /// `Seller Information`
  String get sellerInformation {
    return Intl.message(
      'Seller Information',
      name: 'sellerInformation',
      desc: '',
      args: [],
    );
  }

  /// `Engine`
  String get engine {
    return Intl.message('Engine', name: 'engine', desc: '', args: []);
  }

  /// `Engine Specification`
  String get engineSpec {
    return Intl.message(
      'Engine Specification',
      name: 'engineSpec',
      desc: '',
      args: [],
    );
  }

  /// `Kilometers`
  String get detailsKmLabel {
    return Intl.message(
      'Kilometers',
      name: 'detailsKmLabel',
      desc: '',
      args: [],
    );
  }

  /// `Fuel`
  String get dFuel {
    return Intl.message('Fuel', name: 'dFuel', desc: '', args: []);
  }

  /// `Transmission`
  String get detailsTransmissionLabel {
    return Intl.message(
      'Transmission',
      name: 'detailsTransmissionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Body Type`
  String get dBodyType {
    return Intl.message('Body Type', name: 'dBodyType', desc: '', args: []);
  }

  /// `Paint Color`
  String get dPaintColor {
    return Intl.message('Paint Color', name: 'dPaintColor', desc: '', args: []);
  }

  /// `Paint Condition`
  String get dPaintCondition {
    return Intl.message(
      'Paint Condition',
      name: 'dPaintCondition',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get dLocation {
    return Intl.message('Location', name: 'dLocation', desc: '', args: []);
  }

  /// `Message Seller`
  String get messageSeller {
    return Intl.message(
      'Message Seller',
      name: 'messageSeller',
      desc: '',
      args: [],
    );
  }

  /// `Call Seller`
  String get callSeller {
    return Intl.message('Call Seller', name: 'callSeller', desc: '', args: []);
  }

  /// `EGP`
  String get egp {
    return Intl.message('EGP', name: 'egp', desc: '', args: []);
  }

  /// `Get Directions`
  String get getDirections {
    return Intl.message(
      'Get Directions',
      name: 'getDirections',
      desc: '',
      args: [],
    );
  }

  /// `Cylinder`
  String get cylinder {
    return Intl.message('Cylinder', name: 'cylinder', desc: '', args: []);
  }

  /// `CC`
  String get cc {
    return Intl.message('CC', name: 'cc', desc: '', args: []);
  }

  /// `Details`
  String get details {
    return Intl.message('Details', name: 'details', desc: '', args: []);
  }

  /// `Browse our extensive inventory of new and used vehicles from top brands.`
  String get browse {
    return Intl.message(
      'Browse our extensive inventory of new and used vehicles from top brands.',
      name: 'browse',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get getStarted {
    return Intl.message('Get Started', name: 'getStarted', desc: '', args: []);
  }

  /// `Pick your car`
  String get pick {
    return Intl.message('Pick your car', name: 'pick', desc: '', args: []);
  }

  /// `Browse top brands with detailed specs and offers.`
  String get browseTopBrands {
    return Intl.message(
      'Browse top brands with detailed specs and offers.',
      name: 'browseTopBrands',
      desc: '',
      args: [],
    );
  }

  /// `Make it yours`
  String get makeIt {
    return Intl.message('Make it yours', name: 'makeIt', desc: '', args: []);
  }

  /// `Compare prices, check details, and complete your purchase with ease.`
  String get compare {
    return Intl.message(
      'Compare prices, check details, and complete your purchase with ease.',
      name: 'compare',
      desc: '',
      args: [],
    );
  }

  /// `Body Type`
  String get carBodyTypeLabel {
    return Intl.message(
      'Body Type',
      name: 'carBodyTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Body Types`
  String get bodyTypes {
    return Intl.message('Body Types', name: 'bodyTypes', desc: '', args: []);
  }

  /// `Select Body Type`
  String get selectCarBodyType {
    return Intl.message(
      'Select Body Type',
      name: 'selectCarBodyType',
      desc: '',
      args: [],
    );
  }

  /// `No Body Types Found`
  String get noCarBodyTypesFound {
    return Intl.message(
      'No Body Types Found',
      name: 'noCarBodyTypesFound',
      desc: '',
      args: [],
    );
  }

  /// `Please select a body type`
  String get pleaseSelectCarBodyType {
    return Intl.message(
      'Please select a body type',
      name: 'pleaseSelectCarBodyType',
      desc: '',
      args: [],
    );
  }

  /// `Sedan`
  String get sedan {
    return Intl.message('Sedan', name: 'sedan', desc: '', args: []);
  }

  /// `SUV`
  String get suv {
    return Intl.message('SUV', name: 'suv', desc: '', args: []);
  }

  /// `Hatchback`
  String get hatchback {
    return Intl.message('Hatchback', name: 'hatchback', desc: '', args: []);
  }

  /// `4X4`
  String get fourByFour {
    return Intl.message('4X4', name: 'fourByFour', desc: '', args: []);
  }

  /// `Sports / Coupe`
  String get sportsCoupe {
    return Intl.message(
      'Sports / Coupe',
      name: 'sportsCoupe',
      desc: '',
      args: [],
    );
  }

  /// `Convertible`
  String get convertible {
    return Intl.message('Convertible', name: 'convertible', desc: '', args: []);
  }

  /// `Pickup`
  String get pickup {
    return Intl.message('Pickup', name: 'pickup', desc: '', args: []);
  }

  /// `Estate / Wagon`
  String get estateWagon {
    return Intl.message(
      'Estate / Wagon',
      name: 'estateWagon',
      desc: '',
      args: [],
    );
  }

  /// `Van / Bus`
  String get vanBus {
    return Intl.message('Van / Bus', name: 'vanBus', desc: '', args: []);
  }

  /// `MVP`
  String get mvp {
    return Intl.message('MVP', name: 'mvp', desc: '', args: []);
  }

  /// `Taxi`
  String get taxi {
    return Intl.message('Taxi', name: 'taxi', desc: '', args: []);
  }

  /// `Other`
  String get other {
    return Intl.message('Other', name: 'other', desc: '', args: []);
  }

  /// `Factory Paint`
  String get factoryPaint {
    return Intl.message(
      'Factory Paint',
      name: 'factoryPaint',
      desc: '',
      args: [],
    );
  }

  /// `Touch-ups`
  String get touchUps {
    return Intl.message('Touch-ups', name: 'touchUps', desc: '', args: []);
  }

  /// `Partial Paint`
  String get partialPaint {
    return Intl.message(
      'Partial Paint',
      name: 'partialPaint',
      desc: '',
      args: [],
    );
  }

  /// `Fully Repainted`
  String get fullRepaint {
    return Intl.message(
      'Fully Repainted',
      name: 'fullRepaint',
      desc: '',
      args: [],
    );
  }

  /// `White`
  String get white {
    return Intl.message('White', name: 'white', desc: '', args: []);
  }

  /// `Black`
  String get black {
    return Intl.message('Black', name: 'black', desc: '', args: []);
  }

  /// `Silver`
  String get silver {
    return Intl.message('Silver', name: 'silver', desc: '', args: []);
  }

  /// `Gray`
  String get gray {
    return Intl.message('Gray', name: 'gray', desc: '', args: []);
  }

  /// `Blue`
  String get blue {
    return Intl.message('Blue', name: 'blue', desc: '', args: []);
  }

  /// `Dark Blue`
  String get darkBlue {
    return Intl.message('Dark Blue', name: 'darkBlue', desc: '', args: []);
  }

  /// `Dark Gray`
  String get darkGray {
    return Intl.message('Dark Gray', name: 'darkGray', desc: '', args: []);
  }

  /// `Red`
  String get red {
    return Intl.message('Red', name: 'red', desc: '', args: []);
  }

  /// `Dark Red`
  String get darkRed {
    return Intl.message('Dark Red', name: 'darkRed', desc: '', args: []);
  }

  /// `Green`
  String get green {
    return Intl.message('Green', name: 'green', desc: '', args: []);
  }

  /// `Dark Green`
  String get darkGreen {
    return Intl.message('Dark Green', name: 'darkGreen', desc: '', args: []);
  }

  /// `Gold`
  String get gold {
    return Intl.message('Gold', name: 'gold', desc: '', args: []);
  }

  /// `Bronze`
  String get bronze {
    return Intl.message('Bronze', name: 'bronze', desc: '', args: []);
  }

  /// `Brown`
  String get brown {
    return Intl.message('Brown', name: 'brown', desc: '', args: []);
  }

  /// `Mocha`
  String get mocha {
    return Intl.message('Mocha', name: 'mocha', desc: '', args: []);
  }

  /// `Olive`
  String get olive {
    return Intl.message('Olive', name: 'olive', desc: '', args: []);
  }

  /// `Yellow`
  String get yellow {
    return Intl.message('Yellow', name: 'yellow', desc: '', args: []);
  }

  /// `Orange`
  String get orange {
    return Intl.message('Orange', name: 'orange', desc: '', args: []);
  }

  /// `Cyan`
  String get cyan {
    return Intl.message('Cyan', name: 'cyan', desc: '', args: []);
  }

  /// `Beige`
  String get beige {
    return Intl.message('Beige', name: 'beige', desc: '', args: []);
  }

  /// `Champagne`
  String get champagne {
    return Intl.message('Champagne', name: 'champagne', desc: '', args: []);
  }

  /// `Petroleum`
  String get petroleum {
    return Intl.message('Petroleum', name: 'petroleum', desc: '', args: []);
  }

  /// `Eggplant`
  String get eggplant {
    return Intl.message('Eggplant', name: 'eggplant', desc: '', args: []);
  }

  /// `Purple`
  String get purple {
    return Intl.message('Purple', name: 'purple', desc: '', args: []);
  }

  /// `Other / Custom`
  String get otherCustom {
    return Intl.message(
      'Other / Custom',
      name: 'otherCustom',
      desc: '',
      args: [],
    );
  }

  /// `None`
  String get none {
    return Intl.message('None', name: 'none', desc: '', args: []);
  }

  /// ``
  String get empty {
    return Intl.message('', name: 'empty', desc: '', args: []);
  }

  /// `Cylinder Number`
  String get engineCylinderNumberLabel {
    return Intl.message(
      'Cylinder Number',
      name: 'engineCylinderNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cylinder Number`
  String get dCylinderNumber {
    return Intl.message(
      'Cylinder Number',
      name: 'dCylinderNumber',
      desc: '',
      args: [],
    );
  }

  /// `No Engine Cylinder Numbers Found`
  String get noEngineCylinderNumbersFound {
    return Intl.message(
      'No Engine Cylinder Numbers Found',
      name: 'noEngineCylinderNumbersFound',
      desc: '',
      args: [],
    );
  }

  /// `V`
  String get vEngine {
    return Intl.message('V', name: 'vEngine', desc: '', args: []);
  }

  /// `I`
  String get iEngine {
    return Intl.message('I', name: 'iEngine', desc: '', args: []);
  }

  /// `Select Engine`
  String get selectEngineCylinder {
    return Intl.message(
      'Select Engine',
      name: 'selectEngineCylinder',
      desc: '',
      args: [],
    );
  }

  /// `Please select engine cylinder number`
  String get pleaseSelectEngineCylinder {
    return Intl.message(
      'Please select engine cylinder number',
      name: 'pleaseSelectEngineCylinder',
      desc: '',
      args: [],
    );
  }

  /// `3 Cylinder`
  String get i3Engine {
    return Intl.message('3 Cylinder', name: 'i3Engine', desc: '', args: []);
  }

  /// `4 Cylinder`
  String get i4Engine {
    return Intl.message('4 Cylinder', name: 'i4Engine', desc: '', args: []);
  }

  /// `5 Cylinder`
  String get i5Engine {
    return Intl.message('5 Cylinder', name: 'i5Engine', desc: '', args: []);
  }

  /// `6 Cylinder I6`
  String get i6Engine {
    return Intl.message('6 Cylinder I6', name: 'i6Engine', desc: '', args: []);
  }

  /// `6 Cylinder`
  String get s6Engine {
    return Intl.message('6 Cylinder', name: 's6Engine', desc: '', args: []);
  }

  /// `6 Cylinder V6`
  String get v6Engine {
    return Intl.message('6 Cylinder V6', name: 'v6Engine', desc: '', args: []);
  }

  /// `8 Cylinder`
  String get v8Engine {
    return Intl.message('8 Cylinder', name: 'v8Engine', desc: '', args: []);
  }

  /// `10 Cylinder`
  String get v10Engine {
    return Intl.message('10 Cylinder', name: 'v10Engine', desc: '', args: []);
  }

  /// `12 Cylinder`
  String get v12Engine {
    return Intl.message('12 Cylinder', name: 'v12Engine', desc: '', args: []);
  }

  /// `16 Cylinder`
  String get v16Engine {
    return Intl.message('16 Cylinder', name: 'v16Engine', desc: '', args: []);
  }

  /// `I3`
  String get i3EngineSpec {
    return Intl.message('I3', name: 'i3EngineSpec', desc: '', args: []);
  }

  /// `I4`
  String get i4EngineSpec {
    return Intl.message('I4', name: 'i4EngineSpec', desc: '', args: []);
  }

  /// `I5`
  String get i5EngineSpec {
    return Intl.message('I5', name: 'i5EngineSpec', desc: '', args: []);
  }

  /// `I6`
  String get i6EngineSpec {
    return Intl.message('I6', name: 'i6EngineSpec', desc: '', args: []);
  }

  /// `V6`
  String get v6EngineSpec {
    return Intl.message('V6', name: 'v6EngineSpec', desc: '', args: []);
  }

  /// `V8`
  String get v8EngineSpec {
    return Intl.message('V8', name: 'v8EngineSpec', desc: '', args: []);
  }

  /// `V10`
  String get v10EngineSpec {
    return Intl.message('V10', name: 'v10EngineSpec', desc: '', args: []);
  }

  /// `V12`
  String get v12EngineSpec {
    return Intl.message('V12', name: 'v12EngineSpec', desc: '', args: []);
  }

  /// `V16`
  String get v16EngineSpec {
    return Intl.message('V16', name: 'v16EngineSpec', desc: '', args: []);
  }

  /// `Engine Capacity`
  String get engineCapacity {
    return Intl.message(
      'Engine Capacity',
      name: 'engineCapacity',
      desc: '',
      args: [],
    );
  }

  /// `Engine Capacity`
  String get dEngineCapacity {
    return Intl.message(
      'Engine Capacity',
      name: 'dEngineCapacity',
      desc: '',
      args: [],
    );
  }

  /// `Engine Capacity (CC)`
  String get engineCapacityLabel {
    return Intl.message(
      'Engine Capacity (CC)',
      name: 'engineCapacityLabel',
      desc: '',
      args: [],
    );
  }

  /// `No Engine Capacity Found`
  String get noEngineCapacityFound {
    return Intl.message(
      'No Engine Capacity Found',
      name: 'noEngineCapacityFound',
      desc: '',
      args: [],
    );
  }

  /// `Select Engine CC`
  String get selectEngineCapacity {
    return Intl.message(
      'Select Engine CC',
      name: 'selectEngineCapacity',
      desc: '',
      args: [],
    );
  }

  /// `Please select engine capacity`
  String get pleaseSelectEngineCapacity {
    return Intl.message(
      'Please select engine capacity',
      name: 'pleaseSelectEngineCapacity',
      desc: '',
      args: [],
    );
  }

  /// `600 CC`
  String get c600 {
    return Intl.message('600 CC', name: 'c600', desc: '', args: []);
  }

  /// `600`
  String get c600Value {
    return Intl.message('600', name: 'c600Value', desc: '', args: []);
  }

  /// `700 CC`
  String get c700 {
    return Intl.message('700 CC', name: 'c700', desc: '', args: []);
  }

  /// `700`
  String get c700Value {
    return Intl.message('700', name: 'c700Value', desc: '', args: []);
  }

  /// `800 CC`
  String get c800 {
    return Intl.message('800 CC', name: 'c800', desc: '', args: []);
  }

  /// `800`
  String get c800Value {
    return Intl.message('800', name: 'c800Value', desc: '', args: []);
  }

  /// `1000 CC`
  String get c1000 {
    return Intl.message('1000 CC', name: 'c1000', desc: '', args: []);
  }

  /// `1000`
  String get c1000Value {
    return Intl.message('1000', name: 'c1000Value', desc: '', args: []);
  }

  /// `1100 CC`
  String get c1100 {
    return Intl.message('1100 CC', name: 'c1100', desc: '', args: []);
  }

  /// `1100`
  String get c1100Value {
    return Intl.message('1100', name: 'c1100Value', desc: '', args: []);
  }

  /// `1200 CC`
  String get c1200 {
    return Intl.message('1200 CC', name: 'c1200', desc: '', args: []);
  }

  /// `1200`
  String get c1200Value {
    return Intl.message('1200', name: 'c1200Value', desc: '', args: []);
  }

  /// `1300 CC`
  String get c1300 {
    return Intl.message('1300 CC', name: 'c1300', desc: '', args: []);
  }

  /// `1300`
  String get c1300Value {
    return Intl.message('1300', name: 'c1300Value', desc: '', args: []);
  }

  /// `1400 CC`
  String get c1400 {
    return Intl.message('1400 CC', name: 'c1400', desc: '', args: []);
  }

  /// `1400`
  String get c1400Value {
    return Intl.message('1400', name: 'c1400Value', desc: '', args: []);
  }

  /// `1500 CC`
  String get c1500 {
    return Intl.message('1500 CC', name: 'c1500', desc: '', args: []);
  }

  /// `1500`
  String get c1500Value {
    return Intl.message('1500', name: 'c1500Value', desc: '', args: []);
  }

  /// `1600 CC`
  String get c1600 {
    return Intl.message('1600 CC', name: 'c1600', desc: '', args: []);
  }

  /// `1600`
  String get c1600Value {
    return Intl.message('1600', name: 'c1600Value', desc: '', args: []);
  }

  /// `1800 CC`
  String get c1800 {
    return Intl.message('1800 CC', name: 'c1800', desc: '', args: []);
  }

  /// `1800`
  String get c1800Value {
    return Intl.message('1800', name: 'c1800Value', desc: '', args: []);
  }

  /// `2000 CC`
  String get c2000 {
    return Intl.message('2000 CC', name: 'c2000', desc: '', args: []);
  }

  /// `2000`
  String get c2000Value {
    return Intl.message('2000', name: 'c2000Value', desc: '', args: []);
  }

  /// `2100 CC`
  String get c2100 {
    return Intl.message('2100 CC', name: 'c2100', desc: '', args: []);
  }

  /// `2100`
  String get c2100Value {
    return Intl.message('2100', name: 'c2100Value', desc: '', args: []);
  }

  /// `2200 CC`
  String get c2200 {
    return Intl.message('2200 CC', name: 'c2200', desc: '', args: []);
  }

  /// `2200`
  String get c2200Value {
    return Intl.message('2200', name: 'c2200Value', desc: '', args: []);
  }

  /// `2300 CC`
  String get c2300 {
    return Intl.message('2300 CC', name: 'c2300', desc: '', args: []);
  }

  /// `2300`
  String get c2300Value {
    return Intl.message('2300', name: 'c2300Value', desc: '', args: []);
  }

  /// `2400 CC`
  String get c2400 {
    return Intl.message('2400 CC', name: 'c2400', desc: '', args: []);
  }

  /// `2400`
  String get c2400Value {
    return Intl.message('2400', name: 'c2400Value', desc: '', args: []);
  }

  /// `2500 CC`
  String get c2500 {
    return Intl.message('2500 CC', name: 'c2500', desc: '', args: []);
  }

  /// `2500`
  String get c2500Value {
    return Intl.message('2500', name: 'c2500Value', desc: '', args: []);
  }

  /// `2600 CC`
  String get c2600 {
    return Intl.message('2600 CC', name: 'c2600', desc: '', args: []);
  }

  /// `2600`
  String get c2600Value {
    return Intl.message('2600', name: 'c2600Value', desc: '', args: []);
  }

  /// `2700 CC`
  String get c2700 {
    return Intl.message('2700 CC', name: 'c2700', desc: '', args: []);
  }

  /// `2700`
  String get c2700Value {
    return Intl.message('2700', name: 'c2700Value', desc: '', args: []);
  }

  /// `2800 CC`
  String get c2800 {
    return Intl.message('2800 CC', name: 'c2800', desc: '', args: []);
  }

  /// `2800`
  String get c2800Value {
    return Intl.message('2800', name: 'c2800Value', desc: '', args: []);
  }

  /// `2900 CC`
  String get c2900 {
    return Intl.message('2900 CC', name: 'c2900', desc: '', args: []);
  }

  /// `2900`
  String get c2900Value {
    return Intl.message('2900', name: 'c2900Value', desc: '', args: []);
  }

  /// `3000 CC`
  String get c3000 {
    return Intl.message('3000 CC', name: 'c3000', desc: '', args: []);
  }

  /// `3000`
  String get c3000Value {
    return Intl.message('3000', name: 'c3000Value', desc: '', args: []);
  }

  /// `3200 CC`
  String get c3200 {
    return Intl.message('3200 CC', name: 'c3200', desc: '', args: []);
  }

  /// `3200`
  String get c3200Value {
    return Intl.message('3200', name: 'c3200Value', desc: '', args: []);
  }

  /// `3300 CC`
  String get c3300 {
    return Intl.message('3300 CC', name: 'c3300', desc: '', args: []);
  }

  /// `3300`
  String get c3300Value {
    return Intl.message('3300', name: 'c3300Value', desc: '', args: []);
  }

  /// `3400 CC`
  String get c3400 {
    return Intl.message('3400 CC', name: 'c3400', desc: '', args: []);
  }

  /// `3400`
  String get c3400Value {
    return Intl.message('3400', name: 'c3400Value', desc: '', args: []);
  }

  /// `3500 CC`
  String get c3500 {
    return Intl.message('3500 CC', name: 'c3500', desc: '', args: []);
  }

  /// `3500`
  String get c3500Value {
    return Intl.message('3500', name: 'c3500Value', desc: '', args: []);
  }

  /// `3600 CC`
  String get c3600 {
    return Intl.message('3600 CC', name: 'c3600', desc: '', args: []);
  }

  /// `3600`
  String get c3600Value {
    return Intl.message('3600', name: 'c3600Value', desc: '', args: []);
  }

  /// `3700 CC`
  String get c3700 {
    return Intl.message('3700 CC', name: 'c3700', desc: '', args: []);
  }

  /// `3700`
  String get c3700Value {
    return Intl.message('3700', name: 'c3700Value', desc: '', args: []);
  }

  /// `3800 CC`
  String get c3800 {
    return Intl.message('3800 CC', name: 'c3800', desc: '', args: []);
  }

  /// `3800`
  String get c3800Value {
    return Intl.message('3800', name: 'c3800Value', desc: '', args: []);
  }

  /// `4000 CC`
  String get c4000 {
    return Intl.message('4000 CC', name: 'c4000', desc: '', args: []);
  }

  /// `4000`
  String get c4000Value {
    return Intl.message('4000', name: 'c4000Value', desc: '', args: []);
  }

  /// `4100 CC`
  String get c4100 {
    return Intl.message('4100 CC', name: 'c4100', desc: '', args: []);
  }

  /// `4100`
  String get c4100Value {
    return Intl.message('4100', name: 'c4100Value', desc: '', args: []);
  }

  /// `4200 CC`
  String get c4200 {
    return Intl.message('4200 CC', name: 'c4200', desc: '', args: []);
  }

  /// `4200`
  String get c4200Value {
    return Intl.message('4200', name: 'c4200Value', desc: '', args: []);
  }

  /// `4400 CC`
  String get c4400 {
    return Intl.message('4400 CC', name: 'c4400', desc: '', args: []);
  }

  /// `4400`
  String get c4400Value {
    return Intl.message('4400', name: 'c4400Value', desc: '', args: []);
  }

  /// `4500 CC`
  String get c4500 {
    return Intl.message('4500 CC', name: 'c4500', desc: '', args: []);
  }

  /// `4500`
  String get c4500Value {
    return Intl.message('4500', name: 'c4500Value', desc: '', args: []);
  }

  /// `4800 CC`
  String get c4800 {
    return Intl.message('4800 CC', name: 'c4800', desc: '', args: []);
  }

  /// `4800`
  String get c4800Value {
    return Intl.message('4800', name: 'c4800Value', desc: '', args: []);
  }

  /// `4600 CC`
  String get c4600 {
    return Intl.message('4600 CC', name: 'c4600', desc: '', args: []);
  }

  /// `4600`
  String get c4600Value {
    return Intl.message('4600', name: 'c4600Value', desc: '', args: []);
  }

  /// `5000 CC`
  String get c5000 {
    return Intl.message('5000 CC', name: 'c5000', desc: '', args: []);
  }

  /// `5000`
  String get c5000Value {
    return Intl.message('5000', name: 'c5000Value', desc: '', args: []);
  }

  /// `5200 CC`
  String get c5200 {
    return Intl.message('5200 CC', name: 'c5200', desc: '', args: []);
  }

  /// `5200`
  String get c5200Value {
    return Intl.message('5200', name: 'c5200Value', desc: '', args: []);
  }

  /// `5300 CC`
  String get c5300 {
    return Intl.message('5300 CC', name: 'c5300', desc: '', args: []);
  }

  /// `5300`
  String get c5300Value {
    return Intl.message('5300', name: 'c5300Value', desc: '', args: []);
  }

  /// `5500 CC`
  String get c5500 {
    return Intl.message('5500 CC', name: 'c5500', desc: '', args: []);
  }

  /// `5500`
  String get c5500Value {
    return Intl.message('5500', name: 'c5500Value', desc: '', args: []);
  }

  /// `5700 CC`
  String get c5700 {
    return Intl.message('5700 CC', name: 'c5700', desc: '', args: []);
  }

  /// `5700`
  String get c5700Value {
    return Intl.message('5700', name: 'c5700Value', desc: '', args: []);
  }

  /// `5800 CC`
  String get c5800 {
    return Intl.message('5800 CC', name: 'c5800', desc: '', args: []);
  }

  /// `5800`
  String get c5800Value {
    return Intl.message('5800', name: 'c5800Value', desc: '', args: []);
  }

  /// `6000 CC`
  String get c6000 {
    return Intl.message('6000 CC', name: 'c6000', desc: '', args: []);
  }

  /// `6000`
  String get c6000Value {
    return Intl.message('6000', name: 'c6000Value', desc: '', args: []);
  }

  /// `6200 CC`
  String get c6200 {
    return Intl.message('6200 CC', name: 'c6200', desc: '', args: []);
  }

  /// `6200`
  String get c6200Value {
    return Intl.message('6200', name: 'c6200Value', desc: '', args: []);
  }

  /// `6300 CC`
  String get c6300 {
    return Intl.message('6300 CC', name: 'c6300', desc: '', args: []);
  }

  /// `6300`
  String get c6300Value {
    return Intl.message('6300', name: 'c6300Value', desc: '', args: []);
  }

  /// `6400 CC`
  String get c6400 {
    return Intl.message('6400 CC', name: 'c6400', desc: '', args: []);
  }

  /// `6400`
  String get c6400Value {
    return Intl.message('6400', name: 'c6400Value', desc: '', args: []);
  }

  /// `6500 CC`
  String get c6500 {
    return Intl.message('6500 CC', name: 'c6500', desc: '', args: []);
  }

  /// `6500`
  String get c6500Value {
    return Intl.message('6500', name: 'c6500Value', desc: '', args: []);
  }

  /// `6600 CC`
  String get c6600 {
    return Intl.message('6600 CC', name: 'c6600', desc: '', args: []);
  }

  /// `6600`
  String get c6600Value {
    return Intl.message('6600', name: 'c6600Value', desc: '', args: []);
  }

  /// `7000 CC`
  String get c7000 {
    return Intl.message('7000 CC', name: 'c7000', desc: '', args: []);
  }

  /// `7000`
  String get c7000Value {
    return Intl.message('7000', name: 'c7000Value', desc: '', args: []);
  }

  /// `7200 CC`
  String get c7200 {
    return Intl.message('7200 CC', name: 'c7200', desc: '', args: []);
  }

  /// `7200`
  String get c7200Value {
    return Intl.message('7200', name: 'c7200Value', desc: '', args: []);
  }

  /// `7500 CC`
  String get c7500 {
    return Intl.message('7500 CC', name: 'c7500', desc: '', args: []);
  }

  /// `7500`
  String get c7500Value {
    return Intl.message('7500', name: 'c7500Value', desc: '', args: []);
  }

  /// `8000 CC`
  String get c8000 {
    return Intl.message('8000 CC', name: 'c8000', desc: '', args: []);
  }

  /// `8000`
  String get c8000Value {
    return Intl.message('8000', name: 'c8000Value', desc: '', args: []);
  }

  /// `Safety Features`
  String get safetyFeatures {
    return Intl.message(
      'Safety Features',
      name: 'safetyFeatures',
      desc: '',
      args: [],
    );
  }

  /// `safety`
  String get safetyFeaturesId {
    return Intl.message('safety', name: 'safetyFeaturesId', desc: '', args: []);
  }

  /// `Driver Assistance (ADAS)`
  String get driverAssistance {
    return Intl.message(
      'Driver Assistance (ADAS)',
      name: 'driverAssistance',
      desc: '',
      args: [],
    );
  }

  /// `driver_assistance`
  String get driverAssistanceId {
    return Intl.message(
      'driver_assistance',
      name: 'driverAssistanceId',
      desc: '',
      args: [],
    );
  }

  /// `Driver Airbag`
  String get driverAirbagLabel {
    return Intl.message(
      'Driver Airbag',
      name: 'driverAirbagLabel',
      desc: '',
      args: [],
    );
  }

  /// ` driver_airbag`
  String get driverAirbagId {
    return Intl.message(
      ' driver_airbag',
      name: 'driverAirbagId',
      desc: '',
      args: [],
    );
  }

  /// `Passenger Airbag`
  String get passengerAirbagLabel {
    return Intl.message(
      'Passenger Airbag',
      name: 'passengerAirbagLabel',
      desc: '',
      args: [],
    );
  }

  /// ` passenger_airbag`
  String get passengerAirbagId {
    return Intl.message(
      ' passenger_airbag',
      name: 'passengerAirbagId',
      desc: '',
      args: [],
    );
  }

  /// `Side Airbag`
  String get sideAirbagLabel {
    return Intl.message(
      'Side Airbag',
      name: 'sideAirbagLabel',
      desc: '',
      args: [],
    );
  }

  /// ` side_airbag`
  String get sideAirbagId {
    return Intl.message(
      ' side_airbag',
      name: 'sideAirbagId',
      desc: '',
      args: [],
    );
  }

  /// `ABS`
  String get absLabel {
    return Intl.message('ABS', name: 'absLabel', desc: '', args: []);
  }

  /// ` abs`
  String get absId {
    return Intl.message(' abs', name: 'absId', desc: '', args: []);
  }

  /// `ESP / ESC`
  String get espLabel {
    return Intl.message('ESP / ESC', name: 'espLabel', desc: '', args: []);
  }

  /// ` esp`
  String get espId {
    return Intl.message(' esp', name: 'espId', desc: '', args: []);
  }

  /// `ISOFIX`
  String get isofixLabel {
    return Intl.message('ISOFIX', name: 'isofixLabel', desc: '', args: []);
  }

  /// ` isofix`
  String get isofixId {
    return Intl.message(' isofix', name: 'isofixId', desc: '', args: []);
  }

  /// `Traction Control`
  String get tclLabel {
    return Intl.message(
      'Traction Control',
      name: 'tclLabel',
      desc: '',
      args: [],
    );
  }

  /// `traction_control`
  String get tclId {
    return Intl.message('traction_control', name: 'tclId', desc: '', args: []);
  }

  /// `Electronic Power Steering`
  String get epsLabel {
    return Intl.message(
      'Electronic Power Steering',
      name: 'epsLabel',
      desc: '',
      args: [],
    );
  }

  /// `eps`
  String get epsId {
    return Intl.message('eps', name: 'epsId', desc: '', args: []);
  }

  /// `Tyre Pressure Monitoring System`
  String get tpmsLabel {
    return Intl.message(
      'Tyre Pressure Monitoring System',
      name: 'tpmsLabel',
      desc: '',
      args: [],
    );
  }

  /// `tpms`
  String get tpmsId {
    return Intl.message('tpms', name: 'tpmsId', desc: '', args: []);
  }

  /// `Immobilizer Key`
  String get immobilizerLabel {
    return Intl.message(
      'Immobilizer Key',
      name: 'immobilizerLabel',
      desc: '',
      args: [],
    );
  }

  /// `immobilizer`
  String get immobilizerId {
    return Intl.message(
      'immobilizer',
      name: 'immobilizerId',
      desc: '',
      args: [],
    );
  }

  /// `Anti-theft Alarm`
  String get alarmLabel {
    return Intl.message(
      'Anti-theft Alarm',
      name: 'alarmLabel',
      desc: '',
      args: [],
    );
  }

  /// `alarm`
  String get alarmId {
    return Intl.message('alarm', name: 'alarmId', desc: '', args: []);
  }

  /// `Warning System`
  String get warningFeatureLabel {
    return Intl.message(
      'Warning System',
      name: 'warningFeatureLabel',
      desc: '',
      args: [],
    );
  }

  /// `warning_system`
  String get warningFeatureId {
    return Intl.message(
      'warning_system',
      name: 'warningFeatureId',
      desc: '',
      args: [],
    );
  }

  /// `Electronic Handbrake`
  String get eHandBrakeLabel {
    return Intl.message(
      'Electronic Handbrake',
      name: 'eHandBrakeLabel',
      desc: '',
      args: [],
    );
  }

  /// `e_hand_brake`
  String get eHandBrakeId {
    return Intl.message(
      'e_hand_brake',
      name: 'eHandBrakeId',
      desc: '',
      args: [],
    );
  }

  /// `Rear Fog Lights`
  String get rearFogLabel {
    return Intl.message(
      'Rear Fog Lights',
      name: 'rearFogLabel',
      desc: '',
      args: [],
    );
  }

  /// `rear_fog`
  String get rearFogId {
    return Intl.message('rear_fog', name: 'rearFogId', desc: '', args: []);
  }

  /// `Active Headlights`
  String get activeHeadlightsLabel {
    return Intl.message(
      'Active Headlights',
      name: 'activeHeadlightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `active_headlights`
  String get activeHeadlightsId {
    return Intl.message(
      'active_headlights',
      name: 'activeHeadlightsId',
      desc: '',
      args: [],
    );
  }

  /// `LED Lights`
  String get ledLightsLabel {
    return Intl.message(
      'LED Lights',
      name: 'ledLightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `led_lights`
  String get ledLightsId {
    return Intl.message('led_lights', name: 'ledLightsId', desc: '', args: []);
  }

  /// `Fog Lights`
  String get fogLightsLabel {
    return Intl.message(
      'Fog Lights',
      name: 'fogLightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `fog_lights`
  String get fogLightsId {
    return Intl.message('fog_lights', name: 'fogLightsId', desc: '', args: []);
  }

  /// `Daytime Running Lights`
  String get dayLightsLabel {
    return Intl.message(
      'Daytime Running Lights',
      name: 'dayLightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `day_lights`
  String get dayLightsId {
    return Intl.message('day_lights', name: 'dayLightsId', desc: '', args: []);
  }

  /// `Forward Crash Warning`
  String get forwardCrashWarningLabel {
    return Intl.message(
      'Forward Crash Warning',
      name: 'forwardCrashWarningLabel',
      desc: '',
      args: [],
    );
  }

  /// `forward_crash_warning`
  String get forwardCrashWarningId {
    return Intl.message(
      'forward_crash_warning',
      name: 'forwardCrashWarningId',
      desc: '',
      args: [],
    );
  }

  /// `Driver Drowsiness Detection`
  String get driverDrowsinessDetectionLabel {
    return Intl.message(
      'Driver Drowsiness Detection',
      name: 'driverDrowsinessDetectionLabel',
      desc: '',
      args: [],
    );
  }

  /// `driver_drowsiness_detection`
  String get driverDrowsinessDetectionId {
    return Intl.message(
      'driver_drowsiness_detection',
      name: 'driverDrowsinessDetectionId',
      desc: '',
      args: [],
    );
  }

  /// `Driver Attention Warning`
  String get driverAttentionWarningLabel {
    return Intl.message(
      'Driver Attention Warning',
      name: 'driverAttentionWarningLabel',
      desc: '',
      args: [],
    );
  }

  /// `driver_attention_warning`
  String get driverAttentionWarningId {
    return Intl.message(
      'driver_attention_warning',
      name: 'driverAttentionWarningId',
      desc: '',
      args: [],
    );
  }

  /// `Speed Limit Recognition`
  String get speedLimitRecogniseLabel {
    return Intl.message(
      'Speed Limit Recognition',
      name: 'speedLimitRecogniseLabel',
      desc: '',
      args: [],
    );
  }

  /// `speed_limit_recognise`
  String get speedLimitRecogniseId {
    return Intl.message(
      'speed_limit_recognise',
      name: 'speedLimitRecogniseId',
      desc: '',
      args: [],
    );
  }

  /// `Emergency Braking`
  String get emergencyBrakingLabel {
    return Intl.message(
      'Emergency Braking',
      name: 'emergencyBrakingLabel',
      desc: '',
      args: [],
    );
  }

  /// `emergency_braking`
  String get emergencyBrakingId {
    return Intl.message(
      'emergency_braking',
      name: 'emergencyBrakingId',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Braking At Low Speeds`
  String get autoBrakingLabel {
    return Intl.message(
      'Automatic Braking At Low Speeds',
      name: 'autoBrakingLabel',
      desc: '',
      args: [],
    );
  }

  /// `auto_braking`
  String get autoBrakingId {
    return Intl.message(
      'auto_braking',
      name: 'autoBrakingId',
      desc: '',
      args: [],
    );
  }

  /// `Distance Warning`
  String get distanceWarningLabel {
    return Intl.message(
      'Distance Warning',
      name: 'distanceWarningLabel',
      desc: '',
      args: [],
    );
  }

  /// `distance_warning`
  String get distanceWarningId {
    return Intl.message(
      'distance_warning',
      name: 'distanceWarningId',
      desc: '',
      args: [],
    );
  }

  /// `Emergency SOS`
  String get emergencySosLabel {
    return Intl.message(
      'Emergency SOS',
      name: 'emergencySosLabel',
      desc: '',
      args: [],
    );
  }

  /// `emergency_sos`
  String get emergencySosId {
    return Intl.message(
      'emergency_sos',
      name: 'emergencySosId',
      desc: '',
      args: [],
    );
  }

  /// `Persons Detection`
  String get personsDetectionLabel {
    return Intl.message(
      'Persons Detection',
      name: 'personsDetectionLabel',
      desc: '',
      args: [],
    );
  }

  /// `persons_detection`
  String get personsDetectionId {
    return Intl.message(
      'persons_detection',
      name: 'personsDetectionId',
      desc: '',
      args: [],
    );
  }

  /// `Auto Hold`
  String get autoHoldLabel {
    return Intl.message('Auto Hold', name: 'autoHoldLabel', desc: '', args: []);
  }

  /// `auto_hold`
  String get autoHoldId {
    return Intl.message('auto_hold', name: 'autoHoldId', desc: '', args: []);
  }

  /// `Hill Assist`
  String get hillAssistLabel {
    return Intl.message(
      'Hill Assist',
      name: 'hillAssistLabel',
      desc: '',
      args: [],
    );
  }

  /// `hill_assist`
  String get hillAssistId {
    return Intl.message(
      'hill_assist',
      name: 'hillAssistId',
      desc: '',
      args: [],
    );
  }

  /// `Front Parking Sensors`
  String get frontParkingSensorsLabel {
    return Intl.message(
      'Front Parking Sensors',
      name: 'frontParkingSensorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `front_parking_sensors`
  String get frontParkingSensorsId {
    return Intl.message(
      'front_parking_sensors',
      name: 'frontParkingSensorsId',
      desc: '',
      args: [],
    );
  }

  /// `Rear Parking Sensors`
  String get rearParkingSensorsLabel {
    return Intl.message(
      'Rear Parking Sensors',
      name: 'rearParkingSensorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `rear_parking_sensors`
  String get rearParkingSensorsId {
    return Intl.message(
      'rear_parking_sensors',
      name: 'rearParkingSensorsId',
      desc: '',
      args: [],
    );
  }

  /// `Parking Sensors`
  String get parkingSensorsLabel {
    return Intl.message(
      'Parking Sensors',
      name: 'parkingSensorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `parking_sensors`
  String get parkingSensorsId {
    return Intl.message(
      'parking_sensors',
      name: 'parkingSensorsId',
      desc: '',
      args: [],
    );
  }

  /// `Parking Assist`
  String get parkingAssistLabel {
    return Intl.message(
      'Parking Assist',
      name: 'parkingAssistLabel',
      desc: '',
      args: [],
    );
  }

  /// `parking_assist`
  String get parkingAssistId {
    return Intl.message(
      'parking_assist',
      name: 'parkingAssistId',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Parking`
  String get autoParkingLabel {
    return Intl.message(
      'Automatic Parking',
      name: 'autoParkingLabel',
      desc: '',
      args: [],
    );
  }

  /// `auto_parking`
  String get autoParkingId {
    return Intl.message(
      'auto_parking',
      name: 'autoParkingId',
      desc: '',
      args: [],
    );
  }

  /// `360 Camera`
  String get camera360Label {
    return Intl.message(
      '360 Camera',
      name: 'camera360Label',
      desc: '',
      args: [],
    );
  }

  /// `camera_360`
  String get camera360Id {
    return Intl.message('camera_360', name: 'camera360Id', desc: '', args: []);
  }

  /// `Rear View Camera`
  String get carRearViewCameraLabel {
    return Intl.message(
      'Rear View Camera',
      name: 'carRearViewCameraLabel',
      desc: '',
      args: [],
    );
  }

  /// `rear_view_camera`
  String get carRearViewCameraId {
    return Intl.message(
      'rear_view_camera',
      name: 'carRearViewCameraId',
      desc: '',
      args: [],
    );
  }

  /// `Front View Camera`
  String get carFrontViewCameraLabel {
    return Intl.message(
      'Front View Camera',
      name: 'carFrontViewCameraLabel',
      desc: '',
      args: [],
    );
  }

  /// `front_view_camera`
  String get carFrontViewCameraId {
    return Intl.message(
      'front_view_camera',
      name: 'carFrontViewCameraId',
      desc: '',
      args: [],
    );
  }

  /// `Adaptive Lights`
  String get adaptiveLightsLabel {
    return Intl.message(
      'Adaptive Lights',
      name: 'adaptiveLightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `adaptive_lights`
  String get adaptiveLightsId {
    return Intl.message(
      'adaptive_lights',
      name: 'adaptiveLightsId',
      desc: '',
      args: [],
    );
  }

  /// `Cruise Control`
  String get cruiseControlLabel {
    return Intl.message(
      'Cruise Control',
      name: 'cruiseControlLabel',
      desc: '',
      args: [],
    );
  }

  /// `cruise_control`
  String get cruiseControlId {
    return Intl.message(
      'cruise_control',
      name: 'cruiseControlId',
      desc: '',
      args: [],
    );
  }

  /// `Adaptive Cruise Control`
  String get adaptiveCruiseControlLabel {
    return Intl.message(
      'Adaptive Cruise Control',
      name: 'adaptiveCruiseControlLabel',
      desc: '',
      args: [],
    );
  }

  /// `adaptive_cruise_control`
  String get adaptiveCruiseControlId {
    return Intl.message(
      'adaptive_cruise_control',
      name: 'adaptiveCruiseControlId',
      desc: '',
      args: [],
    );
  }

  /// `Power Steering`
  String get powerSteeringLabel {
    return Intl.message(
      'Power Steering',
      name: 'powerSteeringLabel',
      desc: '',
      args: [],
    );
  }

  /// `power_steering`
  String get powerSteeringId {
    return Intl.message(
      'power_steering',
      name: 'powerSteeringId',
      desc: '',
      args: [],
    );
  }

  /// `Multi Steering Wheel`
  String get multiSteeringLabel {
    return Intl.message(
      'Multi Steering Wheel',
      name: 'multiSteeringLabel',
      desc: '',
      args: [],
    );
  }

  /// `multi_steering`
  String get multiSteeringId {
    return Intl.message(
      'multi_steering',
      name: 'multiSteeringId',
      desc: '',
      args: [],
    );
  }

  /// `Blind Spot Monitor`
  String get blindSpotLabel {
    return Intl.message(
      'Blind Spot Monitor',
      name: 'blindSpotLabel',
      desc: '',
      args: [],
    );
  }

  /// `blind_spot`
  String get blindSpotId {
    return Intl.message('blind_spot', name: 'blindSpotId', desc: '', args: []);
  }

  /// `Intersection Assist`
  String get intersectionAssistLabel {
    return Intl.message(
      'Intersection Assist',
      name: 'intersectionAssistLabel',
      desc: '',
      args: [],
    );
  }

  /// `intersection_assist`
  String get intersectionAssistId {
    return Intl.message(
      'intersection_assist',
      name: 'intersectionAssistId',
      desc: '',
      args: [],
    );
  }

  /// `Lane Change Assist`
  String get laneChangeAssistLabel {
    return Intl.message(
      'Lane Change Assist',
      name: 'laneChangeAssistLabel',
      desc: '',
      args: [],
    );
  }

  /// `lane_change_assist`
  String get laneChangeAssistId {
    return Intl.message(
      'lane_change_assist',
      name: 'laneChangeAssistId',
      desc: '',
      args: [],
    );
  }

  /// `Lane Keep Assist`
  String get laneKeepAssistLabel {
    return Intl.message(
      'Lane Keep Assist',
      name: 'laneKeepAssistLabel',
      desc: '',
      args: [],
    );
  }

  /// `lane_keep_assist`
  String get laneKeepAssistId {
    return Intl.message(
      'lane_keep_assist',
      name: 'laneKeepAssistId',
      desc: '',
      args: [],
    );
  }

  /// `Rain Sensor`
  String get rainSensorLabel {
    return Intl.message(
      'Rain Sensor',
      name: 'rainSensorLabel',
      desc: '',
      args: [],
    );
  }

  /// `rain_sensor`
  String get rainSensorId {
    return Intl.message(
      'rain_sensor',
      name: 'rainSensorId',
      desc: '',
      args: [],
    );
  }

  /// `Sound & Multimedia`
  String get soundFeatures {
    return Intl.message(
      'Sound & Multimedia',
      name: 'soundFeatures',
      desc: '',
      args: [],
    );
  }

  /// `sound`
  String get soundFeaturesId {
    return Intl.message('sound', name: 'soundFeaturesId', desc: '', args: []);
  }

  /// `Comfort Features`
  String get comfortFeatures {
    return Intl.message(
      'Comfort Features',
      name: 'comfortFeatures',
      desc: '',
      args: [],
    );
  }

  /// `comfort`
  String get comfortFeaturesId {
    return Intl.message(
      'comfort',
      name: 'comfortFeaturesId',
      desc: '',
      args: [],
    );
  }

  /// `Other Features`
  String get otherFeatures {
    return Intl.message(
      'Other Features',
      name: 'otherFeatures',
      desc: '',
      args: [],
    );
  }

  /// `other`
  String get otherFeaturesId {
    return Intl.message('other', name: 'otherFeaturesId', desc: '', args: []);
  }

  /// `Touch Screen`
  String get touchScreenLabel {
    return Intl.message(
      'Touch Screen',
      name: 'touchScreenLabel',
      desc: '',
      args: [],
    );
  }

  /// `touch_screen`
  String get touchScreenId {
    return Intl.message(
      'touch_screen',
      name: 'touchScreenId',
      desc: '',
      args: [],
    );
  }

  /// `Navigation System`
  String get navigationSystemLabel {
    return Intl.message(
      'Navigation System',
      name: 'navigationSystemLabel',
      desc: '',
      args: [],
    );
  }

  /// `navigation_system`
  String get navigationSystemId {
    return Intl.message(
      'navigation_system',
      name: 'navigationSystemId',
      desc: '',
      args: [],
    );
  }

  /// `Car Tracing System (GPS)`
  String get gpsLabel {
    return Intl.message(
      'Car Tracing System (GPS)',
      name: 'gpsLabel',
      desc: '',
      args: [],
    );
  }

  /// `gps`
  String get gpsId {
    return Intl.message('gps', name: 'gpsId', desc: '', args: []);
  }

  /// `Radio`
  String get radioLabel {
    return Intl.message('Radio', name: 'radioLabel', desc: '', args: []);
  }

  /// `radio`
  String get radioId {
    return Intl.message('radio', name: 'radioId', desc: '', args: []);
  }

  /// `Premium Sound System`
  String get soundSystemLabel {
    return Intl.message(
      'Premium Sound System',
      name: 'soundSystemLabel',
      desc: '',
      args: [],
    );
  }

  /// `sound_system`
  String get soundSystemId {
    return Intl.message(
      'sound_system',
      name: 'soundSystemId',
      desc: '',
      args: [],
    );
  }

  /// `Bluetooth`
  String get bluetoothLabel {
    return Intl.message(
      'Bluetooth',
      name: 'bluetoothLabel',
      desc: '',
      args: [],
    );
  }

  /// `bluetooth`
  String get bluetoothId {
    return Intl.message('bluetooth', name: 'bluetoothId', desc: '', args: []);
  }

  /// `AUX`
  String get auxLabel {
    return Intl.message('AUX', name: 'auxLabel', desc: '', args: []);
  }

  /// `aux`
  String get auxId {
    return Intl.message('aux', name: 'auxId', desc: '', args: []);
  }

  /// `USB-C`
  String get usbCLabel {
    return Intl.message('USB-C', name: 'usbCLabel', desc: '', args: []);
  }

  /// `usb_c`
  String get usbCId {
    return Intl.message('usb_c', name: 'usbCId', desc: '', args: []);
  }

  /// `USB`
  String get usbLabel {
    return Intl.message('USB', name: 'usbLabel', desc: '', args: []);
  }

  /// `usb`
  String get usbId {
    return Intl.message('usb', name: 'usbId', desc: '', args: []);
  }

  /// `Apple CarPlay`
  String get carplayLabel {
    return Intl.message(
      'Apple CarPlay',
      name: 'carplayLabel',
      desc: '',
      args: [],
    );
  }

  /// `apple_carplay`
  String get carplayId {
    return Intl.message('apple_carplay', name: 'carplayId', desc: '', args: []);
  }

  /// `Android Auto`
  String get androidAutoLabel {
    return Intl.message(
      'Android Auto',
      name: 'androidAutoLabel',
      desc: '',
      args: [],
    );
  }

  /// `android_auto`
  String get androidAutoId {
    return Intl.message(
      'android_auto',
      name: 'androidAutoId',
      desc: '',
      args: [],
    );
  }

  /// `CD Player`
  String get cdPlayerLabel {
    return Intl.message('CD Player', name: 'cdPlayerLabel', desc: '', args: []);
  }

  /// `cd_player`
  String get cdPlayerId {
    return Intl.message('cd_player', name: 'cdPlayerId', desc: '', args: []);
  }

  /// `DVD Player`
  String get dvdPlayerLabel {
    return Intl.message(
      'DVD Player',
      name: 'dvdPlayerLabel',
      desc: '',
      args: [],
    );
  }

  /// `dvd_player`
  String get dvdPlayerId {
    return Intl.message('dvd_player', name: 'dvdPlayerId', desc: '', args: []);
  }

  /// `CD Changer`
  String get cdChangerLabel {
    return Intl.message(
      'CD Changer',
      name: 'cdChangerLabel',
      desc: '',
      args: [],
    );
  }

  /// `cd_changer`
  String get cdChangerId {
    return Intl.message('cd_changer', name: 'cdChangerId', desc: '', args: []);
  }

  /// `Cassette`
  String get cassetteLabel {
    return Intl.message('Cassette', name: 'cassetteLabel', desc: '', args: []);
  }

  /// `cassette`
  String get cassetteId {
    return Intl.message('cassette', name: 'cassetteId', desc: '', args: []);
  }

  /// `Air Conditioning`
  String get acLabel {
    return Intl.message(
      'Air Conditioning',
      name: 'acLabel',
      desc: '',
      args: [],
    );
  }

  /// `ac`
  String get acId {
    return Intl.message('ac', name: 'acId', desc: '', args: []);
  }

  /// `Sunroof`
  String get sunroofLabel {
    return Intl.message('Sunroof', name: 'sunroofLabel', desc: '', args: []);
  }

  /// `sunroof`
  String get sunroofId {
    return Intl.message('sunroof', name: 'sunroofId', desc: '', args: []);
  }

  /// `Power Windows`
  String get powerWindowsLabel {
    return Intl.message(
      'Power Windows',
      name: 'powerWindowsLabel',
      desc: '',
      args: [],
    );
  }

  /// `power_windows`
  String get powerWindowsId {
    return Intl.message(
      'power_windows',
      name: 'powerWindowsId',
      desc: '',
      args: [],
    );
  }

  /// `Electric Seats`
  String get electricSeatsLabel {
    return Intl.message(
      'Electric Seats',
      name: 'electricSeatsLabel',
      desc: '',
      args: [],
    );
  }

  /// `electric_seats`
  String get electricSeatsId {
    return Intl.message(
      'electric_seats',
      name: 'electricSeatsId',
      desc: '',
      args: [],
    );
  }

  /// `Heated Seats`
  String get heatedSeatsLabel {
    return Intl.message(
      'Heated Seats',
      name: 'heatedSeatsLabel',
      desc: '',
      args: [],
    );
  }

  /// `heated_seats`
  String get heatedSeatsId {
    return Intl.message(
      'heated_seats',
      name: 'heatedSeatsId',
      desc: '',
      args: [],
    );
  }

  /// `Ventilated Seats`
  String get ventilatedSeatsLabel {
    return Intl.message(
      'Ventilated Seats',
      name: 'ventilatedSeatsLabel',
      desc: '',
      args: [],
    );
  }

  /// `ventilated_seats`
  String get ventilatedSeatsId {
    return Intl.message(
      'ventilated_seats',
      name: 'ventilatedSeatsId',
      desc: '',
      args: [],
    );
  }

  /// `Memory Seats`
  String get memorySeatsLabel {
    return Intl.message(
      'Memory Seats',
      name: 'memorySeatsLabel',
      desc: '',
      args: [],
    );
  }

  /// `memory_seats`
  String get memorySeatsId {
    return Intl.message(
      'memory_seats',
      name: 'memorySeatsId',
      desc: '',
      args: [],
    );
  }

  /// `Massage Seats`
  String get massageSeatsLabel {
    return Intl.message(
      'Massage Seats',
      name: 'massageSeatsLabel',
      desc: '',
      args: [],
    );
  }

  /// `massage_seats`
  String get massageSeatsId {
    return Intl.message(
      'massage_seats',
      name: 'massageSeatsId',
      desc: '',
      args: [],
    );
  }

  /// `Heated Mirrors`
  String get heatedMirrorLabel {
    return Intl.message(
      'Heated Mirrors',
      name: 'heatedMirrorLabel',
      desc: '',
      args: [],
    );
  }

  /// `heated_mirror`
  String get heatedMirrorId {
    return Intl.message(
      'heated_mirror',
      name: 'heatedMirrorId',
      desc: '',
      args: [],
    );
  }

  /// `Electric Mirrors`
  String get electricMirrorsLabel {
    return Intl.message(
      'Electric Mirrors',
      name: 'electricMirrorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `electric_mirrors`
  String get electricMirrorsId {
    return Intl.message(
      'electric_mirrors',
      name: 'electricMirrorsId',
      desc: '',
      args: [],
    );
  }

  /// `Folding Mirrors`
  String get foldingMirrorsLabel {
    return Intl.message(
      'Folding Mirrors',
      name: 'foldingMirrorsLabel',
      desc: '',
      args: [],
    );
  }

  /// `folding_mirrors`
  String get foldingMirrorsId {
    return Intl.message(
      'folding_mirrors',
      name: 'foldingMirrorsId',
      desc: '',
      args: [],
    );
  }

  /// `Window Tint`
  String get tintLabel {
    return Intl.message('Window Tint', name: 'tintLabel', desc: '', args: []);
  }

  /// `tint`
  String get tintId {
    return Intl.message('tint', name: 'tintId', desc: '', args: []);
  }

  /// `Cool Box`
  String get coolBoxLabel {
    return Intl.message('Cool Box', name: 'coolBoxLabel', desc: '', args: []);
  }

  /// `cool_box`
  String get coolBoxId {
    return Intl.message('cool_box', name: 'coolBoxId', desc: '', args: []);
  }

  /// `Electric Steering Wheel`
  String get electricSteeringWheelLabel {
    return Intl.message(
      'Electric Steering Wheel',
      name: 'electricSteeringWheelLabel',
      desc: '',
      args: [],
    );
  }

  /// `electric_steering_wheel`
  String get electricSteeringWheelId {
    return Intl.message(
      'electric_steering_wheel',
      name: 'electricSteeringWheelId',
      desc: '',
      args: [],
    );
  }

  /// `Keyless Entry`
  String get keylessLabel {
    return Intl.message(
      'Keyless Entry',
      name: 'keylessLabel',
      desc: '',
      args: [],
    );
  }

  /// `keyless`
  String get keylessId {
    return Intl.message('keyless', name: 'keylessId', desc: '', args: []);
  }

  /// `Push Start Button`
  String get startLabel {
    return Intl.message(
      'Push Start Button',
      name: 'startLabel',
      desc: '',
      args: [],
    );
  }

  /// `start`
  String get startId {
    return Intl.message('start', name: 'startId', desc: '', args: []);
  }

  /// `Remote Engine Start`
  String get remoteEngineStartLabel {
    return Intl.message(
      'Remote Engine Start',
      name: 'remoteEngineStartLabel',
      desc: '',
      args: [],
    );
  }

  /// `remote_engine_start`
  String get remoteEngineStartId {
    return Intl.message(
      'remote_engine_start',
      name: 'remoteEngineStartId',
      desc: '',
      args: [],
    );
  }

  /// `Smart Key`
  String get smartRemoteLabel {
    return Intl.message(
      'Smart Key',
      name: 'smartRemoteLabel',
      desc: '',
      args: [],
    );
  }

  /// `smart_key`
  String get smartRemoteId {
    return Intl.message('smart_key', name: 'smartRemoteId', desc: '', args: []);
  }

  /// `Remote Key`
  String get remoteLabel {
    return Intl.message('Remote Key', name: 'remoteLabel', desc: '', args: []);
  }

  /// `remote`
  String get remoteId {
    return Intl.message('remote', name: 'remoteId', desc: '', args: []);
  }

  /// `Head-Up Display`
  String get hudLabel {
    return Intl.message(
      'Head-Up Display',
      name: 'hudLabel',
      desc: '',
      args: [],
    );
  }

  /// `hud`
  String get hudId {
    return Intl.message('hud', name: 'hudId', desc: '', args: []);
  }

  /// `Dash Cam`
  String get dashCamLabel {
    return Intl.message('Dash Cam', name: 'dashCamLabel', desc: '', args: []);
  }

  /// `dash_cam`
  String get dashCamId {
    return Intl.message('dash_cam', name: 'dashCamId', desc: '', args: []);
  }

  /// `Air Suspension`
  String get airSuspensionLabel {
    return Intl.message(
      'Air Suspension',
      name: 'airSuspensionLabel',
      desc: '',
      args: [],
    );
  }

  /// `air_suspension`
  String get airSuspensionId {
    return Intl.message(
      'air_suspension',
      name: 'airSuspensionId',
      desc: '',
      args: [],
    );
  }

  /// `Brake Assist`
  String get brakeAssistLabel {
    return Intl.message(
      'Brake Assist',
      name: 'brakeAssistLabel',
      desc: '',
      args: [],
    );
  }

  /// `brake_assist`
  String get brakeAssistId {
    return Intl.message(
      'brake_assist',
      name: 'brakeAssistId',
      desc: '',
      args: [],
    );
  }

  /// `Window Switch`
  String get windowSwitchLabel {
    return Intl.message(
      'Window Switch',
      name: 'windowSwitchLabel',
      desc: '',
      args: [],
    );
  }

  /// `window_switch`
  String get windowSwitchId {
    return Intl.message(
      'window_switch',
      name: 'windowSwitchId',
      desc: '',
      args: [],
    );
  }

  /// `Central Lock`
  String get lockLabel {
    return Intl.message('Central Lock', name: 'lockLabel', desc: '', args: []);
  }

  /// `lock`
  String get lockId {
    return Intl.message('lock', name: 'lockId', desc: '', args: []);
  }

  /// `Premium Wheels`
  String get premiumWheelsLabel {
    return Intl.message(
      'Premium Wheels',
      name: 'premiumWheelsLabel',
      desc: '',
      args: [],
    );
  }

  /// `premium_wheels`
  String get premiumWheelsId {
    return Intl.message(
      'premium_wheels',
      name: 'premiumWheelsId',
      desc: '',
      args: [],
    );
  }

  /// `Spoiler`
  String get spoilerLabel {
    return Intl.message('Spoiler', name: 'spoilerLabel', desc: '', args: []);
  }

  /// `spoiler`
  String get spoilerId {
    return Intl.message('spoiler', name: 'spoilerId', desc: '', args: []);
  }

  /// `Vision & Cameras`
  String get visionAndCamerasLabel {
    return Intl.message(
      'Vision & Cameras',
      name: 'visionAndCamerasLabel',
      desc: '',
      args: [],
    );
  }

  /// `vision_and_cameras`
  String get visionAndCamerasId {
    return Intl.message(
      'vision_and_cameras',
      name: 'visionAndCamerasId',
      desc: '',
      args: [],
    );
  }

  /// `Lighting & Visibility`
  String get lightingAndVisibilityLabel {
    return Intl.message(
      'Lighting & Visibility',
      name: 'lightingAndVisibilityLabel',
      desc: '',
      args: [],
    );
  }

  /// `lighting_and_visibility`
  String get lightingAndVisibilityId {
    return Intl.message(
      'lighting_and_visibility',
      name: 'lightingAndVisibilityId',
      desc: '',
      args: [],
    );
  }

  /// `Matrix LED Headlights`
  String get matrixLedHeadlightsLabel {
    return Intl.message(
      'Matrix LED Headlights',
      name: 'matrixLedHeadlightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `matrix_led_headlights`
  String get matrixLedHeadlightsId {
    return Intl.message(
      'matrix_led_headlights',
      name: 'matrixLedHeadlightsId',
      desc: '',
      args: [],
    );
  }

  /// `Auto Headlights`
  String get autoHeadlightsLabel {
    return Intl.message(
      'Auto Headlights',
      name: 'autoHeadlightsLabel',
      desc: '',
      args: [],
    );
  }

  /// `auto_headlights`
  String get autoHeadlightsId {
    return Intl.message(
      'auto_headlights',
      name: 'autoHeadlightsId',
      desc: '',
      args: [],
    );
  }

  /// `Auto High Beam`
  String get autoHighBeamLabel {
    return Intl.message(
      'Auto High Beam',
      name: 'autoHighBeamLabel',
      desc: '',
      args: [],
    );
  }

  /// `auto_high_beam`
  String get autoHighBeamId {
    return Intl.message(
      'auto_high_beam',
      name: 'autoHighBeamId',
      desc: '',
      args: [],
    );
  }

  /// `Auto Rain Wipers`
  String get rainSensorWipersLabel {
    return Intl.message(
      'Auto Rain Wipers',
      name: 'rainSensorWipersLabel',
      desc: '',
      args: [],
    );
  }

  /// `auto_rain_wipers`
  String get rainSensorWipersId {
    return Intl.message(
      'auto_rain_wipers',
      name: 'rainSensorWipersId',
      desc: '',
      args: [],
    );
  }

  /// `Technology & Infotainment`
  String get technologyAndInfotainmentLabel {
    return Intl.message(
      'Technology & Infotainment',
      name: 'technologyAndInfotainmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `technology_and_infotainment`
  String get technologyAndInfotainmentId {
    return Intl.message(
      'technology_and_infotainment',
      name: 'technologyAndInfotainmentId',
      desc: '',
      args: [],
    );
  }

  /// `Wireless Charging`
  String get wirelessChargingLabel {
    return Intl.message(
      'Wireless Charging',
      name: 'wirelessChargingLabel',
      desc: '',
      args: [],
    );
  }

  /// `wireless_charging`
  String get wirelessChargingId {
    return Intl.message(
      'wireless_charging',
      name: 'wirelessChargingId',
      desc: '',
      args: [],
    );
  }

  /// `Exterior & Convenience`
  String get exteriorAndConvenienceLabel {
    return Intl.message(
      'Exterior & Convenience',
      name: 'exteriorAndConvenienceLabel',
      desc: '',
      args: [],
    );
  }

  /// `exterior_and_convenience`
  String get exteriorAndConvenienceId {
    return Intl.message(
      'exterior_and_convenience',
      name: 'exteriorAndConvenienceId',
      desc: '',
      args: [],
    );
  }

  /// `Electric Tail Gate`
  String get powerTailGateLabel {
    return Intl.message(
      'Electric Tail Gate',
      name: 'powerTailGateLabel',
      desc: '',
      args: [],
    );
  }

  /// `electric_tail_gate`
  String get powerTailGateId {
    return Intl.message(
      'electric_tail_gate',
      name: 'powerTailGateId',
      desc: '',
      args: [],
    );
  }

  /// `Child Lock`
  String get childLockLabel {
    return Intl.message(
      'Child Lock',
      name: 'childLockLabel',
      desc: '',
      args: [],
    );
  }

  /// `child_lock`
  String get childLockId {
    return Intl.message('child_lock', name: 'childLockId', desc: '', args: []);
  }

  /// `Comfort Windows`
  String get comfortWindowsLabel {
    return Intl.message(
      'Comfort Windows',
      name: 'comfortWindowsLabel',
      desc: '',
      args: [],
    );
  }

  /// `comfort_windows`
  String get comfortWindowsId {
    return Intl.message(
      'comfort_windows',
      name: 'comfortWindowsId',
      desc: '',
      args: [],
    );
  }

  /// `Select Air Conditioning Type`
  String get selectAircon {
    return Intl.message(
      'Select Air Conditioning Type',
      name: 'selectAircon',
      desc: '',
      args: [],
    );
  }

  /// `Air Conditioning (Optional)`
  String get acTypeLabel {
    return Intl.message(
      'Air Conditioning (Optional)',
      name: 'acTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Air Conditioning`
  String get detailsAcTypeLabel {
    return Intl.message(
      'Air Conditioning',
      name: 'detailsAcTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Manual Air Conditioning`
  String get manualAcLabel {
    return Intl.message(
      'Manual Air Conditioning',
      name: 'manualAcLabel',
      desc: '',
      args: [],
    );
  }

  /// `Automatic Air Conditioning`
  String get automaticAcLabel {
    return Intl.message(
      'Automatic Air Conditioning',
      name: 'automaticAcLabel',
      desc: '',
      args: [],
    );
  }

  /// `Automatic 2 Zones Air Conditioning`
  String get automatic2ZonesAcLabel {
    return Intl.message(
      'Automatic 2 Zones Air Conditioning',
      name: 'automatic2ZonesAcLabel',
      desc: '',
      args: [],
    );
  }

  /// `Automatic 3 Zones Air Conditioning`
  String get automatic3ZonesAcLabel {
    return Intl.message(
      'Automatic 3 Zones Air Conditioning',
      name: 'automatic3ZonesAcLabel',
      desc: '',
      args: [],
    );
  }

  /// `Automatic 4 Zones Air Conditioning`
  String get automatic4ZonesAcLabel {
    return Intl.message(
      'Automatic 4 Zones Air Conditioning',
      name: 'automatic4ZonesAcLabel',
      desc: '',
      args: [],
    );
  }

  /// `No Air Conditioning`
  String get noneAcLabel {
    return Intl.message(
      'No Air Conditioning',
      name: 'noneAcLabel',
      desc: '',
      args: [],
    );
  }

  /// `Select Interior`
  String get selectInteriorType {
    return Intl.message(
      'Select Interior',
      name: 'selectInteriorType',
      desc: '',
      args: [],
    );
  }

  /// `Select Interior (Optional)`
  String get interiorTypeLabel {
    return Intl.message(
      'Select Interior (Optional)',
      name: 'interiorTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Interior Type`
  String get detailsInteriorTypeLabel {
    return Intl.message(
      'Interior Type',
      name: 'detailsInteriorTypeLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cloth`
  String get clothSeats {
    return Intl.message('Cloth', name: 'clothSeats', desc: '', args: []);
  }

  /// `Full Leather`
  String get leatherSeats {
    return Intl.message(
      'Full Leather',
      name: 'leatherSeats',
      desc: '',
      args: [],
    );
  }

  /// `Part Leather`
  String get partLeatherSeats {
    return Intl.message(
      'Part Leather',
      name: 'partLeatherSeats',
      desc: '',
      args: [],
    );
  }

  /// `Velour`
  String get velourSeats {
    return Intl.message('Velour', name: 'velourSeats', desc: '', args: []);
  }

  /// `Alcantara Seats`
  String get alcantaraSeats {
    return Intl.message(
      'Alcantara Seats',
      name: 'alcantaraSeats',
      desc: '',
      args: [],
    );
  }

  /// `e.g.., 7 Seats`
  String get seatNumberHint {
    return Intl.message(
      'e.g.., 7 Seats',
      name: 'seatNumberHint',
      desc: '',
      args: [],
    );
  }

  /// `Number of Seats (Optional)`
  String get seatNumberLabel {
    return Intl.message(
      'Number of Seats (Optional)',
      name: 'seatNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Number of Seats`
  String get detailsSeatNumberLabel {
    return Intl.message(
      'Number of Seats',
      name: 'detailsSeatNumberLabel',
      desc: '',
      args: [],
    );
  }

  /// `Seats`
  String get seats {
    return Intl.message('Seats', name: 'seats', desc: '', args: []);
  }

  /// `Payment Options`
  String get paymentOptionsLabel {
    return Intl.message(
      'Payment Options',
      name: 'paymentOptionsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Payment Option`
  String get paymentOptionLabel {
    return Intl.message(
      'Payment Option',
      name: 'paymentOptionLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cash`
  String get cashLabel {
    return Intl.message('Cash', name: 'cashLabel', desc: '', args: []);
  }

  /// `Installment`
  String get installmentLabel {
    return Intl.message(
      'Installment',
      name: 'installmentLabel',
      desc: '',
      args: [],
    );
  }

  /// `Cash or Installments`
  String get cashOrInstallmentsLabel {
    return Intl.message(
      'Cash or Installments',
      name: 'cashOrInstallmentsLabel',
      desc: '',
      args: [],
    );
  }

  /// `Exchange`
  String get exchangeLabel {
    return Intl.message('Exchange', name: 'exchangeLabel', desc: '', args: []);
  }

  /// `Select Payment Option`
  String get nonePaymentLabel {
    return Intl.message(
      'Select Payment Option',
      name: 'nonePaymentLabel',
      desc: '',
      args: [],
    );
  }

  /// `WhatsApp Message ?`
  String get whatsappMessageLabel {
    return Intl.message(
      'WhatsApp Message ?',
      name: 'whatsappMessageLabel',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your email address.`
  String get emptyEmailError {
    return Intl.message(
      'Please enter your email address.',
      name: 'emptyEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get validEmailError {
    return Intl.message(
      'Please enter a valid email address',
      name: 'validEmailError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your phone number.`
  String get emptyPhoneError {
    return Intl.message(
      'Please enter your phone number.',
      name: 'emptyPhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid phone number.`
  String get validPhoneError {
    return Intl.message(
      'Please enter a valid phone number.',
      name: 'validPhoneError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter OTP.`
  String get emptyOtpError {
    return Intl.message(
      'Please enter OTP.',
      name: 'emptyOtpError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid OTP.`
  String get validOtpError {
    return Intl.message(
      'Please enter a valid OTP.',
      name: 'validOtpError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your password`
  String get emptyPasswordError {
    return Intl.message(
      'Please enter your password',
      name: 'emptyPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `8+ chars: uppercase, lowercase, digit, symbol, no spaces`
  String get validPasswordError {
    return Intl.message(
      '8+ chars: uppercase, lowercase, digit, symbol, no spaces',
      name: 'validPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `At least 8 characters`
  String get passwordMinLengthError {
    return Intl.message(
      'At least 8 characters',
      name: 'passwordMinLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter year`
  String get emptyYearError {
    return Intl.message(
      'Please enter year',
      name: 'emptyYearError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid year`
  String get validYearError {
    return Intl.message(
      'Please enter a valid year',
      name: 'validYearError',
      desc: '',
      args: [],
    );
  }

  /// `Max year should be greater than or equal to min year`
  String get validYearMax {
    return Intl.message(
      'Max year should be greater than or equal to min year',
      name: 'validYearMax',
      desc: '',
      args: [],
    );
  }

  /// `Min year should be less than or equal to max year`
  String get validYearMin {
    return Intl.message(
      'Min year should be less than or equal to max year',
      name: 'validYearMin',
      desc: '',
      args: [],
    );
  }

  /// `Please select a car`
  String get carRequiredError {
    return Intl.message(
      'Please select a car',
      name: 'carRequiredError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter model`
  String get emptyModelError {
    return Intl.message(
      'Please enter model',
      name: 'emptyModelError',
      desc: '',
      args: [],
    );
  }

  /// `Please select body type`
  String get emptyBodyTypeError {
    return Intl.message(
      'Please select body type',
      name: 'emptyBodyTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Please select fuel type`
  String get emptyFuelTypeError {
    return Intl.message(
      'Please select fuel type',
      name: 'emptyFuelTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Please select gearbox type`
  String get emptyGearboxTypeError {
    return Intl.message(
      'Please select gearbox type',
      name: 'emptyGearboxTypeError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter km`
  String get emptyKmError {
    return Intl.message(
      'Please enter km',
      name: 'emptyKmError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid Km value`
  String get validKmError {
    return Intl.message(
      'Please enter a valid Km value',
      name: 'validKmError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid engine capacity`
  String get validEngineCapacityError {
    return Intl.message(
      'Please enter a valid engine capacity',
      name: 'validEngineCapacityError',
      desc: '',
      args: [],
    );
  }

  /// `Please select paint color`
  String get emptyPaintColorError {
    return Intl.message(
      'Please select paint color',
      name: 'emptyPaintColorError',
      desc: '',
      args: [],
    );
  }

  /// `Please select paint condition`
  String get emptyPaintConditionError {
    return Intl.message(
      'Please select paint condition',
      name: 'emptyPaintConditionError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter location`
  String get emptyLocationError {
    return Intl.message(
      'Please enter location',
      name: 'emptyLocationError',
      desc: '',
      args: [],
    );
  }

  /// `Please select engine`
  String get emptyEngineCapacityError {
    return Intl.message(
      'Please select engine',
      name: 'emptyEngineCapacityError',
      desc: '',
      args: [],
    );
  }

  /// `Please select engine cylinder number`
  String get emptyEngineCylinderError {
    return Intl.message(
      'Please select engine cylinder number',
      name: 'emptyEngineCylinderError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter price`
  String get emptyPriceError {
    return Intl.message(
      'Please enter price',
      name: 'emptyPriceError',
      desc: '',
      args: [],
    );
  }

  /// `Price must be greater than 0`
  String get priceZeroError {
    return Intl.message(
      'Price must be greater than 0',
      name: 'priceZeroError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid price`
  String get validPriceError {
    return Intl.message(
      'Please enter a valid price',
      name: 'validPriceError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter description`
  String get emptyDescriptionError {
    return Intl.message(
      'Please enter description',
      name: 'emptyDescriptionError',
      desc: '',
      args: [],
    );
  }

  /// `Description must be at least 20 characters`
  String get descriptionMinLengthError {
    return Intl.message(
      'Description must be at least 20 characters',
      name: 'descriptionMinLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your name`
  String get emptyNameError {
    return Intl.message(
      'Please enter your name',
      name: 'emptyNameError',
      desc: '',
      args: [],
    );
  }

  /// `Name must be at least 5 characters`
  String get nameMinLengthError {
    return Intl.message(
      'Name must be at least 5 characters',
      name: 'nameMinLengthError',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm your password`
  String get emptyConfirmPasswordError {
    return Intl.message(
      'Please confirm your password',
      name: 'emptyConfirmPasswordError',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsMismatchError {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsMismatchError',
      desc: '',
      args: [],
    );
  }

  /// `Seat number must be at least 2`
  String get seatNumberMinError {
    return Intl.message(
      'Seat number must be at least 2',
      name: 'seatNumberMinError',
      desc: '',
      args: [],
    );
  }

  /// `Seat number must be at most 7`
  String get seatNumberMaxError {
    return Intl.message(
      'Seat number must be at most 7',
      name: 'seatNumberMaxError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid horsepower value.`
  String get validHpError {
    return Intl.message(
      'Please enter a valid horsepower value.',
      name: 'validHpError',
      desc: '',
      args: [],
    );
  }

  /// `Horsepower must be greater than 0`
  String get hpMustBeGreaterThanZeroError {
    return Intl.message(
      'Horsepower must be greater than 0',
      name: 'hpMustBeGreaterThanZeroError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a realistic horsepower value.`
  String get hpRealisticError {
    return Intl.message(
      'Please enter a realistic horsepower value.',
      name: 'hpRealisticError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a realistic fuel consumption value.`
  String get fuelConsumptionRealisticError {
    return Intl.message(
      'Please enter a realistic fuel consumption value.',
      name: 'fuelConsumptionRealisticError',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid fuel consumption value.`
  String get validFuelConsumptionError {
    return Intl.message(
      'Please enter a valid fuel consumption value.',
      name: 'validFuelConsumptionError',
      desc: '',
      args: [],
    );
  }

  /// `Fuel consumption must be greater than 0.`
  String get zeroFuelConsumptionError {
    return Intl.message(
      'Fuel consumption must be greater than 0.',
      name: 'zeroFuelConsumptionError',
      desc: '',
      args: [],
    );
  }

  /// `Please select payment options`
  String get paymentOptionsError {
    return Intl.message(
      'Please select payment options',
      name: 'paymentOptionsError',
      desc: '',
      args: [],
    );
  }

  /// `Please select whatsapp message ?`
  String get whatsappMessageError {
    return Intl.message(
      'Please select whatsapp message ?',
      name: 'whatsappMessageError',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get en {
    return Intl.message('English', name: 'en', desc: '', args: []);
  }

  /// `الْعَرَبِيَّة`
  String get ar {
    return Intl.message('الْعَرَبِيَّة', name: 'ar', desc: '', args: []);
  }

  /// `No internet connection. Please check your network and try again.`
  String get noInternet {
    return Intl.message(
      'No internet connection. Please check your network and try again.',
      name: 'noInternet',
      desc: '',
      args: [],
    );
  }

  /// `Internet connection error. Please check your network and try again.`
  String get internetError {
    return Intl.message(
      'Internet connection error. Please check your network and try again.',
      name: 'internetError',
      desc: '',
      args: [],
    );
  }

  /// `The request timed out. Please try again later.`
  String get timeout {
    return Intl.message(
      'The request timed out. Please try again later.',
      name: 'timeout',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled.`
  String get cancelled {
    return Intl.message(
      'The operation was cancelled.',
      name: 'cancelled',
      desc: '',
      args: [],
    );
  }

  /// `Bad request. Please check and try again.`
  String get badRequest {
    return Intl.message(
      'Bad request. Please check and try again.',
      name: 'badRequest',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized to perform this action. Please sign in.`
  String get unauthorized {
    return Intl.message(
      'You are not authorized to perform this action. Please sign in.',
      name: 'unauthorized',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to perform this action.`
  String get forbidden {
    return Intl.message(
      'You do not have permission to perform this action.',
      name: 'forbidden',
      desc: '',
      args: [],
    );
  }

  /// `Requested resource was not found.`
  String get notFound {
    return Intl.message(
      'Requested resource was not found.',
      name: 'notFound',
      desc: '',
      args: [],
    );
  }

  /// `Service is unavailable. Please try again later.`
  String get serviceUnavailable {
    return Intl.message(
      'Service is unavailable. Please try again later.',
      name: 'serviceUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `The email address is not valid. Please check and try again.`
  String get invalidEmail {
    return Intl.message(
      'The email address is not valid. Please check and try again.',
      name: 'invalidEmail',
      desc: '',
      args: [],
    );
  }

  /// `This account has been disabled. Please contact support if you need help.`
  String get userDisabled {
    return Intl.message(
      'This account has been disabled. Please contact support if you need help.',
      name: 'userDisabled',
      desc: '',
      args: [],
    );
  }

  /// `No account found with this email. Please check the email or sign up.`
  String get userNotFound {
    return Intl.message(
      'No account found with this email. Please check the email or sign up.',
      name: 'userNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Incorrect password. Please try again.`
  String get wrongPassword {
    return Intl.message(
      'Incorrect password. Please try again.',
      name: 'wrongPassword',
      desc: '',
      args: [],
    );
  }

  /// `This email is already registered. Try signing in or use a different email.`
  String get emailAlreadyInUse {
    return Intl.message(
      'This email is already registered. Try signing in or use a different email.',
      name: 'emailAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `This sign-in method is not enabled. Please contact support.`
  String get operationNotAllowed {
    return Intl.message(
      'This sign-in method is not enabled. Please contact support.',
      name: 'operationNotAllowed',
      desc: '',
      args: [],
    );
  }

  /// `The password is too weak. Use at least 6 characters.`
  String get weakPassword {
    return Intl.message(
      'The password is too weak. Use at least 6 characters.',
      name: 'weakPassword',
      desc: '',
      args: [],
    );
  }

  /// `Too many attempts. Please wait a moment and try again.`
  String get tooManyRequests {
    return Intl.message(
      'Too many attempts. Please wait a moment and try again.',
      name: 'tooManyRequests',
      desc: '',
      args: [],
    );
  }

  /// `Network error. Check your internet connection and try again.`
  String get networkRequestFailed {
    return Intl.message(
      'Network error. Check your internet connection and try again.',
      name: 'networkRequestFailed',
      desc: '',
      args: [],
    );
  }

  /// `Invalid authentication credentials. Please try again.`
  String get invalidCredential {
    return Intl.message(
      'Invalid authentication credentials. Please try again.',
      name: 'invalidCredential',
      desc: '',
      args: [],
    );
  }

  /// `This account is already linked with a different credential.`
  String get credentialAlreadyInUse {
    return Intl.message(
      'This account is already linked with a different credential.',
      name: 'credentialAlreadyInUse',
      desc: '',
      args: [],
    );
  }

  /// `An account with this email exists using a different sign-in method. Try signing in with that provider.`
  String get accountExistsWithDifferentCredential {
    return Intl.message(
      'An account with this email exists using a different sign-in method. Try signing in with that provider.',
      name: 'accountExistsWithDifferentCredential',
      desc: '',
      args: [],
    );
  }

  /// `This provider is already linked to the current user.`
  String get providerAlreadyLinked {
    return Intl.message(
      'This provider is already linked to the current user.',
      name: 'providerAlreadyLinked',
      desc: '',
      args: [],
    );
  }

  /// `The requested sign-in provider is not available.`
  String get noSuchProvider {
    return Intl.message(
      'The requested sign-in provider is not available.',
      name: 'noSuchProvider',
      desc: '',
      args: [],
    );
  }

  /// `The verification code is invalid. Please check and try again.`
  String get invalidVerificationCode {
    return Intl.message(
      'The verification code is invalid. Please check and try again.',
      name: 'invalidVerificationCode',
      desc: '',
      args: [],
    );
  }

  /// `Invalid verification session. Please retry the verification process.`
  String get invalidVerificationId {
    return Intl.message(
      'Invalid verification session. Please retry the verification process.',
      name: 'invalidVerificationId',
      desc: '',
      args: [],
    );
  }

  /// `This link or code has expired. Request a new one and try again.`
  String get expiredActionCode {
    return Intl.message(
      'This link or code has expired. Request a new one and try again.',
      name: 'expiredActionCode',
      desc: '',
      args: [],
    );
  }

  /// `The action code is invalid. Please request a fresh link and try again.`
  String get invalidActionCode {
    return Intl.message(
      'The action code is invalid. Please request a fresh link and try again.',
      name: 'invalidActionCode',
      desc: '',
      args: [],
    );
  }

  /// `This action requires recent authentication. Please sign in again and retry.`
  String get requiresRecentLogin {
    return Intl.message(
      'This action requires recent authentication. Please sign in again and retry.',
      name: 'requiresRecentLogin',
      desc: '',
      args: [],
    );
  }

  /// `Authentication token is invalid. Please sign in again.`
  String get invalidUserToken {
    return Intl.message(
      'Authentication token is invalid. Please sign in again.',
      name: 'invalidUserToken',
      desc: '',
      args: [],
    );
  }

  /// `Your session expired. Please sign in again.`
  String get userTokenExpired {
    return Intl.message(
      'Your session expired. Please sign in again.',
      name: 'userTokenExpired',
      desc: '',
      args: [],
    );
  }

  /// `Session expired. Please sign in again.`
  String get sessionCookieExpired {
    return Intl.message(
      'Session expired. Please sign in again.',
      name: 'sessionCookieExpired',
      desc: '',
      args: [],
    );
  }

  /// `Session is invalid. Please sign in again.`
  String get invalidSessionCookie {
    return Intl.message(
      'Session is invalid. Please sign in again.',
      name: 'invalidSessionCookie',
      desc: '',
      args: [],
    );
  }

  /// `Request quota exceeded. Please try again later.`
  String get quotaExceeded {
    return Intl.message(
      'Request quota exceeded. Please try again later.',
      name: 'quotaExceeded',
      desc: '',
      args: [],
    );
  }

  /// `This app is not authorized to perform this operation.`
  String get appNotAuthorized {
    return Intl.message(
      'This app is not authorized to perform this operation.',
      name: 'appNotAuthorized',
      desc: '',
      args: [],
    );
  }

  /// `This app no longer exists. Please contact support.`
  String get appDeleted {
    return Intl.message(
      'This app no longer exists. Please contact support.',
      name: 'appDeleted',
      desc: '',
      args: [],
    );
  }

  /// `Internal error occurred. Please try again later.`
  String get internalError {
    return Intl.message(
      'Internal error occurred. Please try again later.',
      name: 'internalError',
      desc: '',
      args: [],
    );
  }

  /// `This operation is restricted. Contact support for help.`
  String get adminRestrictedOperation {
    return Intl.message(
      'This operation is restricted. Contact support for help.',
      name: 'adminRestrictedOperation',
      desc: '',
      args: [],
    );
  }

  /// `The provided credentials do not match the current user.`
  String get userMismatch {
    return Intl.message(
      'The provided credentials do not match the current user.',
      name: 'userMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Custom authentication token is invalid. Please try again.`
  String get invalidCustomToken {
    return Intl.message(
      'Custom authentication token is invalid. Please try again.',
      name: 'invalidCustomToken',
      desc: '',
      args: [],
    );
  }

  /// `Custom token does not correspond to the correct account.`
  String get customTokenMismatch {
    return Intl.message(
      'Custom token does not correspond to the correct account.',
      name: 'customTokenMismatch',
      desc: '',
      args: [],
    );
  }

  /// `Required Android package name is missing in the configuration.`
  String get missingAndroidPackageName {
    return Intl.message(
      'Required Android package name is missing in the configuration.',
      name: 'missingAndroidPackageName',
      desc: '',
      args: [],
    );
  }

  /// `Missing redirect URL. Please contact support or try again.`
  String get missingContinueUri {
    return Intl.message(
      'Missing redirect URL. Please contact support or try again.',
      name: 'missingContinueUri',
      desc: '',
      args: [],
    );
  }

  /// `Required iOS bundle id is missing in the configuration.`
  String get missingIosBundleId {
    return Intl.message(
      'Required iOS bundle id is missing in the configuration.',
      name: 'missingIosBundleId',
      desc: '',
      args: [],
    );
  }

  /// `Redirect URL is not authorized. Check your configuration.`
  String get unauthorizedContinueUri {
    return Intl.message(
      'Redirect URL is not authorized. Check your configuration.',
      name: 'unauthorizedContinueUri',
      desc: '',
      args: [],
    );
  }

  /// `Authentication domain is not configured properly.`
  String get authDomainConfigRequired {
    return Intl.message(
      'Authentication domain is not configured properly.',
      name: 'authDomainConfigRequired',
      desc: '',
      args: [],
    );
  }

  /// `The popup was closed before completing sign in.`
  String get popupClosedByUser {
    return Intl.message(
      'The popup was closed before completing sign in.',
      name: 'popupClosedByUser',
      desc: '',
      args: [],
    );
  }

  /// `The popup request was cancelled. Please try again.`
  String get cancelledPopupRequest {
    return Intl.message(
      'The popup request was cancelled. Please try again.',
      name: 'cancelledPopupRequest',
      desc: '',
      args: [],
    );
  }

  /// `The redirect sign-in was cancelled. Please try again.`
  String get redirectCancelledByUser {
    return Intl.message(
      'The redirect sign-in was cancelled. Please try again.',
      name: 'redirectCancelledByUser',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email or password. Please check your credentials and try again.`
  String get invalidLoginCredentials {
    return Intl.message(
      'Invalid email or password. Please check your credentials and try again.',
      name: 'invalidLoginCredentials',
      desc: '',
      args: [],
    );
  }

  /// `Server error occurred. Please try again later.`
  String get unknown {
    return Intl.message(
      'Server error occurred. Please try again later.',
      name: 'unknown',
      desc: '',
      args: [],
    );
  }

  /// `Session expired. Please sign in again.`
  String get sessionExpired {
    return Intl.message(
      'Session expired. Please sign in again.',
      name: 'sessionExpired',
      desc: '',
      args: [],
    );
  }

  /// `Missing verification session. Please retry the verification process.`
  String get missingVerificationId {
    return Intl.message(
      'Missing verification session. Please retry the verification process.',
      name: 'missingVerificationId',
      desc: '',
      args: [],
    );
  }

  /// `Web authentication context is already presented. Please try again.`
  String get webContextAlreadyPresented {
    return Intl.message(
      'Web authentication context is already presented. Please try again.',
      name: 'webContextAlreadyPresented',
      desc: '',
      args: [],
    );
  }

  /// `The operation was cancelled before it completed.`
  String get firebaseCancel {
    return Intl.message(
      'The operation was cancelled before it completed.',
      name: 'firebaseCancel',
      desc: '',
      args: [],
    );
  }

  /// `Invalid data was sent. Please check your input and try again.`
  String get firebaseInvalidArgument {
    return Intl.message(
      'Invalid data was sent. Please check your input and try again.',
      name: 'firebaseInvalidArgument',
      desc: '',
      args: [],
    );
  }

  /// `The request took too long and timed out. Please try again.`
  String get firebaseDeadlineExceeded {
    return Intl.message(
      'The request took too long and timed out. Please try again.',
      name: 'firebaseDeadlineExceeded',
      desc: '',
      args: [],
    );
  }

  /// `The requested document was not found.`
  String get firebaseNotFound {
    return Intl.message(
      'The requested document was not found.',
      name: 'firebaseNotFound',
      desc: '',
      args: [],
    );
  }

  /// `The item already exists.`
  String get firebaseAlreadyExists {
    return Intl.message(
      'The item already exists.',
      name: 'firebaseAlreadyExists',
      desc: '',
      args: [],
    );
  }

  /// `You do not have permission to perform this action.`
  String get firebasePermissionDenied {
    return Intl.message(
      'You do not have permission to perform this action.',
      name: 'firebasePermissionDenied',
      desc: '',
      args: [],
    );
  }

  /// `Resource limit reached. Please try again later.`
  String get firebaseResourceExhausted {
    return Intl.message(
      'Resource limit reached. Please try again later.',
      name: 'firebaseResourceExhausted',
      desc: '',
      args: [],
    );
  }

  /// `Operation cannot be executed in the current state.`
  String get firebaseFailedPrecondition {
    return Intl.message(
      'Operation cannot be executed in the current state.',
      name: 'firebaseFailedPrecondition',
      desc: '',
      args: [],
    );
  }

  /// `Operation was aborted due to a conflict. Please retry.`
  String get firebaseAborted {
    return Intl.message(
      'Operation was aborted due to a conflict. Please retry.',
      name: 'firebaseAborted',
      desc: '',
      args: [],
    );
  }

  /// `Value is out of allowed range.`
  String get firebaseOutOfRange {
    return Intl.message(
      'Value is out of allowed range.',
      name: 'firebaseOutOfRange',
      desc: '',
      args: [],
    );
  }

  /// `This operation is not supported.`
  String get firebaseUnimplemented {
    return Intl.message(
      'This operation is not supported.',
      name: 'firebaseUnimplemented',
      desc: '',
      args: [],
    );
  }

  /// `Internal server error occurred. Please try again later.`
  String get firebaseInternal {
    return Intl.message(
      'Internal server error occurred. Please try again later.',
      name: 'firebaseInternal',
      desc: '',
      args: [],
    );
  }

  /// `Service is currently unavailable. Please try again soon.`
  String get firebaseUnavailable {
    return Intl.message(
      'Service is currently unavailable. Please try again soon.',
      name: 'firebaseUnavailable',
      desc: '',
      args: [],
    );
  }

  /// `Unexpected data loss occurred. Please contact support.`
  String get firebaseDataLoss {
    return Intl.message(
      'Unexpected data loss occurred. Please contact support.',
      name: 'firebaseDataLoss',
      desc: '',
      args: [],
    );
  }

  /// `You need to sign in again to continue.`
  String get firebaseUnauthenticated {
    return Intl.message(
      'You need to sign in again to continue.',
      name: 'firebaseUnauthenticated',
      desc: '',
      args: [],
    );
  }

  /// `The requested file was not found in storage.`
  String get firebaseObjectNotFound {
    return Intl.message(
      'The requested file was not found in storage.',
      name: 'firebaseObjectNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Storage bucket was not found. Please check your configuration.`
  String get firebaseBucketNotFound {
    return Intl.message(
      'Storage bucket was not found. Please check your configuration.',
      name: 'firebaseBucketNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Firebase project was not found. Please check your setup.`
  String get firebaseProjectNotFound {
    return Intl.message(
      'Firebase project was not found. Please check your setup.',
      name: 'firebaseProjectNotFound',
      desc: '',
      args: [],
    );
  }

  /// `Storage quota has been exceeded. Please try again later.`
  String get firebaseQuotaExceeded {
    return Intl.message(
      'Storage quota has been exceeded. Please try again later.',
      name: 'firebaseQuotaExceeded',
      desc: '',
      args: [],
    );
  }

  /// `You are not authorized to access this file.`
  String get firebaseUnauthorized {
    return Intl.message(
      'You are not authorized to access this file.',
      name: 'firebaseUnauthorized',
      desc: '',
      args: [],
    );
  }

  /// `Operation retried too many times. Please try again.`
  String get firebaseRetryLimitExceeded {
    return Intl.message(
      'Operation retried too many times. Please try again.',
      name: 'firebaseRetryLimitExceeded',
      desc: '',
      args: [],
    );
  }

  /// `File upload failed due to checksum mismatch. Try uploading again.`
  String get firebaseInvalidChecksum {
    return Intl.message(
      'File upload failed due to checksum mismatch. Try uploading again.',
      name: 'firebaseInvalidChecksum',
      desc: '',
      args: [],
    );
  }

  /// `The operation was canceled before completion.`
  String get firebaseCanceled {
    return Intl.message(
      'The operation was canceled before completion.',
      name: 'firebaseCanceled',
      desc: '',
      args: [],
    );
  }

  /// `Download size exceeds the allowed limit.`
  String get firebaseDownloadSizeExceeded {
    return Intl.message(
      'Download size exceeds the allowed limit.',
      name: 'firebaseDownloadSizeExceeded',
      desc: '',
      args: [],
    );
  }

  /// `An unexpected Firebase error occurred. Please try again later.`
  String get firebaseUnknown {
    return Intl.message(
      'An unexpected Firebase error occurred. Please try again later.',
      name: 'firebaseUnknown',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
