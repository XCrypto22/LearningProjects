import 'package:nasastories/models/image_data.dart';
import 'package:nasastories/models/mission_data.dart';
import 'package:nasastories/models/story_data.dart';
import 'package:http/http.dart' as http;

const String server = '10.0.2.2';
const int port = 5000;

class StoriesRemoteService {
  Future<List<Stories>?> getStories() async {
    try {
      var client = http.Client();

      var uri = Uri.parse('http://snrelton.pythonanywhere.com/data');

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return storiesFromJson(json);
      }
    } catch (e) {
      print("Connection Error - Couldn't fetch stories");
    }

    return null;
  }
}

class GalleryRemoteService {
  Future<List<Gallery>?> getPhotos() async {
    try {
      var client = http.Client();

      var uri = Uri.parse('http://snrelton.pythonanywhere.com/gallery');

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return galleryFromJson(json);
      }
    } catch (e) {
      print("Connection Error - Couldn't fetch photos");
    }

    return null;
  }
}

class MissionsRemoteService {
  Future<List<Missions>?> getMissions() async {
    try {
      var client = http.Client();

      var uri = Uri.parse('http://snrelton.pythonanywhere.com/missions');

      var response = await client.get(uri);

      if (response.statusCode == 200) {
        var json = response.body;
        return missionsFromJson(json);
      }
    } catch (e) {
      print("Connection Error - Couldn't fetch missions");
    }

    return null;
  }
}
