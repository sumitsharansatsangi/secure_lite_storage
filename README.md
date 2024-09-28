<img src="logo.jpeg" alt="Logo">


# Secure Lite Storage

`secure_lite_storage` is a Dart package designed for secure and efficient local storage using Protocol Buffers instead of JSON. Inspired by packages like `getx_storage`, `shared_preferences`, `hive`, `local_storage`, and `safe_local_storage`, this package offers enhanced performance and security.

## Features

- **Protocol Buffers**: Utilizes Protocol Buffers (protobuf) for data serialization, offering significant performance improvements over JSON.
- **Secure Storage**: Data is securely stored using `flutter_secure_storage` and encrypted with the `encrypt` library.
- **Comprehensive Data Support**: Supports all data types, including their list variants.
  - ##### What we mean
    - Supported data types are `int`, `double`, `bool`, `String`, `Uint8List`, `List<int>`, `List<double>`, `List<bool>`, `List<String>`, and `List<Uint8List>`.
    - `Uint8List` for bytes 
- **Efficient and Compact**: Protobuf is more efficient and compact compared to JSON, reducing latency and improving app performance.
- **Familiar Api**: Same API as of `SharedPreference`.
    - Won't miss `SharedPreference`. No headache, easy adaption.🚀 
- **Offered Choices**: Provides Three API's to cover all use cases
    - For Small Data or normal use cases
       - Synchronous API 
       ```dart
       final storage = SecureLiteStorage();
       ```
    - For Large Data 
       - Asynchronous API
       ```dart
       final storage = SecureLiteStorageAsync();
       ```
    - For Heavy Large Data
       - Isolate API
       ```dart
       final storage = SecureLiteStorageIsolate();
       ```
    Rest is same for all the APIs.   

## Benefits of Using Protocol Buffers Over JSON

- **Performance**: Protobuf is significantly faster than JSON for serialization and deserialization.
- **Compactness**: Protobuf messages are smaller in size, which reduces storage space and improves transmission speed.
- **Efficiency**: Protobuf is more efficient in terms of CPU and memory usage.
                    
## Advantages Over Shared Preferences

- **Data Integrity**: Protobuf ensures data integrity and consistency, which is crucial for complex data structures.
- **Security**: Data is encrypted and securely stored, unlike shared preferences which can be more vulnerable to security breaches.
- **Scalability**: Protobuf's efficient serialization makes it suitable for larger datasets and more complex data structures.

## Installation

Add `secure_lite_storage` to your `pubspec.yaml`:

```yaml
dependencies:
  secure_lite_storage: ^0.0.1
```
you can install packages from the command line:

with `Flutter`:

```bash
$  flutter pub get
```
with `Dart`:

```bash
$  dart pub get
```

## Initialization

with `Flutter`:

```dart
import 'package:secure_lite_storage/secure_lite_storage.dart';

// Example usage
void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    final storage = SecureLiteStorage();
    // final storage = SecureLiteStorageAsync(); //for Async API
    // final storage = SecureLiteStorageIsolate(); //for Isolate API
    await storage.init();
    runApp(MyApp(storage: storage));
}
```

with `dart`:

```dart
import 'package:secure_lite_storage/secure_lite_storage.dart';

// Example usage
void main() async {
  final storage = SecureLiteStorage();
  // final storage = SecureLiteStorageAsync(); //for Async API
  // final storage = SecureLiteStorageIsolate(); //for Isolate API
  await storage.init();
}
```

## Usage

- Store Data
```dart
  // Store data
   storage.set('message', 'Secure Lite Storage is the Best! 🎸🤘');
    storage.setString('username', 'john_doe');
    storage.setInt('age', 30);
    storage.setDouble('height', 5.9);
    storage.setBool('isAdmin', true);
    storage.setBytes(
        'profilePicture', File('assets/profile.jpeg').readAsBytesSync());
    storage.setStringList('tags', ['dart', 'flutter']);
    storage.setIntList('scores', [100, 95, 85]);
    storage.setDoubleList('strike_rate', [36.6, 37.0, 36.8]);
    storage.setBoolList('attendence', [true, false, true]);
    storage.setBytesList('files', [
      File('assets/file1.jpeg').readAsBytesSync(),
      File('assets/logo.jpeg').readAsBytesSync(),
      File('assets/file2.jpeg').readAsBytesSync()
    ]);
 
```
- Read Data
```dart
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Secure Lite Storage Example'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder(
            future: writeData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                final files = storage.getBytesList('files');
                return Column(
                  children: [
                    Image.memory(Uint8List.fromList(
                        storage.getBytes('profilePicture') ?? [])),
                    Text("Message: ${storage.get('message') ?? 'No data'}"),
                    Text(
                        "Username: ${storage.getString('username') ?? 'No Data'}"), // Output: john_doe
                    Text("Age: ${storage.getInt('age')}"), // Output: 30
                    Text(
                        "Height: ${storage.getDouble('height')}"), // Output: 5.9
                    Text(
                        "IsAdmin: ${storage.getBool('isAdmin')}"), // Output: true
                    Text(
                        "Tags: ${storage.getStringList('tags') ?? [].join(',')}"), // Output: [dart, flutter]
                    Text(
                        "Scores: ${storage.getIntList('scores') ?? [].join(',')}"), // Output: [100, 95, 85]
                    Text(
                        "Strike Rate: ${storage.getDoubleList('strike_rate')}"), // Output: [36.6, 37.0, 36.8]
                    Text(
                        "Attendence: ${storage.getBoolList('attendence')}"), // Output: [true, false, true]
                    if (files != null)
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (final file in files)
                            Image.memory(Uint8List.fromList(file)),
                        ],
                      ),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }

```

## Contributing

We welcome contributions from the community! If you have any ideas, suggestions, or bug reports, please open an issue or submit a pull request.

## Sponsor

If you find this package useful, please consider sponsoring its development to help us continue improving it. You will be mentioned below

[![Sponsor](https://img.shields.io/badge/Sponsor-❤-red)]()
<!-- (https://github.com/sponsors/yourusername) -->

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## TODO

- **Support for Dart Objects**: Adding support for storing Dart objects is still pending and requires contributions from the community. If you are interested in helping out, please check out the issues section or submit a pull request.

