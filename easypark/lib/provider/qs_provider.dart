import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/doctorModel.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream questionData = quesModel().questionDetails();
final questionDataProviderRepository = StateProvider<Stream>((ref) => questionData);
//gets the data from the model

final questionDataProvider = StreamProvider((
        (ref) => ref.watch(questionDataProviderRepository))
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