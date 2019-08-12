Readme.

C# Setup

This application runs using the file as the database, initially, it was designed to work both switchings
between file and Microsoft SQL Database. As time was not in my favor I decided to stick to the file system. 

On the web Configuration in the tag <appSetting>, you will find the full path of the file in order to run it you should put a correct path under value.

The API is running with authentication. in order to register, you can either use the web application
or user postman to register.
using the link:
http://localhost:54413/api/account/register(replace 54413 with your port number)
on postman select body, raw and JSON(application/json). below type
{
	"Email": "your email",
	"Password": "Your password" e.g "Pwd12345."(strong password),
	"ConfirmPassword": "Your password"
}
To request of the token use swagger by typing next to you URL /swagger, select Auth Post token
type your username as your email address and password you will receive a response body with access_token
copy the token to notepad for further use.
To register a user use Swagger select user and post select the example in yellow and fill the relevant values. once done past the token under authorization with the word bearer preceding it.
e.g Bearer +space+ token
and submit to register the user. Observe the path selected for the user you should see a new file named: "User file".
 To add a product, you need an image. To setup the image with your product, navigate to the controller folder and select ProductController and the method post change the path of the file to the path of your image you want to save a product. And then you may user Sagger with your token to save the rest of the information of the product.  