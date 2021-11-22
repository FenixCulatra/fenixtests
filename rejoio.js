let titulo = document.getElementById('rejoio')
let original = titulo.textContent
function mostraHora(){
	let agora = new Date();
	titulo.textContent = original+" "+agora.toLocaleTimeString();
}
mostraHora();
setInterval(mostraHora,1000);
