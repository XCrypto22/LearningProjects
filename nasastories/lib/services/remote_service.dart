import 'package:nasastories/models/image_data.dart';
import 'package:nasastories/models/mission_data.dart';
import 'package:nasastories/models/story_data.dart';
import 'package:http/http.dart' as http;

const String server = '10.0.2.2';
const int port = 5000;

class StoriesRemoteService {
  Future<List<Stories>?> getStories() async {
    var client = http.Client();

    var uri = Uri.parse('http://$server:$port/data');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return storiesFromJson(json);
    }
    return null;
  }
}

class GalleryRemoteService {
  Future<List<Gallery>?> getPhotos() async {
    var client = http.Client();

    var uri = Uri.parse('http://$server:$port/gallery');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return galleryFromJson(json);
    }
    return null;
  }
}

class MissionsRemoteService {
  Future<List<Missions>?> getMissions() async {
    var client = http.Client();

    var uri = Uri.parse('http://$server:$port/missions');

    var response = await client.get(uri);

    if (response.statusCode == 200) {
      var json = response.body;
      return missionsFromJson(json);
    }
    return null;
  }
}
