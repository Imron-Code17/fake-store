import 'param.dart';

class UploadImageBody extends RequestBody {
  final String fileName;
  final String path;

  UploadImageBody(this.fileName, this.path);

  @override
  Map<String, dynamic> toJson() => {'fileName': fileName, 'file': path};
}

class UploadFileBody extends RequestBody {
  final String fileName;
  final String type;
  final String path;

  UploadFileBody(this.fileName, this.type, this.path);

  @override
  Map<String, dynamic> toJson() => {'fileName': fileName, 'file': path};
}
