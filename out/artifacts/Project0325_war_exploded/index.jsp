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
      color: orange;
    }
    label{
      color: orange;
    }
    input {
      background-color: #ffb353;
      border: none;
      color: white;
      padding: 15px 15px;
      text-align: center;
      text-decoration: none;
      display: inline-block;
      font-size: 16px;
      margin: 4px 2px;
      cursor: pointer;
    }
  </style>
  <title>Parkside</title>
</head>
<body>
<div align="center">
  <h1>PRKSDE</h1>
  <img src="Hoodie1.png" alt="Dogs Will Be Dogs " width="300" height="400">

  <form action="https://www.paypal.com/cgi-bin/webscr" method="post" target="_top">
    <input type="hidden" name="cmd" value="_s-xclick">
    <input type="hidden" name="hosted_button_id" value="XZRUP8VJWBCHJ">
    <table>
      <tr><td><input type="hidden" name="on0" value="Sizes">Sizes</td></tr><tr><td><select name="os0">
      <option value="Small">Small $90.00 USD</option>
      <option value="Medium">Medium $90.00 USD</option>
      <option value="Large">Large $90.00 USD</option>
      <option value="XL">XL $90.00 USD</option>
    </select> </td></tr>
    </table>
    <input type="hidden" name="currency_code" value="USD">
    <input type="image" src="https://www.paypalobjects.com/en_US/i/btn/btn_buynow_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!">
    <img alt="" border="0" src="https://www.paypalobjects.com/en_US/i/scr/pixel.gif" width="1" height="1">
  </form>



</div>
</body>
</html>
