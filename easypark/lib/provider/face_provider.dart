import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/face_model.dart';
import '../model/spiral_model.dart';

//---------------------EventsProvider------------------------//

//provider byklm almodel
Stream FaceData = FaceModel().getUserDetails();
final FaceDataProviderRepositery = StateProvider<Stream>((ref) => FaceData);
//gets the data from the model

final FaceDataProvider = StreamProvider((
        //bagyb beh aldata,byt3amel my al-ui
        //ui byklem provider
        (ref) => ref.watch(FaceDataProviderRepositery))
    //listens to the data
    );
