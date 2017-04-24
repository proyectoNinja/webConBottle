<DOCTYPE html>
<html lang="es">
<head>
<style>
body{background-color: gray;
}
h1{
	color:black;
	text-align:center;
}
h2{
	color:red;
	text-align:center;
}
p{
	font-family:verdana;
	font-size: 20 px;
}
</style>
</head>
<b>Bienvenido {{user}} </b></head>
<body>
	<h1>Bienvenido {{user}}</h1>
	<form enctype="multipart/form-data" action="uploader " method="POST">
		<input name=uploadedfile" type="file" />
		<input type="hidden" name="email" type="text" value="{{user}}">
		<input type="submit" value="Upload file" />
	</form>
	<h2>Tratamiento de datos</h2>
	<p>Subiendo un documento usted presta su consentimiento
	expreso para proporcionarle a la UCM NOMBREHOSPITAL
	sus datos personales consistentes en registros y mediciones
	de sus niveles médicos de COMPLETAR para la finalidad de 
	prevenir..COMPLETAR .

	Le informamos de que sus datos seran tratados por dichas 
	instituciones y podrá ejercer sus derechos de acceso, rectificación
	cancelación y opsición enviando una fotocopia de su DNI
	a la dirección glucmodel@gmail.com</p>
</body>
</html>
