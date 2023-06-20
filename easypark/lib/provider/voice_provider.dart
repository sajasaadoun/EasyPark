import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/spiral_model.dart';
import '../model/voice_model.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream VoiceData = VoiceModel().getUserDetails();
final VoiceDataProviderRepositery = StateProvider<Stream>((ref) => VoiceData);
//gets the data from the model

final VoiceDataProvider = StreamProvider((
        //bagyb beh aldata,byt3amel my al-ui
        //ui byklem provider
        (ref) => ref.watch(VoiceDataProviderRepositery))
    //listens to the data
    );
