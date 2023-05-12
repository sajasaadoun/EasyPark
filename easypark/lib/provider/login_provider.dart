import 'package:flutter_riverpod/flutter_riverpod.dart';
// import '../model/user_model.dart';
import 'package:easypark/utils/user_preferences.dart';
// import '../../model/loginData.dart';
// import '../dataApp/user_data.dart';

//---------------------UserProvider------------------------//

//provider byklm almodel
Stream userData = UserData().getUserDetails();
final userDataProviderRepository = StateProvider<Stream>((ref) => userData);
//gets the data from the model

final userDataProvider = StreamProvider(
    //bagyb beh aldata,byt3amel my al-ui
    //ui byklem provider
    (ref) => ref.watch(userDataProviderRepository));
//listens to the data

Future userRole = UserData().getUserRole();
final userRoleProviderRepository = StateProvider<Future>((ref) => userRole);

final userRoleProvider = FutureProvider((ref) async {
  return ref.watch(userRoleProviderRepository);
});
