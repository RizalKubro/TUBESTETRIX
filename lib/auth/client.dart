import 'package:appwrite/appwrite.dart';
import 'package:tetrix/auth/appwrite_contrait.dart';

Client client = Client()
    .setEndpoint(AppwriteConstants.endPoint)
    .setProject(AppwriteConstants.projectId)
    .setSelfSigned(
        status: true);

Account account = Account(client);



