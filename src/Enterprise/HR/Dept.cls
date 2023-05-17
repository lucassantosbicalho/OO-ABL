 
 /*------------------------------------------------------------------------
    File        : Dept
    Purpose     : The Dept class creates each of the Emp objects and populates the ttEmployee temp-table that represents the employees for the department.
    Syntax      : 
    Description : 
    Author(s)   : Lucas Bicalho
    Created     : Wed May 17 05:57:34 BRT 2023
    Notes       : 
  ----------------------------------------------------------------------*/

USING Progress.Lang.*.
USING Enterprise.HR.Emp.

BLOCK-LEVEL ON ERROR UNDO, THROW.

CLASS Enterprise.HR.Dept: 
    
    {include/ttEmployee.i &ClassAccess = "private"}
    
    DEFINE PUBLIC PROPERTY DeptName AS CHARACTER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY DeptCode AS CHARACTER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY ExpenseCode AS CHARACTER NO-UNDO 
    GET.
    PRIVATE SET. 

    DEFINE PUBLIC PROPERTY NumEmployees AS INTEGER NO-UNDO 
    GET.
    PRIVATE SET. 

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/
 
    CONSTRUCTOR PUBLIC Dept (INPUT pDeptName    AS CHARACTER,
                             INPUT pDeptCode    AS CHARACTER,
                             INPUT pExpenseCode AS CHARACTER):
        SUPER ().
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID AddEmployee(INPUT pEmployee AS Emp):
        
        RETURN.

    END METHOD.
    
    METHOD PUBLIC VOID AddEmployee(INPUT FirstName     AS CHARACTER,
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

    METHOD PUBLIC Emp GetEmployee(INPUT FirstName     AS CHARACTER,
                                  INPUT LastName      AS CHARACTER):
        
        RETURN ?.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID GetEmployees(  ):
        DEFINE OUTPUT PARAM TABLE FOR ttEmployee.
        
        RETURN.

    END METHOD.
    
    DESTRUCTOR PUBLIC Dept ( ):

    END DESTRUCTOR.

END CLASS.