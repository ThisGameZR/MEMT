# MEMT - MyCos Employee Mood Tracker

## **Summary**

During the covid-19 pandamic situation most of the people are work from home, so that’s make people isolated and that cause the team collaboration is weak. We sould like to have a system to keep track and amke people stay connected even if poeple are not sit together. So we want an application to solve these problems.

## **Background**

When people are working individually it is easy to make people get stress and fell lonely because the human intreaction is reduce. So we would like to help our emplyees by keep track their mood and feeling during the day, then we can take this records and analyze to create an activity and motivate them

## **Project Scope**

### **Project Characteristics and Requirements**

| Keyword | Description                                                                                                                             |
| ------- | --------------------------------------------------------------------------------------------------------------------------------------- |
| SHALL   | Shall is used to indicate a requirement that is contractually binding, meaning it must be implemented, and its implementation verified. |
| SHOULD  | Should is used to indicate a goal which must be addressed but not mandatory.                                                            |

- System shall be able to track emplyee mood during the day
- System shall be a web application
- System shall be compatible with mobile device
- System shall allow only users that have email under the domain [mycostech.com](http://mycostech.com) to access the application
- System shall provide a basic assetment for the first time user access to the system
- System shall provide user to rate their mood into 5 levels Great, Good, So so, Exhausted, Sad
- System should allow admin to create the assetment level and indicator of user mood and feeling to notify when user is not doing well
- System shall verify and notify user if user seems like to be sad or too silient
- System shall provide a report for admin to see the summary reports
- System reports should be illustrate in interactive charts like line, graph and pie chart etc.
- System should give a suggestion and solution to user. For example standup when sit for a long time, have a cup of coffee after lunch etc.
- System should provide an information to motivate user to do following the suggestion. For example, Excersise 30 mins a day can improve your sleep quality.

## **Appendix**

- ER - Entity Relationship
- EER - Enchanced Entity Relationship
- SQL - Structured Query Language
- ORM - Object Relational Mapper
- API - Application Programming Interface
- REST - Representational State Transfer
- CRUD - Create, Read, Update, Delete
- MVC - Model View Controller
- API - Application Programming Interface

## **Software Requirements and Specifications**

### **Features**

```

```

### **Operating Environment**

```

```

### **Functional Requirements**

```

```

### **Non-Functional Requirements**

```

```

### **Dependencies**

Backend:

- [ASP.NET Core](https://www.asp.net/core)
- [Entity Framework Core](https://www.entityframework.net)
- [Microsoft.AspNetCore.Identity](https://www.asp.net/identity)

Frontend:

- [React](https://reactjs.org)
- [React Router](https://reacttraining.com/react-router/web/guides/quick-start)
- [Redux](https://redux.js.org)

Database:

- [SQL Server](https://www.microsoft.com/en-us/sql-server/sql-server-developer-studio)
- [SQL Server Management Studio](https://www.microsoft.com/en-us/sql-server/sql-server-management-studio)

## **System Overview**

### <b style="text-decoration: underline">Use Case Diagram</b>

<img src="https://i.ibb.co/JcqPWQj/Untitled-Diagram-drawio.png" alt="Use Case Diagram"/>

### <b style="text-decoration: underline">System Architecture Diagram</b>

<img src="https://i.ibb.co/2WFBB4Q/pary-1.png" alt="System Architecture Diagram"/>

### <b style="text-decoration: underline">System Logic</b>

<img src="https://fakeimg.pl/640x360" alt="System Logic"/>

- User Interface Layer

  The User Interface Layer will consist of everything shown directly to the client. This Layer will communicate only with the Application Logic Layer. This Layer will also be responsible for initial validation of any user inputted data. Any validation that requires communication to the Data Storage Layer will however be completed at the Logic Layer.

- Application Logic Layer

  This layer will be responsible for providing a secure connection to the Data Storage Layer and formatting information received from the SQL Server using **ASP .NET CORE ENTITY FRAMEWORK** as an ORM for presentation to the User Interface Layer. Scripts that return user specific data, such as advisory stream selection will be run on the Data Storage Layer.

- Data Storage Layer

  The Data Storage Layer will record all information required by the Logic and User Interface Layer. This data will include Subject details for the Streams, and general user and admin user information. All passwords stored in the database will be encrypted to prevent unauthorized access. Within the Data Storage Layer a collection of SQL Queries will provide access to the data in a meaningful way.

## **Use Cases Model**

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

# **API Documentation**

## **Response Code Reference**

| Code |      Description      |
| :--: | :-------------------: |
| 200  |        Success        |
| 400  |      Bad Request      |
| 401  |     Unauthorized      |
| 403  |       Forbidden       |
| 404  |       Not Found       |
| 500  | Internal Server Error |

## **Endpoint references**

|          Type           |         Endpoint          | Description          |
| :---------------------: | :-----------------------: | -------------------- |
|   **Anonymous Route**   |
|          POST           |      /api/auth/login      | Login                |
|          POST           |     /api/admin/login      | Admin Login          |
| **Authenticated Route** |
|   **Member Section**    |
|           GET           |  /api/member/first-time   | First Time Login     |
|           GET           |  /api/member/suggestion   | User Suggestion      |
|           GET           |   /api/member/statistic   | User Statistics      |
|          POST           | /api/member/daily-report  | Daily Report         |
|    **Admin Section**    |
|           GET           |   /api/admin/statistic    | Admin Statistics     |
|           GET           | /api/admin/summary-report | Admin Summary Report |
|          POST           |  /api/admin/suggest-user  | Admin Suggest User   |

## **Endpoint Description**

### `POST /api/auth/login`

### Request-Header

| Variable | Type | Description |
| :------- | :--- | :---------- |
|          |      |             |

### Request-Body

| Variable | Type     | Description   |
| :------- | :------- | :------------ |
|          | `JSON`   |               |
| email    | `string` | user email    |
| password | `string` | user password |

### Response-Body

| Variable | Type     | Description                       |
| :------- | :------- | :-------------------------------- |
|          | `JSON`   |                                   |
| success  | `bool`   | true if login is successful       |
|          |          | false if login is unsuccessful    |
| message  | `string` | usually error message from server |
| token    | `string` | JWT token                         |

### Response Examples:

```json

Response code: 200

{
  "success": true,
  "message": "Login Successful",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
}

```

```json

Response code: 400

{
  "success": false,
  "message": "Invalid email or password"
}

```

```json

Response Code: 500

{
  "success": false,
  "message": "Internal Server Error"
}

```

<div style="width:100%; height:3px; background:white; margin: 20px 0px"></div>

### `POST /api/admin/login`

### Request-Header

| Variable | Type | Description |
| :------- | :--- | :---------- |
|          |      |             |

### Request-Body

| Variable | Type     | Description   |
| :------- | :------- | :------------ |
|          | `JSON`   |               |
| email    | `string` | user email    |
| password | `string` | user password |

### Response-Body

| Variable | Type     | Description                       |
| :------- | :------- | :-------------------------------- |
|          | `JSON`   |                                   |
| success  | `bool`   | true if login is successful       |
|          |          | false if login is unsuccessful    |
| message  | `string` | usually error message from server |
| token    | `string` | JWT token                         |

### Response Examples:

```json

Response code: 200

{
  "success": true,
  "message": "Login Successful",
  "token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c"
}

```

```json

Response code: 400

{
  "success": false,
  "message": "Invalid email or password"
}

```

```json

Response Code: 500

{
  "success": false,
  "message": "Internal Server Error"
}

```

<div style="width:100%; height:3px; background:white; margin: 20px 0px"></div>

### `GET /api/member/first-time`

### Request-Header

| Variable | Type     | Description |
| :------- | :------- | :---------- |
| token    | `string` | JWT TOKEN   |

### Response-Body

| Variable | Type     | Description                       |
| :------- | :------- | :-------------------------------- |
|          | `JSON`   |                                   |
| success  | `bool`   | true if successful                |
|          |          | false if unsuccessful             |
| message  | `string` | usually error message from server |
| data     | `JSON`   | response data from server         |

### Response Examples:

```json

Response code: 200

{
  "success": true,
  "message": "success",
  "data": {

  }
}

```

```json

Response Code: 401

{
  "success": false,
  "message": "Unauthorized, token is invalid or expired or not provided"
}

```

```json

Response Code: 500

{
  "success": false,
  "message": "Internal Server Error"
}

```

<div style="width:100%; height:3px; background:white; margin: 20px 0px"></div>

### `GET /api/member/suggestion`

### Request-Header

| Variable | Type     | Description |
| :------- | :------- | :---------- |
| token    | `string` | JWT TOKEN   |

### Response-Body

| Variable | Type     | Description                       |
| :------- | :------- | :-------------------------------- |
|          | `JSON`   |                                   |
| success  | `bool`   | true if successful                |
|          |          | false if unsuccessful             |
| message  | `string` | usually error message from server |
| data     | `JSON`   | response data from server         |

### Response Examples:

```json

Response code: 200

{
  "success": true,
  "message": "success",
  "data": {

  }
}

```

```json

Response Code: 401

{
  "success": false,
  "message": "Unauthorized, token is invalid or expired or not provided"
}

```

```json

Response Code: 500

{
  "success": false,
  "message": "Internal Server Error"
}

```

<div style="width:100%; height:3px; background:white; margin: 20px 0px"></div>

### `GET /api/member/statistic`

### Request-Header

| Variable | Type     | Description |
| :------- | :------- | :---------- |
| token    | `string` | JWT TOKEN   |

### Response-Body

| Variable | Type     | Description                       |
| :------- | :------- | :-------------------------------- |
|          | `JSON`   |                                   |
| success  | `bool`   | true if successful                |
|          |          | false if unsuccessful             |
| message  | `string` | usually error message from server |
| data     | `JSON`   | response data from server         |

### Response Examples:

```json

Response code: 200

{
  "success": true,
  "message": "success",
  "data": {

  }
}

```

```json

Response Code: 401

{
  "success": false,
  "message": "Unauthorized, token is invalid or expired or not provided"
}

```

```json

Response Code: 500

{
  "success": false,
  "message": "Internal Server Error"
}

```

<div style="width:100%; height:3px; background:white; margin: 20px 0px"></div>

### `POST /api/member/daily-report`

### Request-Header

| Variable | Type     | Description |
| :------- | :------- | :---------- |
| token    | `string` | JWT TOKEN   |

### Request-Body

| Variable | Type    | Description            |
| :------- | :------ | :--------------------- |
|          | `JSON`  |                        |
| mood     | `int`   | mood status            |
| feeling? | `string | user feeling           |
| datetime | `date`  | datetime of the report |

Note: ? means optional

### Response-Body

| Variable | Type     | Description                       |
| :------- | :------- | :-------------------------------- |
|          | `JSON`   |                                   |
| success  | `bool`   | true if successful                |
|          |          | false if unsuccessful             |
| message  | `string` | usually error message from server |

### Response Examples:

```json

Response code: 200

{
  "success": true,
  "message": "success"
}

```

```json

Response Code: 400

{
  "success": false,
  "message": "Mood status is required"
}

```

```json

Response Code: 401

{
  "success": false,
  "message": "Unauthorized, token is invalid or expired or not provided"
}

```

```json

Response Code: 500

{
  "success": false,
  "message": "Internal Server Error"
}

```

<div style="width:100%; height:3px; background:white; margin: 20px 0px"></div>

### `GET /api/admin/statistic`

### `GET /api/admin/summary-report`

### `POST /api/admin/suggest-user`

## More will be documented soon...
