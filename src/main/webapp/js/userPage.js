
function hideAll() {
	$("#orders").hide();
	$("#reviews").hide();
	$("#addresses").hide();
	$("#cards").hide();
	$("#sellerCatalog").hide();
	$("#addIva").hide();
}

function showOrders() {
	$("#orders").show();
	$("#reviews").hide();
	$("#addresses").hide();
	$("#cards").hide();
	$("#sellerCatalog").hide();
	$("#addIva").hide();
}

function showReviews() {
	$("#orders").hide();
	$("#reviews").show();
	$("#addresses").hide();
	$("#cards").hide();
	$("#sellerCatalog").hide();
	$("#addIva").hide();
}

function showAddresses() {
	$("#orders").hide();
	$("#reviews").hide();
	$("#addresses").show();
	$("#cards").hide();
	$("#sellerCatalog").hide();
	$("#addIva").hide();
}

function showCards() {
	$("#orders").hide();
	$("#reviews").hide();
	$("#addresses").hide();
	$("#cards").show();
	$("#sellerCatalog").hide();
	$("#addIva").hide();
}

function showCatalog() {
	$("#orders").hide();
	$("#reviews").hide();
	$("#addresses").hide();
	$("#cards").hide();
	$("#sellerCatalog").show();
	$("#addIva").hide();
}

function showAddIva() {
	$("#orders").hide();
	$("#reviews").hide();
	$("#addresses").hide();
	$("#cards").hide();
	$("#sellerCatalog").hide();
	$("#addIva").show();
}

function addProductIva() {
	iva = $("#ivaField").val();
	if (iva.length == 11) {

		$.ajax({
			url: "addIva",
			method: "POST",
			data: { iva: iva },
			success: function(response) {
				if (response == "ok") {
					alert("Ora sei un venditore di ShopTime!");
					location.href="userPage";
				}
				else { alert(response); }
			},
			error: function(jqXHR, textStatus) {
				alert("Request failed: " + textStatus);
			}
		});
	}
	if (iva.length != 11 || iva == "") {
		alert("La partita iva deve essere di 11 cifre");
	}
}




function hasNumber(myString) {
	return /\d/.test(myString);
}

function addAddress() {
	var nomeDestinatario = $('#nomeDestinatario').val();
	var telefonoDestinatario = $('#telefonoDestinatario').val();
	var via = $('#form-address').val();
	var regione = $('#form-address2').val();
	var citta = $('#form-city').val();
	var cap = $('#form-zip').val();
	//alert(nomeDestinatario);

	if (via != "") {
		$.ajax({
			url: "addAddress",
			method: "POST",
			data: {
				nomeDestinatario: nomeDestinatario,
				telefonoDestinatario: telefonoDestinatario,
				via: via,
				regione: regione,
				citta: citta,
				cap: cap
			},
			dataType: "text",
			success: function(response) {
				if (response == "ok") {
					alert("Aggiunto correttamente");
					location.reload();
				}
			},
			error: function(jqXHR, textStatus) {
				alert("Request failed: " + textStatus);
			}
		});
	}

	if (via == "") {
		document.getElementById("labelVia").style.color = "red";
		$('#labelVia').text("Inserisci la via");
	}


}

function addCard() {
	var intestatario = $('#intestatario').val();
	var numero = $('#numero').val();
	var scadenza = $('#scadenza').val();
	var cvv = $('#cvv').val();

	if (numero != "" && cvv != "" && (!(hasNumber(intestatario))) && (numero.length == 16 || numero.length == 30)
		&& cvv.length == 3) {
		$.ajax({
			url: "addCard",
			method: "POST",
			data: {
				intestatario: intestatario,
				numero: numero,
				scadenza: scadenza,
				cvv: cvv
			},
			dataType: "text",
			success: function(response) {
				if (response == "ok") {
					alert("Carta aggiunta correttamente");
					location.reload();
				}
			},
			error: function(jqXHR, textStatus) {
				alert("Request failed: " + textStatus);
			}
		});


		/*if (intestatario == "") {
			document.getElementById("labelIntestatario").style.color = "red";
			$('#labelIntestatario').text("Inserisci il numero di telefono");
		}*/
		if (numero == "") {
			document.getElementById("labelNumero").style.color = "red";
			$('#labelNumero').text("Inserisci il numero di telefono");
		}

		if (scadenza == "") {
			document.getElementById("labelScadenza").style.color = "red";
			$('#labelScadenza').text("Inserisci il numero di telefono");
		}


		if (cvv == "") {
			document.getElementById("labelCvv").style.color = "red";
			$('#labelCvv').text("Inserisci il numero di telefono");
		}

		if (hasNumber(intestatario)) {
			document.getElementById("labelIntestatario").style.color = "red";
			$('#labelIntestatario').text("L'intestatario non deve contenere numeri");
		}

		if (numero.length != 16 && numero.length != 30) {
			alert("il numero delle cifre della carta deve essere uguale a 16 o uguale a 30");
		}

		if (cvv.length != 3) {
			alert("il numero delle cifre del CVV deve essere uguale a 3");
		}
	}
}


function removeCard(card) {
	$.ajax({
		url: "removeCard",
		method: "GET",
		data: {
			card: card
		},
		success: function(response) {
			if (response == "ok")
				location.reload();
		},
		fail: function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		}
	});
}





function removeAddress(address) {
	$.ajax({
		url: "removeAddress",
		method: "GET",
		data: {
			address: address
		},
		success: function(response) {
			if (response == "ok")
				location.reload();
		},
		fail: function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		}
	});
}

function detailsOrderJS(id) {
	$.ajax({
		url: "seeDetailsOrder",
		method: "POST",
		data: { id: id },
		success: function(response) {
			location.href = "detailsOrder?utente=" + id;
		},
		fail: function(jqXHR, textStatus) {
			alert("Request failed: " + textStatus);
		}
	});
}

