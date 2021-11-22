function mostraHora(){
	let titulo = document.getElementById('rejoio')
	let agora = new Date();
	titulo.textContent = agora.toLocaleTimeString();
}
mostraHora();
setInterval(mostraHora,1000);
