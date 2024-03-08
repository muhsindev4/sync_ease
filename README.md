
# SyncEase[](https://pub.dev/packages/sync_ease#syncease)

![enter image description here](https://raw.githubusercontent.com/muhsindev4/sync_ease/main/Screenshot%202023-09-26%20215731.png)  SyncEase is a lightweight and versatile state management library for Flutter applications. It provides simple yet powerful tools for managing the state of your application with ease.

## Features[](https://pub.dev/packages/sync_ease#features)

-   **Simple API**: SyncEase offers a straightforward API for managing state, making it easy to integrate into your Flutter projects.
-   **Error Handling**: Easily handle errors within your application state and propagate them to your UI.
-   **Loading State**: Manage loading states within your application, providing feedback to users during asynchronous operations.
-   **Batch Operations**: Perform batch operations on your state, allowing you to update multiple values atomically.
-   **Listener Support**: SyncEase supports listeners, allowing you to react to state changes and update your UI accordingly.
-   **Versatile**: Suitable for various types of state management scenarios, including simple value states and list states.

## Installation[](https://pub.dev/packages/sync_ease#installation)

To use SyncEase in your Flutter project, add the following dependency to your  `pubspec.yaml`  file:

```yaml
dependencies:
  sync_ease: ^1.0.0`

```

Then, run  `flutter pub get`  to install the package.

## Usage[](https://pub.dev/packages/sync_ease#usage)

Here's a simple example of how to use SyncEase to manage state in your Flutter application:

### 1. Import SyncEase[](https://pub.dev/packages/sync_ease#1-import-syncease)

```css
import 'package:sync_ease/sync_ease.dart';

```

### 2. Create an Instance of Ease[](https://pub.dev/packages/sync_ease#2-create-an-instance-of-ease)

```css
final Ease<int> counter = Ease(0);

```

### 3. Use EaseBuilder to React to State Changes[](https://pub.dev/packages/sync_ease#3-use-easebuilder-to-react-to-state-changes)

```css
 EaseBuilder<int>(
  ease: counter,
  builder: (context, value) => Text(
    value.toString(),
    style: TextStyle(fontSize: 24),
  ),
),

```

### 4. Update State Values[](https://pub.dev/packages/sync_ease#4-update-state-values)

```css
counter.value++; // Increment the counter
```

## Counter App With SyncEase[](https://pub.dev/packages/sync_ease#counter-app-with-syncease)

```css
import 'package:flutter/material.dart';  
import 'package:sync_ease/sync_ease.dart';  
  
class CounterLogic extends SyncEaseLogic{  
int a=0;  
  
increment(){  
a++;  
put(); // update Logic Builder Widget  
}  
}  
  
class MyApp extends StatelessWidget{  
final CounterLogic _counterLogic=SyncEaseLogic.reg(CounterLogic());  
  
MyApp({super.key});  
@override  
Widget build(BuildContext context) {  
	return Scaffold(  
		floatingActionButton: FloatingActionButton(  
		child: const Icon(Icons.add),  
		onPressed: (){  
		_counterLogic.increment();  
		},  
	),  
	body: Center(  
	child: LogicBuilder(  
	logic: _counterLogic,  
	builder: (BuildContext context) {  
	return Text(_counterLogic.a.toString());  
	},  
	)  
	),  
	);  
}  
  
}

```

## Advantages[](https://pub.dev/packages/sync_ease#advantages)

-   **Simplicity**: SyncEase offers a simple and intuitive API, making it easy to manage state in Flutter applications.
-   **Flexibility**: It provides various features like error handling, loading state management, and batch operations, catering to diverse state management needs.
-   **Efficiency**: With its listener support and batch operations, SyncEase ensures efficient state updates and UI rendering.
-   **Compatibility**: SyncEase seamlessly integrates with existing Flutter projects and other state management solutions, allowing for smooth adoption.
- Show Snack Bar, Alert Dialog, and Date Picker Anywhere in the App


## Dialogs

### Show Snack Bar, Alert Dialog, and Date Picker Anywhere in the App

You can now use the `showSyncSnackBar`, `showSyncAlertBox`, and `showSyncDatePicker` functions to display snack bars, alert dialogs, and date pickers from anywhere in the app, even outside the widget tree.

#### Example

```css
showSyncSnackBar(SnackBar(content: Text('Hello, world!')));

showSyncAlertBox(
  builder: (BuildContext context) => AlertDialog(
    title: Text('Alert'),
    content: Text('This is an alert dialog.'),
  ),
);

showSyncDatePicker(
  initialDate: DateTime.now(),
  firstDate: DateTime(2022),
  lastDate: DateTime(2025),
);

```


## Simple Navigation
```css
to(SecondPage());
```

```css
to(SecondPage(),asrguments:{"name":"Jhone"});
```

```css
back();
```

## Documentation[](https://pub.dev/packages/sync_ease#documentation)

For detailed documentation and API reference, visit the SyncEase Documentation.

## Contributing[](https://pub.dev/packages/sync_ease#contributing)

Contributions to SyncEase are welcome! If you find any bugs or have suggestions for improvements, please open an issue or submit a pull request on GitHub.