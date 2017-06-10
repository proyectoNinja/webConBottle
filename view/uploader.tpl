<DOCTYPE html>
<html lang="es">
<head>
	<link rel="stylesheet" type="text/css" href="/static/styles.css"/>
	<h1>Análisis glucémico en tramos de 4 horas</h1>
	<script>
	function change() {
		if(document.getElementById("salgo").value=="hdbscan"){
			 	document.getElementById("snucleos").value="0";
	    	document.getElementById("snucleos").disabled=true;
			}
    	else{
	    	document.getElementById("snucleos").disabled=false;
			}
		}
		function acceptTerms(){
    document.getElementById("uploadButton").disabled = false;
    document.getElementById("acceptBut").value = "Accepted";
    document.getElementById("acceptBut").disabled = true;
		}
		function showsnackbar(){
			var x = document.getElementById("snackbar")
    	x.hidden=false;
    	setTimeout(function(){ x.hidden = true; }, 5000);
		}

</script>
</head>
<body>
	<ul>
		<li><a class="active" href="http://mifulo.dacya.ucm.es/token">Home</a></li>
		<li><a href="http://mifulo.dacya.ucm.es">LogOut</a></li>
		<li><a href="http://glucmodel.dacya.ucm.es/testing/">glUCModel</a></li>
	</ul>
	<b>Bienvenido {{user}} </b></head>
	<form enctype="multipart/form-data" action="uploader" method="POST">
		<input name="uploadedfile" type="file" />
		<input type="hidden" name="email" type="text" value="{{user}}">

		<select  name="algo" id="salgo" onchange="change()">
	  	<option value="kmeans">KMeans</option>
	  	<option value="aglomerative">Agglomerative Clustering</option>
			<option value="hdbscan">HDBSCAN</option>
		</select>

		<select name="nucleos" id="snucleos">
			<option value="0">Default</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>

		</select>


		<button  type="submit"  id="uploadButton" disabled="true" onclick="showsnackbar()"/>Upload File</button>

	</form>

	<h2>Tratamiento de datos</h2>
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


	<p>Le informamos de que sus datos seran tratados por dichas
	instituciones, y almacenados en ficheros y podrá ejercer sus derechos de acceso, rectificación
	cancelación y opsición enviando una fotocopia de su DNI
	a la dirección glucmodel@gmail.com</p>

	<b>Para subir un documento debe aceptar nuestras condiciones legales</b>
	<input id="acceptBut" type="button" value="Acceptar condiciones" onclick="acceptTerms()">

	<b>{{msg}}</b>

	<div id="snackbar" hidden=true>Analizando su fichero..</div>

</body>
</html>
