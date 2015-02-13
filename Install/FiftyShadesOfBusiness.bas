Attribute VB_Name = "FiftyShadesOfBusiness"
Public Function Initialize() As String
 On Error GoTo Errorhandler
    
    Dim fiftyShadesOfBusinessXML As String
    Dim procGetFiftyShadesOfBusiness As LDE.Procedure
    Set procGetFiftyShadesOfBusiness = Application.Database.Procedures.Lookup("csp_getLastHistory", lkLookupProcedureByName)
    
    procGetFiftyShadesOfBusiness.Parameters("@@lang").InputValue = Database.Locale
    procGetFiftyShadesOfBusiness.Parameters("@@idcompany").InputValue = ActiveInspector.Record.ID
    
    Call procGetFiftyShadesOfBusiness.Execute(False)
    
    fiftyShadesOfBusinessXML = procGetFiftyShadesOfBusiness.result
    
    Initialize = fiftyShadesOfBusinessXML

Exit Function
Errorhandler:
    UI.ShowError ("FiftyShadesOfBusiness.Initialize")
End Function
