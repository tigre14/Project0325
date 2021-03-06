<%--
  Created by IntelliJ IDEA.
  User: timothygreene
  Date: 10/22/20
  Time: 8:03 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <style>
    h1 {
      font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-size: 24px; font-style: normal; font-variant: normal; font-weight: bold; line-height: 26px;
      color: dodgerblue;
    }


  </style>
  <title>Assurance</title>
</head>
<body>
<div align="center">
  <h1>Assurance</h1>
  <h2>The Assurance App is meant to Assure you in every purchase. </h2>
  <h3>We verify whether or not the party you are purchasing from has upheld their end</h3>
  <h3>We hold your money until they do or your money is refunded</h3>
  <div id="smart-button-container">
    <div style="text-align: center"><label for="description">Description of request: </label><input type="text" name="descriptionInput" id="description" maxlength="127" value=""></div>
    <p id="descriptionError" style="visibility: hidden; color:red; text-align: center;">Please enter a description</p>
    <div style="text-align: center"><label for="amount">Amount: </label><input name="amountInput" type="number" id="amount" value="" ><span> USD</span></div>
    <p id="priceLabelError" style="visibility: hidden; color:red; text-align: center;">Please enter a price</p>
    <div id="invoiceidDiv" style="text-align: center; display: none;"><label for="invoiceid">Request ID: </label><input name="invoiceid" maxlength="127" type="text" id="invoiceid" value="" ></div>
    <p id="invoiceidError" style="visibility: hidden; color:red; text-align: center;">Please enter an Invoice ID</p>
    <div style="text-align: center; margin-top: 0.625rem;" id="paypal-button-container"></div>
  </div>
  <script src="https://www.paypal.com/sdk/js?client-id=sb&currency=USD" data-sdk-integration-source="button-factory"></script>
  <script>
    function initPayPalButton() {
      var description = document.querySelector('#smart-button-container #description');
      var amount = document.querySelector('#smart-button-container #amount');
      var descriptionError = document.querySelector('#smart-button-container #descriptionError');
      var priceError = document.querySelector('#smart-button-container #priceLabelError');
      var invoiceid = document.querySelector('#smart-button-container #invoiceid');
      var invoiceidError = document.querySelector('#smart-button-container #invoiceidError');
      var invoiceidDiv = document.querySelector('#smart-button-container #invoiceidDiv');

      var elArr = [description, amount];

      if (invoiceidDiv.firstChild.innerHTML.length > 1) {
        invoiceidDiv.style.display = "block";
      }

      var purchase_units = [];
      purchase_units[0] = {};
      purchase_units[0].amount = {};

      function validate(event) {
        return event.value.length > 0;
      }

      paypal.Buttons({
        style: {
          color: 'blue',
          shape: 'rect',
          label: 'checkout',
          layout: 'vertical',

        },

        onInit: function (data, actions) {
          actions.disable();

          if(invoiceidDiv.style.display === "block") {
            elArr.push(invoiceid);
          }

          elArr.forEach(function (item) {
            item.addEventListener('keyup', function (event) {
              var result = elArr.every(validate);
              if (result) {
                actions.enable();
              } else {
                actions.disable();
              }
            });
          });
        },

        onClick: function () {
          if (description.value.length < 1) {
            descriptionError.style.visibility = "visible";
          } else {
            descriptionError.style.visibility = "hidden";
          }

          if (amount.value.length < 1) {
            priceError.style.visibility = "visible";
          } else {
            priceError.style.visibility = "hidden";
          }

          if (invoiceid.value.length < 1 && invoiceidDiv.style.display === "block") {
            invoiceidError.style.visibility = "visible";
          } else {
            invoiceidError.style.visibility = "hidden";
          }

          purchase_units[0].description = description.value;
          purchase_units[0].amount.value = amount.value;

          if(invoiceid.value !== '') {
            purchase_units[0].invoice_id = invoiceid.value;
          }
        },

        createOrder: function (data, actions) {
          return actions.order.create({
            purchase_units: purchase_units,
          });
        },

        onApprove: function (data, actions) {
          return actions.order.capture().then(function (details) {
            alert('Transaction completed by ' + details.payer.name.given_name + '!');
          });
        },

        onError: function (err) {
          console.log(err);
        }
      }).render('#paypal-button-container');
    }
    initPayPalButton();
  </script>



</div>
</body>
</html>
