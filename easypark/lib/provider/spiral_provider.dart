import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/spiral_model.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream SpiralData = SpiralModel().getUserDetails();
final SpiralDataProviderRepositery = StateProvider<Stream>((ref) => SpiralData);
//gets the data from the model

final SpiralDataProvider = StreamProvider((
        //bagyb beh aldata,byt3amel my al-ui
        //ui byklem provider
        (ref) => ref.watch(SpiralDataProviderRepositery))
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