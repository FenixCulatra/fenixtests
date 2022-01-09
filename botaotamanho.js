var tipo = "h1"
var p = document.querySelectorAll(tipo)
tamanho = 30
if (p.length == 0) {
	var tipo = "h2"
	var p = document.querySelectorAll(tipo)
	tamanho = 24
}
if (p.length == 0) {
	var tipo = "h3"
	var p = document.querySelectorAll(tipo)
	tamanho = 20
}
if (p.length == 0) {
	var tipo = "h4"
	var p = document.querySelectorAll(tipo)
	tamanho = 16
}
if (p.length == 0) {
	var tipo = "h5"
	var p = document.querySelectorAll(tipo)
	tamanho = 12
}
if (p.length == 0) {
	var tipo = "h6"
	var p = document.querySelectorAll(tipo)
	tamanho = 8
}
//-----------------------------------------------------
for (var x = 0; x < p.length; x++){
	p[x].style.fontSize = `${tamanho}px`
	var butao = document.createElement("button")
	p[x].appendChild(butao)
	butao.setAttribute("onclick","javascript: aumenta(this.value)")
	butao.setAttribute("value",`${x}`)
	butao.setAttribute("style","background-color: black; color: white; border-radius: 10px;")
	butao.textContent = "+"
	var butao = document.createElement("button")
	p[x].appendChild(butao)
	butao.setAttribute("onclick","javascript: diminui(this.value)")
	butao.setAttribute("value",`${x}`)
	butao.setAttribute("style","background-color: black; color: white; border-radius: 10px;")
	espaco.textContent = " "
	butao.textContent = "-"
	p[x].value = tamanho
}
botao = document.querySelectorAll("button")
function aumenta(quem){
	tam = p[quem].value + 5
	p[quem].style.fontSize = `${tam}px`
	p[quem].value = tam
}
function diminui(quem){
	if (p[quem].value > 25){
	tam = p[quem].value - 5
	p[quem].style.fontSize = `${tam}px`
	p[quem].value = tam
}}
