 
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
    SET(INPUT arg AS CHARACTER):
                
    END SET.

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

    METHOD PUBLIC VOID Initialize(INPUT FirstName     AS CHARACTER,
                                  INPUT LastName      AS CHARACTER,
                                  INPUT JobTitle      AS CHARACTER,
                                  INPUT EmpNum        AS INTEGER,
                                  INPUT VacationHours AS INTEGER,
                                  INPUT Address       AS CHARACTER,
                                  INPUT PostalCode    AS CHARACTER,
                                  INPUT Phones        AS CHARACTER EXTENT 3):
        
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID SetVacationHours( INPUT pJobTitle AS CHARACTER ):
        
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC CHARACTER GetInfo(  ):
        
        DEFINE VARIABLE result AS CHARACTER NO-UNDO.

        RETURN result.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC CHARACTER GetName(  ):
        
        DEFINE VARIABLE result AS CHARACTER NO-UNDO.

        RETURN result.

    END METHOD.

END CLASS.