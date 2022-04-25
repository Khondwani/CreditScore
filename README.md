# CreditScore

In this application I decided to use the MVVM pattern (Yes overkill for such a small project), Though my reason for using the MVVM over the MVC Pattern was because i wanted to learn how to go about building an application with the MVVM pattern. 

Things that could have been done to consider edge case problems would be as follows:
- First check would be to always check if the users data/internet is active
  - This is because the call to the API will always require internet.
  - If the data/internet is off i would inform the user with either an= alert or toast that inernet is required
- Check if the data that is used by the application is being returned in its correct format 
- If certain information is missing in the JSON object that is required by the application, I would inform the user with an alert that they should either contact Clearscore or go to the help page to see what the issue is 

With regards to automation Testing, I did not get the time for it, though the automation testing I would have done would be as follows:
- Create TDD's for functionality like fetching data from api and decoding it into json format 
