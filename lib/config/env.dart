import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Env {
  static String get appwriteEndpoint =>
      dotenv.env['APPWRITE_ENDPOINT'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_ENDPOINT'] ??
      '';
  static String get appwriteProjectId =>
      dotenv.env['APPWRITE_PROJECT_ID'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_PROJECT_ID'] ??
      '';
  static String get appwriteDatabaseId =>
      dotenv.env['APPWRITE_DATABASE_ID'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_DATABASE_ID'] ??
      '';

  static String get outfitsCollection =>
      dotenv.env['APPWRITE_COLLECTION_OUTFITS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_OUTFITS'] ?? '';
  static String get usersCollection =>
      dotenv.env['APPWRITE_COLLECTION_USERS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_USERS'] ?? '';
  static String get plansCollection =>
      dotenv.env['PLANS_COLLECTION_ID'] ?? dotenv.env['APPWRITE_COLLECTION_PLANS'] ?? '';
  static String get savedBoardsCollection =>
      dotenv.env['APPWRITE_COLLECTION_SAVED_BOARDS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_SAVED_BOARDS'] ?? '';
  static String get skincareCollection =>
      dotenv.env['APPWRITE_COLLECTION_SKINCARE'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_SKINCARE'] ?? '';
  static String get workoutOutfitsCollection =>
      dotenv.env['APPWRITE_COLLECTION_WORKOUT_OUTFITS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_WORKOUT_OUTFITS'] ?? '';
  static String get billsCollection =>
      dotenv.env['APPWRITE_COLLECTION_BILLS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_BILLS'] ?? '';
  static String get couponsCollection =>
      dotenv.env['APPWRITE_COLLECTION_COUPONS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_COUPONS'] ?? '';
  static String get medsCollection =>
      dotenv.env['APPWRITE_COLLECTION_MEDS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_MEDS'] ?? '';
  static String get medLogsCollection =>
      dotenv.env['APPWRITE_COLLECTION_MED_LOGS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_MED_LOGS'] ?? '';
  static String get lifeGoalsCollection =>
      dotenv.env['APPWRITE_COLLECTION_LIFE_GOALS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_LIFE_GOALS'] ?? '';
  static String get backendApiUrl =>
    dotenv.env['BACKEND_API_URL'] ??
    dotenv.env['EXPO_PUBLIC_BACKEND_API_URL'] ??
    dotenv.env['BACKEND_URL'] ??
    '';
  static String get mealPlansCollection =>
      dotenv.env['APPWRITE_COLLECTION_MEAL_PLANS'] ??
      dotenv.env['EXPO_PUBLIC_APPWRITE_COLLECTION_MEAL_PLANS'] ?? '';

  static Map<String, String> get requiredConfig => {
    'EXPO_PUBLIC_APPWRITE_ENDPOINT': appwriteEndpoint,
    'EXPO_PUBLIC_APPWRITE_PROJECT_ID': appwriteProjectId,
    'EXPO_PUBLIC_APPWRITE_DATABASE_ID': appwriteDatabaseId,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_OUTFITS': outfitsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_USERS': usersCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_SAVED_BOARDS': savedBoardsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_SKINCARE': skincareCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_WORKOUT_OUTFITS': workoutOutfitsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_BILLS': billsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_COUPONS': couponsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_MEDS': medsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_MED_LOGS': medLogsCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_MEAL_PLANS': mealPlansCollection,
    'EXPO_PUBLIC_APPWRITE_COLLECTION_LIFE_GOALS': lifeGoalsCollection,
    'PLANS_COLLECTION_ID': plansCollection,
    'EXPO_PUBLIC_BACKEND_API_URL': backendApiUrl,
  };

  static List<String> get missingRequiredKeys => requiredConfig.entries
      .where((entry) => entry.value.trim().isEmpty)
      .map((entry) => entry.key)
      .toList(growable: false);

  static bool get isConfigured => missingRequiredKeys.isEmpty;

  static void debugPrintMissingConfig() {
    final missing = missingRequiredKeys;
    if (missing.isEmpty) return;
    debugPrint('AHVI config missing: ${missing.join(', ')}');
  }
}
