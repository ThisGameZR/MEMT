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
