 
 /*------------------------------------------------------------------------
    File        : Emp
    Purpose     : Data and functionality for an employee
    Syntax      : 
    Description : 
    Author(s)   : Lucas Bicalho
    Created     : Wed May 17 05:30:38 BRT 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Enterprise.HR.Emp: 
    
    
    DEFINE PUBLIC PROPERTY FirstName AS CHARACTER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY LastName AS CHARACTER NO-UNDO 
    GET.
    PRIVATE SET.     

    DEFINE PUBLIC PROPERTY JobTitle AS CHARACTER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY EmpNum AS INTEGER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY VacationHours AS INTEGER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY Address AS CHARACTER NO-UNDO 
    GET.
    SET. 

    DEFINE PUBLIC PROPERTY PostalCode AS CHARACTER NO-UNDO 
    GET.
    SET.

    DEFINE PUBLIC PROPERTY Phones AS CHARACTER EXTENT 3 NO-UNDO 
    GET(INPUT idx AS INTEGER):
         RETURN Phones[idx].
    END GET.
    SET(INPUT arg AS CHARACTER, INPUT idx AS INTEGER):
        Phones[idx] = arg.        
    END SET.
          
    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    CONSTRUCTOR PUBLIC Emp (  ):
        SUPER ().
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID Initialize(INPUT pFirstName     AS CHARACTER,
                                  INPUT pLastName      AS CHARACTER,
                                  INPUT pJobTitle      AS CHARACTER,
                                  INPUT pEmpNum        AS INTEGER,
                                  INPUT pVacationHours AS INTEGER,
                                  INPUT pAddress       AS CHARACTER,
                                  INPUT pPostalCode    AS CHARACTER,
                                  INPUT pPhones        AS CHARACTER EXTENT 3):
        
        ASSIGN  
            FirstName     = pFirstName    
            LastName      = pLastName     
            JobTitle      = pJobTitle     
            EmpNum        = pEmpNum       
            VacationHours = pVacationHours
            Address       = pAddress      
            PostalCode    = pPostalCode   
            Phones        = pPhones.       
        
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID SetVacationHours( INPUT pVacationHours AS INTEGER ):
        
        ASSIGN 
            VacationHours = pVacationHours.
            
        RETURN.

    END METHOD.
    
    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID SetJobTitle( INPUT pJobTitle AS CHARACTER ):
        
        ASSIGN 
            JobTitle = pJobTitle.
            
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC CHARACTER GetInfo(  ):
        
        DEFINE VARIABLE result AS CHARACTER NO-UNDO.
        
        ASSIGN 
            result = SUBSTITUTE("&1# Employee Information &7&1  Name: &2.&1  Job title: &3.&1  Adress: &4.&1  Postal Code: &5.&1  Vacation hours: &6.&1  EmpNum: &7.&1  Phones: &8.&1&1",
                                CHR(10),
                                GetName(),
                                JobTitle,
                                Address,
                                PostalCode,
                                VacationHours,
                                EmpNum,
                                SUBSTITUTE("&1, &2, &3", Phones[1], Phones[2], Phones[3])). 
        RETURN result.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC CHARACTER GetName(  ):
        
        DEFINE VARIABLE result AS CHARACTER NO-UNDO.
        
        ASSIGN 
            result = SUBSTITUTE("&1 &2",
                                FirstName,
                                LastName).
        RETURN result.

    END METHOD.

END CLASS.