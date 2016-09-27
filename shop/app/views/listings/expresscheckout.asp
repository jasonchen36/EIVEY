<%@Language="VBSCRIPT"%>
<!-- #include file ="paypalfunctions.asp" -->
<%
' ==================================
' PayPal Express Checkout Module
' ==================================

On Error Resume Next

'------------------------------------
' The paymentAmount is the total value of
' the shopping cart, that was set
' earlier in a session variable
' by the shopping cart page
'------------------------------------
SESSION("Payment_Amount") = 7.00
paymentAmount = Session("Payment_Amount")

'------------------------------------
' The currencyCodeType and paymentType
' are set to the selections made on the Integration Assistant
'------------------------------------
currencyCodeType = "USD"
paymentType = "Sale"

'------------------------------------
' The returnURL is the location where buyers return to when a
' payment has been succesfully authorized.
'
' This is set to the value entered on the Integration Assistant
'------------------------------------
returnURL = "dev.eivey.ca/shop"

'------------------------------------
' The cancelURL is the location buyers are sent to when they click the
' return to XXXX site where XXX is the merhcant store name
' during payment review on PayPal
'
' This is set to the value entered on the Integration Assistant
'------------------------------------
cancelURL = "dev.eiveyca/"

'------------------------------------
' Calls the SetExpressCheckout API call
'
' The CallShortcutExpressCheckout function is defined in the file PayPalFunctions.asp,
' it is included at the top of this file.
'-------------------------------------------------
Set resArray = CallShortcutExpressCheckout (paymentAmount, currencyCodeType, paymentType, returnURL, cancelURL)

ack = UCase(resArray("ACK"))
If ack="SUCCESS" Then
	' Redirect to paypal.com
	ReDirectURL( resArray("TOKEN") )
Else
	'Display a user friendly Error on the page using any of the following error information returned by PayPal
	ErrorCode = URLDecode( resArray("L_ERRORCODE0"))
	ErrorShortMsg = URLDecode( resArray("L_SHORTMESSAGE0"))
	ErrorLongMsg = URLDecode( resArray("L_LONGMESSAGE0"))
	ErrorSeverityCode = URLDecode( resArray("L_SEVERITYCODE0"))
End If
%>
