# Authentication App – README

> This project is a **Flutter + GetX** based Authentication App (Email/Password, OTP, Social Login) that integrates with REST APIs, supports form validation, token management (Access/Refresh), and follows security best practices.

---

## ✨ Features

* Email/Password Sign-up & Sign-in
* OTP Verification (Email/SMS)
* Password Reset (OTP/Link)
* Social Login (Google/Facebook) – optional
* Remember Me + Secure Session
* Profile Fetch/Update
* Role-Based Guard (User/Admin) – optional
* Dark/Light Theme – optional

---

## 🧰 Tech Stack

* **Flutter** (3.x+)
* **GetX** (State, Route, DI)
* **Dio**/`http` (API calls)
* **Flutter Secure Storage** (Secure token storage)
* **Freezed/Equatable** – optional models/equality
* **JSON Serializable** – optional

> Backend: Any REST API (Node/Laravel/Django, etc.) – this README provides generic endpoints.

---

## 📁 Folder Structure (Recommended)

```
lib/
  core/
    config/
      env.dart
      app_routes.dart
    network/
      api_client.dart
      interceptors.dart
    services/
      auth_service.dart
      storage_service.dart
    utils/
      validators.dart
  data/
    models/
      user_model.dart
      auth_response.dart
    repositories/
      auth_repository.dart
  modules/
    auth/
      controllers/
        login_controller.dart
        signup_controller.dart
        otp_controller.dart
        reset_password_controller.dart
      views/
        login_page.dart
        signup_page.dart
        otp_page.dart
        reset_password_page.dart
    home/
      home_page.dart
  widgets/
    custom_button.dart
    custom_input.dart
```

---

## ⚙️ Requirements

* Flutter SDK 3.x+
* Dart 3.x+
* Android Studio / VS Code
* Android SDK / Xcode (for iOS)

---

## 🚀 Setup & Run

```bash
# Install dependencies
flutter pub get

# Run in debug mode (Android/iOS/Web)
flutter run

# Build release example
flutter build apk --release
# flutter build ios --release
```

### 🔑 Environment Setup

Configure your API base URL and environment variables inside `lib/core/config/env.dart`:

```dart
class Env {
  static const String apiBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://api.example.com',
  );
}
```

Pass environment variables at build time:

```bash
flutter run --dart-define=API_BASE_URL=https://api.yourdomain.com
```

---

## 🔗 API Contract (Example)

> Adjust according to your backend.

**Auth**

* `POST /auth/register` → `{ name, email, password }`
* `POST /auth/login` → `{ email, password }` → `{ access_token, refresh_token, user }`
* `POST /auth/otp/send` → `{ email }`
* `POST /auth/otp/verify` → `{ email, otp }`
* `POST /auth/token/refresh` → `{ refresh_token }` → `{ access_token }`
* `POST /auth/password/forgot` → `{ email }`
* `POST /auth/password/reset` → `{ email, otp, password }`
* `GET  /user/profile` → `Authorization: Bearer <access>`
* `PATCH /user/profile` → Update profile fields
* `POST /auth/logout` → Invalidate refresh token

**Status Codes**

* 200/201: Success
* 400: Validation error
* 401: Unauthorized / Invalid token / OTP fail
* 409: Already exists
* 500: Server error

---

## 🔐 Security Best Practices

* Keep Access Tokens short-lived and Refresh Tokens long-lived
* **Never store Refresh Tokens in insecure storage** (use Secure Storage/HTTP-only cookie)
* Enforce SSL (HTTPS)
* Apply rate-limiting and brute-force protection
* Validate inputs (client + server)
* On Logout, clear local storage and invalidate token server-side

---

## 🔄 Auth Flow (Simple Diagram)

```
[Login/Signup Form]
      |
      v
   [API /auth/login]
      |
      v
 [Save access + refresh]
      |
      v
 [Request → Protected Endpoint]
      |
      v
 [If access expired → Refresh token]
      |
      v
 [New access token → Continue]
```
