import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:funkyfitness/features/auth/repository/user_data_service.dart';
import 'package:funkyfitness/features/auth/repository/user_model.dart';

final userProvider = FutureProvider<UserModel>((ref) async {
  final UserModel user = await ref.watch(userDataServiceProvider).fetchUserData();
  
  return user;
});