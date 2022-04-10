### **Note that:** User might often be called as Employee, and Employee might often be called as User in this document.

```
Use Case Name: Login
Use Case ID: 001
Actor Involved: Visitor

Brief Description:
User can use this Login page in order to login to the system.

Extension Points:
- Navigation Bar => state => not login

Basic Flow:
This Use Case starts when a visitor accesses Member Section.
The visitor will be redirects to the Login page.
This Login page will contain a form with the following fields:

  1) Email (string) => email@mycostech.com
  2) Password (string) => ******

This page will implment as OAuth2.0 to authenticate user under the domain mycostech.com.

Alternative Flow:
If, in the Basic Flow, the visitor enter invalid email/password,
the application will display an error message and provide user the option to re-try

Special Requirements: None

Pre-Conditions:
The visitor must visit the Login page before access any Member Section contents
The visitor will be redirected to the Login page when try to access Member Section

Post-Condtions:
The username and password are authenticated with OAuth2.0 system.
If the user exists, and credentials are correct, we redirect user to
the Member Section page. if the user does not exist, or the user exists
but the credentials does not match. we redirect the user to the
Basic Flow of this Use Case with an appropiate error message

```

```
Use Case Name: First Time User
Use Case ID: 002
Actor Involved: User (Employee)

Brief Description:
User will be redirected to this page when he/she first access the system.
This page will contain a form with use to basic assess the user for the first time.

Extension Points:
- Member Section

Basic Flow:
This Use Case starts when a user access the system for the first time.
The user will be redirected to this page.
This page will contain a form with the following fields:

Pre-Conditions:
The user must be authenticated to access this page

Post-Conditions:
The user will be redirected to the Member Section page.

```

```

Use Case Name: User Mood Report
Use Case ID: 003
Actor Involved: User (Employee)

Brief Description:
User can use this page to report their mood and feeling during the day.

Extension Points:
- Member Section

Basic Flow:
This use case starts when a user navigate to the Daily Report page.
The user will be redirected to this page.
This page will contain a form with the following fields:

  1) Mood (5 levels) => 5 radio buttons (Great, Good, So so, Exhausted, Sad)
  2) Feeling (string?) => text area
  3) Date (disabled) => current date
  4) Time (disabled) => current time

Note: ? indicates that the field is optional.

Alternative Flow:
If the user does not select any mood, the application will display an error message.
and provide user the option to re-try

Pre-Conditions:
The user must be authenticated to access this page

Post-Conditions:
The user will be redirected to the User Statistics page.

```

```

Use Case Name: User Statistics
Use Case ID: 004
Actor Involved: User (Employee)

Brief Description:
User can use this page to view their statistics.

Extension Points:
- Member Section

Basic Flow:
This use case starts when a user navigate to the User Statistics page.
The user will be redirected to this page.
This page will contain various statistics about the user.
Example: Average mood, average feeling, average sleep quality, etc.

Alternative Flow:
none

Pre-Conditions:
The user must be authenticated to access this page

Post-Conditions:
none

```

```

Use Case Name: User Suggestion
Use Case ID: 005
Actor Involved: User (Employee)

Brief Description:
User can use this page to view their suggestion and solution.

Extension Points:
- Member Section

Basic Flow:
This use case starts when a user navigate to the User Suggestion page.
or when a user click on suggestion notification.
The user will be redirected to this page.
This page will contain a data table with the following fields:

  1) Suggestion (string) => text area
  2) Solution (string) => text area
  3) Date (disabled) => current date
  4) Time (disabled) => current time
  5) Who (disabled) => Suggested by

Alternative Flow:
none

Pre-Conditions:
The user must be authenticated to access this page

Post-Conditions:
none

```

```

Use Case Name: Admin Login
Use Case ID: 006
Actor Involved: Visitor

Brief Description:
User can use this Login page in order to login as an Admin.

Extension Points:
- /admin/login

Basic Flow:
This Use Case starts when a visitor accesses Admin Section.
The visitor will be redirected to the Admin Login page.
This Login page will contain a form with the following fields:

  1) Email (string) => email@mycostech.com
  2) Password (string) => ******

This page will implement as OAuth2.0 to authenticate user under the domain mycostech.com.

Alternative Flow:
If, in the Basic Flow, the visitor enter invalid email/password,
the application will display an error message and provide user the option to re-try
If the user role is not admin, the application will display an error message and redirect user to the Member Section Login page

Pre-Conditions:
The visitor must visit the Admin Login page before access any Admin Section contents
The visitor will be redirected to the Admin Login page when try to access Admin Section

Post-Conditions:
The username and password are authenticated with OAuth2.0 system.
If the user exists, and credentials are correct, we redirect user to
the Admin Section page. if the user does not exist, or the user exists
but the credentials does not match. we redirect the user to the
Basic Flow of this Use Case with an appropiate error message

```

```
Use Case Name: Admin Suggest User
Use Case ID: 007
Actor Involved: Admin

Brief Description:
Admin can use this page to give suggestion to a user.

Extension Points:
- Admin Section

Basic Flow:
This use case starts when a user navigate to the Admin Suggestion page.
The user will be redirected to this page.
This page will contain a form with the following fields:

  1) User (User ID) => drop down list from all users in the system
  2) Suggestion (string) => text area
  3) Solution (string) => text area
  4) Date (disabled) => current date
  5) Time (disabled) => current time

Alternative Flow:
If the user does not select any user, the application will display an error message.
and provide user the option to re-try

Pre-Conditions:
The user must be authenticated as an Admin to access this page

Post-Conditions:
The user will be redirected to the Admin Section page.

```

```

Use Case Name: Admin Statistics
Use Case ID: 008
Actor Involved: Admin

Brief Description:
Admin can use this page to view the statistics of all users.

Extension Points:
- Admin Section

Basic Flow:
This use case starts when a user navigate to the Admin Statistics page.
The user will be redirected to this page.
This page will contain various statistics about the user.
Example: Average mood, average feeling, average sleep quality, etc.

Alternative Flow:
none

Pre-Conditions:
The user must be authenticated as an Admin to access this page

Post-Conditions:
none

```

```

Use Case Name: Admin Summary Report
Use Case ID: 009
Actor Involved: Admin

Brief Description:
Admin can use this page to view the summary report of all users from the system.

Extension Points:
- Admin Section

Basic Flow:
This use case starts when a user navigate to the Admin Summary Report page.
The user will be redirected to this page.

Alternative Flow:
none

Pre-Conditions:
The user must be authenticated as an Admin to access this page

Post-Conditions:
none

```

## **System Logic**

- The system will notify the user when the user seems to be sad or silent.

```

How to detect the user is sad or silent?

```

- The system will give a suggestion and solution to the user.

```

How to give a suggestion and solution to the user?

```

- The system shall motivate the user to follow the suggestion and solution.

```

How to motivate the user to follow the suggestion and solution?

```

- The system will provide summary report of all users to the admin.

```

```
