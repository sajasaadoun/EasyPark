import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/spiral_model.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream WaveData = SpiralModel().getUserDetails();
final WaveDataProviderRepositery = StateProvider<Stream>((ref) => WaveData);
//gets the data from the model

final WaveDataProvider = StreamProvider((
        //bagyb beh aldata,byt3amel my al-ui
        //ui byklem provider
        (ref) => ref.watch(WaveDataProviderRepositery))
    //listens to the data
    );

////get with a condition ////////////////
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