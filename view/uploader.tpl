<DOCTYPE html>
<html lang="es">
<head>
<link rel="stylesheet" type="text/css" href="/static/styles.css"/>
</head>
<b>Bienvenido {{user}} </b></head>
<body>
	<form enctype="multipart/form-data" action="uploader" method="POST">
		<input name="uploadedfile" type="file" />
		<input type="hidden" name="email" type="text" value="{{user}}">

		<select name="algo">
	  	<option value="kmeans">Kmeans</option>
	  	<option value="agglomerative">Aglomerative Clustering</option>
	  	<option value="hbdscan">hbdscan</option>
		</select>

		<input type="submit" value="Upload file" />

	</form>

	<h3>Tratamiento de datos</h3>
	<p>Subiendo un documento usted presta su
		consentimiento expreso para proporcionarle
		a la Universidad Complutense de Madrid,
		a través de su grupo de investigación
		Adaptive and Bioinspired Systems Research Group,
		 sus datos personales consistentes en registros y
		 mediciones de sus niveles médicos de Glucosa y
		demás información contenida en los archivos
		subidos. Es responsabilidad del usuario limitar
		su identificación en el archivo de subida.</p>

	<p>En cumplimiento con lo establecido en la
		Ley Orgánica 15/1999, de 13 de diciembre,
		de Protección de Datos de Carácter Personal
		, le informamos que sus datos personales
		serán tratados y quedarán incorporados
		en ficheros resposabilidad de la UCM,
		con la finalidad de realizar tareas de
		investigación .</p>

		<p>Tales ficheros estań debidamente
			registrados en la Agencia Española de
		Protección de Datos.
		</p>

	<p>Le informamos de que sus datos seran tratados por dichas
	instituciones, y almacenados en ficheros y podrá ejercer sus derechos de acceso, rectificación
	cancelación y opsición enviando una fotocopia de su DNI
	a la dirección glucmodel@gmail.com</p>
</body>
</html>
