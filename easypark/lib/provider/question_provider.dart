import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../model/qs_model.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream questionsData = QuesModel().questionDetails();
final questionsDataProviderRepository = StateProvider<Stream>((ref) => questionsData);
//gets the data from the model

final questionsDataProvider = StreamProvider((
        (ref) => ref.watch(questionsDataProviderRepository))
    //listens to the data
    );

//////get with a condition ////////////////
// Stream getSpecificdoc = questionsModel().getSpecificquestion();
// final SpecificquestionProviderRepository =
//     StateProvider<Stream>((ref) => getSpecificdoc);
// //gets the data from the model

// final SpecificquestionProvider = StreamProvider((
//         //bagyb beh aldata,byt3amel my al-ui
//         //ui byklem provider
//         (ref) => ref.watch(SpecificquestionProviderRepository))
//     //listens to the data
//     );