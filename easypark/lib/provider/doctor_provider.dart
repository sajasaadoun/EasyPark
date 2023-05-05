import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/doctorModel.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream doctorsData = DoctorModel().doctorsDetails();
final doctorsDataProviderRepository =
    StateProvider<Stream>((ref) => doctorsData);
//gets the data from the model

final doctorsDataProvider = StreamProvider((
        //bagyb beh aldata,byt3amel my al-ui
        //ui byklem provider
        (ref) => ref.watch(doctorsDataProviderRepository))
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
