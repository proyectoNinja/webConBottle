<DOCTYPE html>
<html lang="en">
<head><b>Bienvenido {{user}} </b></head>
<body>
	<form enctype="multipart/form-data" action="uploader " method="POST">
		<input name=uploadedfile" type="file" />
		<input type="hidden" name="email" type="text" value="{{user}}">
		<input type="submit" value="Upload file" />
	</form>
</body>
</html>
