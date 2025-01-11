# grocerapp

This is a Flutter app to add groceries and recipes to lists for
a shopping trip.

To log in just enter any text in both fields, check the checkbox then hit submit.

This app uses riverpod for state management. Riverpod uses the Consumer Provider pattern
to update the UI when the data changes.

The Drift package is used for the database ORM. This allows the devs to write the 
queries in code and it gives them the ability to generate the code for the database.

For navigation the Beamer package is used. It uses Navigator 2.0 under the hood 
to allow for easier deeplinking and web navigation.


