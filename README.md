## Idea

The ScreenTypeBuilder widget simplifies the process of building responsive Flutter applications by 
allowing developers to define different layouts for mobile, tablet, and desktop devices. This 
ensures that the application provides an optimal user experience across various screen sizes without 
the need for extensive conditional logic in the widget tree. It is necessary because each device 
requires a different design and widget building to provide the best user experience.

## Usage


```dart
class MyScreen extends StatelessWidget {
  const MyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeBuilder.build(
      mobile: (context) => const BodyMobile(),
      tablet: (context) => const BodyTablet(),
      desktop: (context) => const BodyDescktop(),
    );
  }
}
```

## Additional information

To add a local package in your pubspec.yaml file, you need to specify the path to the local 
package. Here is an example:

Your project structure should look like this:

```
your_project/
├── lib/
│   ├── src/
│   │    
│   ├── main.dart
├── screen_type_builder/  <-- Local package directory
│   
├── pubspec.yaml
├── README.md
```

And now you can add the local package in your pubspec.yaml file:

```yaml
dependencies:
  screen_type_builder:
    path: screen_type_builder
```