import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/patientInfoModel.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream patientInfoData = patientInfoModel().patientInfoDetails();
final patientInfoProviderRepository =
    StateProvider<Stream>((ref) => patientInfoData);
//gets the data from the model

final patientInfoProvider = StreamProvider((
        //bagyb beh aldata,byt3amel my al-ui
        //ui byklem provider
        (ref) => ref.watch(patientInfoProviderRepository))
    //listens to the data
    );

//////get with a condition ////////////////
// Stream getSpecificdoc = DoctorsModel().getSpecificDoctor();
// final SpecificdoctorProviderRepository =
//     StateProvider<Stream>((ref) => getSpecificdoc);
// //gets the data from the model

// final SpecificdoctorProvider = StreamProvider((
//         //bagyb beh aldata,byt3amel my al-ui
//         //ui byklem provider
//         (ref) => ref.watch(SpecificdoctorProviderRepository))
//     //listens to the data
//     );