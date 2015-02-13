#  50 shades of company overview #

The Company Overview app gives you a visual presentation of your customer in the actionpad.

There are three headers with different data.

**SOS** (Active tickets)
Shows total active tickets and historical overview of all tickets ever registered.

* Open
* Total amount of tickets

**Sales overview** (Active opportunities)

* The total amount of active sales opportunities based on the business status. 
* The total amount of sales opportunities total won


**History overview** (Elapsed time since last conversation)

* Total time since you've last been in contact with the customer
* Based on certain activities, like sales call, customer visit, etc.  

###Install:
Insert the SQL proceduer named **csp_getLastHistory**, **csp_getBusinessValue** and **csp_getHelpdeskData** in the database. 
Drag'n drop the fiftyshadesofbusiness.bas into your VBA project. 

Copy the 50 shades of comapny overview app folder to the apps folder in the actionpad folder.

Insert the following html tag in the actionpad where you want it to be shown, most likeley the index actionpad.

	<div data-app="{app:'fiftyshadesofbusiness'}"></div>

	