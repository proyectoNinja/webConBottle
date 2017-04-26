<DOCTYPE html>
<html lang="es">
<head>
<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<b>Bienvenido {{user}} </b></head>
<body>
	<h1>Bienvenido {{user}}</h1>
	<form enctype="multipart/form-data" action="uploader " method="POST">
		<input name="uploadedfile" type="file" />
		<input type="hidden" name="email" type="text" value="{{user}}">
		<input type="submit" value="Upload file" />
	</form>
	<h3>Tratamiento de datos</h3>
	<p>Subiendo un documento usted presta su consentimiento
	expreso para proporcionarle a la UCM y al hospital NOMBREHOSPITAL,
	sus datos personales consistentes en registros y mediciones
	de sus niveles médicos de COMPLETAR. .</p>

	<p>En cumplimiento con lo establecido en la Ley Orgánica 15/1999, de 13 de diciembre, de Protección de Datos
		de Carácter Personal, le informamos que sus datos personales serán tratados y quedarán incorporados en ficheros
		resposabilidad de la UCM, registrados en la Agencia Española de Protección de Datos, con la finalidad de prevenir
		COMPLETAR</p>

	<p>Le informamos de que sus datos seran tratados por dichas
	instituciones, y almacenados en ficheros y podrá ejercer sus derechos de acceso, rectificación
	cancelación y opsición enviando una fotocopia de su DNI
	a la dirección glucmodel@gmail.com</p>
</body>
</html>
