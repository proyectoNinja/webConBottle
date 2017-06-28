<DOCTYPE html>
<html lang="es">
<head>
	<link rel="icon" type="image/png" href="https://static1.squarespace.com/static/5298cdf1e4b069bc9bebdca6/t/561becc6e4b042fd385ceb01/1444670691709/LogoUCM.jpg"/>
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
    document.getElementById("acceptBut").value = "Aceptadas";
    document.getElementById("acceptBut").disabled = true;
		}
		function showsnackbar() {
    	myVar = setTimeout(showPage, 3);
			myVar = setTimeout(hidePage, 5000);
		}

		function showPage() {
  	document.getElementById("loader").style.display = "none";
  	document.getElementById("myDiv").style.display = "block";
		}

		function hidePage(){
			document.getElementById("myDiv").style.display = "none";
		}

		function showPopWindow() {
    alert("Analizando sus datos");
		}


</script>
</head>
<body>
	<ul>
		<li><a class="active" href="http://mifulo.dacya.ucm.es/token">Home</a></li>
		<li><a href="http://mifulo.dacya.ucm.es">LogOut</a></li>
		<li><a href="http://glucmodel.dacya.ucm.es/testing/">glUCModel</a></li>
		<li><a href="http://mifulo.dacya.ucm.es/about">About</a></li>
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

			<p>Elija formato de salida</p>
			<select name="formato" id="formato">
				<option value="pdf">PDF</option>
				<option value="tar">Archivo comprimido</option>
			</select>


		<button  type="submit"  id="uploadButton" disabled="true" onclick="showPopWindow()"/>Upload File</button>

		<div>
			<b>Para subir un documento debe aceptar nuestras condiciones legales</b>
			<input id="acceptBut" type="button" value="Acceptar condiciones" onclick="acceptTerms()">
		</div>
		<b>{{msg}}</b>
	</form>

	<h2>Tratamiento de datos</h2>
	<div>
		<p>Subiendo un documento usted presta su
			consentimiento expreso para proporcionarle
			a la Universidad Complutense de Madrid,
			a través de su grupo de investigación
			Adaptive and Bioinspired Systems Research Group,
			 sus datos personales consistentes en registros y
			 mediciones de sus niveles médicos de Glucosa y
			demás información contenida en los archivos
			subidos. Es responsabilidad del usuario limitar
			su identificación en el archivo de subida.<br>

			En cumplimiento con lo establecido en la
			Ley Orgánica 15/1999, de 13 de diciembre,
			de Protección de Datos de Carácter Personal
			, le informamos que sus datos personales
			serán tratados y quedarán incorporados
			en ficheros resposabilidad de la UCM,
			con la finalidad de realizar tareas de
			investigación .<br>


		Le informamos de que sus datos seran tratados por dichas
		instituciones, y almacenados en ficheros y podrá ejercer sus derechos de acceso, rectificación
		cancelación y oposición enviando una fotocopia de su DNI
		a la dirección glucmodel@ucm.es</p>

	</div>


</body>
</html>
