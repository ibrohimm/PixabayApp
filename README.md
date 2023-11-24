# PixabayApp
 
This is a simple application that allows the user to login a profile, and see a list of images and its details. 
To get started, you'll need to set up your API key for authentication in LoginService file.

## Used technologies and architecture patterns

- MVVM+C
- Dependency Injection
- Repository Pattern
- RxSwift, RxCocoa
- UI created through XIB files

## Specifications

### Login

- User must fill an email and password
- The email must be valid
- The password must be between 6 and 12 characters long
- The user can press a "login" button
- If the login is successful, the user will navigate to the home page
- Errors in the form should be displayed inline with the corresponding field
- The login service and response must be mocked locally

### Home

- A list of images retrieved from pixabay must be presented
- Each row needs to display the thumbnail for the image and the user who uploaded the image
- Tapping a row will navigate to the details of the image

### Image Detail

The following image details must be presented in two sections in the UI:

• Section 1

- The Image itself
- The image size
- The image type
- The image tags

• Section 2

- The name of the user who uploaded the image
- The amount of views
- The amount of likes
- The amount of comments
- The amount of favorites
- The amount of downloads

