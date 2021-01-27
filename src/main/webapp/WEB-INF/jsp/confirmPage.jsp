<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="/js/confirmOrder.js"></script>
<meta charset="ISO-8859-1">
<jsp:include page="headMarketPlace.jsp" />
<script src="/js/userPage.js"></script>
</head>
<body>
	<jsp:include page="navbarMarketPlace.jsp" />
	<div>
		<div>
			<strong>Scegli indirizzo di spedizione</strong>
			<c:forEach var="address" items="${user.indirizzi}">
				<div class="form-check" id="addressForm">
					<input name="gruppo1" type="radio" id="${address.codice}" checked>
					<label for="${address.codice}"><strong> Nome
							destinatario: ${address.destinatario}<br>Numero di telefono:
							${address.numTelefono}<br>Via: ${address.via}
					</strong><br> Regione: ${address.regione}, Citta: ${address.citta} <br>
						Cap: ${address.cap}<br> </label>


				</div>
			</c:forEach>

		</div>
		<div>
			<strong>Scegli la carta di addebito</strong>
			<c:forEach var="card" items="${userCards}">
				<div class="form-check" id="cardForm">
					<input name="gruppo2" type="radio" id="${card.numero}" checked>
					<label for="radio1"><strong> Intestatario:
							${card.intestatario}</strong><br> Numero carta: ${card.numero}<br>
						Scadenza: ${card.scadenza}, </label>
				</div>
			</c:forEach>
		</div>


		<div class="col-md-12">
			<input type="submit" class="btn btn-dark" value="Aggiungi indirizzo"
				data-toggle="modal" data-target="#modalAddAddress"></input>
		</div>
		<div class="col-md-12">
			<input type="submit" class="btn btn-dark" value="Aggiungi carta"
				data-toggle="modal" data-target="#modalAddCard"></input>
		</div>


		<div class="card shopping-cart">
			<div class="card-header bg-dark text-light">
				<!-- <i class="fa fa-shopping-cart" aria-hidden="true"></i> ORDINE <a
					href="/" class="btn btn-outline-info btn-sm pull-right">Continua
					a comprare!</a>-->
				<div class="clearfix"></div>
			</div>
			<div class="card-body">
				<!-- PRODUCT -->
				<c:forEach var="prodotto" items="${cart}">
					<div class="row">
						<div class="col-12 col-sm-12 col-md-2 text-center">
							<img class="img-responsive" src="${prodotto.urlImg}"
								alt="prewiew" width="120" height="80">
						</div>
						<div class="col-12 text-sm-center col-sm-12 text-md-left col-md-6">
							<h4 class="product-name">
								<strong>${prodotto.nome}</strong>
							</h4>
							<!-- <h4>
							<small>Product description</small>
						</h4> -->
						</div>
						<div
							class="col-12 col-sm-12 text-sm-center col-md-4 text-md-right row">
							<div class="col-3 col-sm-3 col-md-6 text-md-right"
								style="padding-top: 5px">
								<h6>
									<strong>${prodotto.prezzo}&euro;<span
										class="text-muted">x</span></strong>
								</h6>
							</div>
							<div class="col-4 col-sm-4 col-md-4">
								<div class="quantity">
									<!--<input type="button" value="+" class="plus"> -->
									<c:set var="var" value="n${prodotto.nome}" />
									<input type="number" step="1" max="${prodotto.quantita}"
										min="1" value="${prodotto.quantita}" title="Qty" class="qty"
										size="4">
									<!-- <input type="button" value="-"
										class="minus"> -->
								</div>
							</div>
						</div>
					</div>
					<br></br>
				</c:forEach>
				<div class="card-footer">
					<div class="pull-right" style="margin: 10px">
						<a href="javascript:createOrder()"
							class="btn btn-success pull-right">Procedi con l'acquisto</a>
						<div class="pull-right" style="margin: 5px">
							Prezzo totale <b>${cartPrice}&euro;</b>
						</div>
					</div>
				</div>

				<hr>

				<!-- END PRODUCT -->

			</div>
		</div>
	</div>



	<div class="modal fade" id="modalAddAddress" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold" id="accessBtn">Aggiungi
						un nuovo indirizzo</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body mx-3">
					<div class="form-group">
						<label for="nomeDestinatario" id="labelNomeDestinatario">Nome
							destinatario</label> <input type="text" class="form-control"
							id="nomeDestinatario"
							placeholder="Non compilare se vuoi lasciare il tuo nome">
					</div>

					<div class="form-group">
						<label for="telefonoDestinatario" id="labelNomeDestinatario">Numero
							telefono destinatario</label> <input type="number" class="form-control"
							id="telefonoDestinatario"
							placeholder="Non compilare se vuoi lasciare il tuo numero di telefono">
					</div>
					<div class="form-group">
						<label for="form-address" id="labelVia">Via</label> <input
							type="search" class="form-control" id="form-address"
							placeholder="Via*" />
						<!-- NON DOBBIAMO TOCCARE L'ID CHE SENNO' NON FUNZIONA API -->
					</div>
					<div class="form-group">
						<label for="form-address2" id="labelRegione">Regione</label> <input
							type="text" class="form-control" id="form-address2" disabled />
					</div>
					<div class="form-group">
						<label for="form-city" id="labelCitta">Citta'</label> <input
							type="text" class="form-control" id="form-city" disabled />
					</div>
					<div class="form-group">
						<label for="form-zip" id="labelCap">CAP</label> <input
							type="number" class="form-control" id="form-zip" disabled />
					</div>

				</div>
				<div class="modal-footer d-flex justify-content-center">
					<input type="submit" class="btn btn-dark" onclick="addAddress()"
						value="Aggiungi indirizzo"></input>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="modalAddCard" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header text-center">
					<h4 class="modal-title w-100 font-weight-bold" id="accessBtn">Aggiungi
						una nuova carta</h4>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="form-group">
					<label for="intestatario" id="labelIntestatario">Intestatario</label>
					<input type="text" class="form-control" id="intestatario"
						placeholder="Non compilare se vuoi lasciare il tuo nome">
				</div>

				<div class="form-group">
					<label for="numero" id="labelNumero">Numero</label> <input
						type="number" class="form-control" id="numero">
				</div>

				<div class="form-group">
					<label for="scadenza" id="labelScadenza">Scadenza</label> <input
						type="month" id="scadenza" name="start" min="2021-01"
						value="2021-01">
				</div>

				<div class="form-group">
					<label for="cvv" id="labelCvv">CVV</label> <input type="number"
						class="form-control" id="cvv">
				</div>


				<div class="modal-footer d-flex justify-content-center">
					<input type="submit" class="btn btn-dark" onclick="addCard()"
						value="Aggiungi carta"></input>
				</div>
			</div>
		</div>
	</div>




	<script src="https://cdn.jsdelivr.net/npm/places.js@1.19.0"></script>
	<script>
		(function() {
			var placesAutocomplete = places({
				appId : 'pl1OSEZA1OEA',
				apiKey : '1c6ad036f754cdfb6f749b781da7b714',
				container : document.querySelector('#form-address'),
				templates : {
					value : function(suggestion) {
						return suggestion.name;
					}
				}
			}).configure({
				type : 'address'
			});
			placesAutocomplete
					.on(
							'change',
							function resultSelected(e) {
								document.querySelector('#form-address2').value = e.suggestion.administrative
										|| '';
								document.querySelector('#form-city').value = e.suggestion.city
										|| '';
								document.querySelector('#form-zip').value = e.suggestion.postcode
										|| '';
							});
		})();
	</script>







	<jsp:include page="footerMarketPlace.jsp" />
</body>
</html>