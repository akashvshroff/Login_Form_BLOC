# Outline:
- A basic login form created in Flutter using the BLOC approach to state management and rxdart. A more in-depth explanation of the build along with the reasons for the build are below. 

# Purpose:
- I created page as part of a [Flutter and Dart course](https://www.udemy.com/course/dart-and-flutter-the-complete-developers-guide/learn/lecture/10645864?components=buy_button%2Cdiscount_expiration%2Cgift_this_course%2Cpurchase%2Cdeal_badge%2Credeem_coupon#overview) on Udemy by Stephen Girder. This course taught me the basics of Dart and Flutter and is now moving towards the more nuanced topics such as State Management and Reactive Programming. 
- While the common method of managing changing state or data in Flutter is through StatefulWidgets, this method is not very scalable and doesn't lead to very readable code, therefore the state management approach that is recommended by the Flutter team is called the BLOC approach or the Business Logic Component. 
- Not only did this project introduce me to the idea of BLOC based state management but also the notion of Streams and how to use them effectively with the help of [rxdart](https://pub.dev/packages/rxdart).
- Furthermore, the project helped solidify my understanding of Object Oriented Programming through the usage of getters and setters.
- Ultimately the build is very similar to that outlined to that in the course but also has some minor enhancements of my own which are outlined below. 

# Description:
- While I will not be able to go into every nuance regarding the build, and highly recommend you to check out the course if you want an introduction to Flutter, I will try to cover some general topics as well as some specific features of my build. 
- Firstly, the BLOC approach. 

## BLOC Framework:
- The Business Logic Component framework outlines a means to easily share data within your project by leveraging Streams. To learn about BLOCs beyond the rudimentary explanation that follows, use this [link](https://medium.com/codechai/architecting-your-flutter-project-bd04e144a8f1).
- Streams in Flutter are sources of asynchronous events and are very easy to work with in terms of extracting and manipulating data. Moreover in Flutter, Widgets can be built from events in Streams using the StreamBuilder widget (amongst others). 
- Therefore, bearing these features in mind, the BLOC pattern is rather straightforward with the following steps:
    - We create a BLOC class (here the bloc.dart file in the src/blocs dir) wherein we house our different Streams. We have one for the email field, the password field and the login state checkbox each. I'll go in depth into the other features of this class a little later.
    - Whenever there is an event generated, by either a change in the input fields or checkbox, we add the data to each respective Stream. 
    - This data is then treated - trasformed and validated - and some sort of result is added to the Stream or an error based on whether the validation. 
    - The Widgets are updated to reflect the result in the Stream using the StreamBuiler widget. 
- While the framework is quite easy to understand, the code in implementing the BLOC as well as connecting it to other facets of our project is slightly tricky, therefore I will also explain the BLOC class, the approaches at connecting the BLOC to the rest of our build and the role of RxDart. 

## BLOC Class:
- The [BLOC class](https://github.com/akashvshroff/Login_Form_BLOC/blob/master/lib/src/blocs/bloc.dart) is fairly straight-forward and as instance variables includes the three aforementioned Streams. These are initialised as BehaviorSubject<> which are essentially Streams with added functionality and are from the rxdart library. They work the same as Dart StreamControllers and have added functionality of saving the last value of the Stream. 

    ```dart
    final _emailController = BehaviorSubject<String>();
    final _passwordController = BehaviorSubject<String>();
    final _loginStateController = BehaviorSubject<bool>();
    ```
- There are getters that are used to quickly be able to access features of the BLOC class and abstract the lenghty process. Here, they're used to retrieve the sinks of the Streams (post validation if necessary) to add data as well as retrieve the Streams themselves. 
- Furthermore, the rxdart combineLatest2 method is used to merge the results of the email and password field and are used in the StreamBuilder to determine when the submit button should be activated (explained later).
- The submit method of the Bloc class is called by the submit button and extracts the values of the email, password and login state and displays them to the user to test whether the form is working. 
- Ultimately a dispose method is included which closes all the different BehaviorSubjects. 

## BLOC Implementation:
- There are two ways to add a BLOC to the project - using the global approach and the scoped approach. 
- The global approach is very simple and involves creating an object of the Bloc class in the same file, therefore all the other files that import this class get access to the bloc object. 
- This method works only if the entire class can share the same data, otherwise the scoped approach where different instances are used for different parts of the class. 
- Here, that function is done by the Provider class and can be read about in great details [here](https://www.didierboelens.com/2019/04/bloc-scopedmodel-redux-comparison/).

## Project UI:
- All the UI features are quite self-explanatory for the build but one idea that is everpresent is the use of the StreamBuilder. 
- This StreamBuilder helps keep track of a stream that is assigned to it and whenever there is new data in the Stream, the function assigned to the builder property rebuilds and data about the new event in the Stream is passed to it via the snapshot property. This function returns the UI element (CheckBox or TextField) that we display to the users. 
- Data is added to the respective Stream using the onChanged property of the fields. 

## RxDart:
- The rxdart library is wonderful when we are working with Streams as it provides added functionality on top of the competent Streams API. 
- The combineLatest function is one such example where we can combine the results of the two Streams, here the email and password, and therefore use that to only allow the users to submit the form when both are valid and not errors. 
- I urge you to read through the comprehensive rxdart documentation [here](https://pub.dev/documentation/rxdart/latest/).