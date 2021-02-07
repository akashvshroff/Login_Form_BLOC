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
- The [BLOC class]() 