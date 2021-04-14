import 'package:cloudinary_client/cloudinary_client.dart';
import 'package:cloudinary_client/models/CloudinaryResponse.dart';

import 'Util.dart';

class CloudinaryUpload {
  Future<String> uploadToCloudinary(String imagepath) async {
    String url;
    CloudinaryClient client = new CloudinaryClient(
        cloudinaryAPIKey, cloudinaryAPISecret, cloudinaryCloud);

    List<CloudinaryResponse> result = await client.uploadImages([imagepath]);
    for (var i = 0; i < result.length; i++) {
      url = result[i].url;
    }
    return url;
  }
}
