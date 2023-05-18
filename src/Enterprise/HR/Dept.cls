 
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
        
        ASSIGN 
            DeptName    = pDeptName   
            DeptCode    = pDeptCode   
            ExpenseCode = pExpenseCode.
        
    END CONSTRUCTOR.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC VOID AddEmployee(INPUT pEmployee AS Emp):

        CREATE ttEmployee.
        ASSIGN 
            ttEmployee.EmpRef    = pEmployee
            ttEmployee.FirstName = pEmployee:FirstName
            ttEmployee.LastName  = pEmployee:LastName.
        
        NumEmployees = NumEmployees + 1.
            
        RETURN.

    END METHOD.
    
    METHOD PUBLIC VOID AddEmployee(INPUT pFirstName     AS CHARACTER,
                                   INPUT pLastName      AS CHARACTER,
                                   INPUT pJobTitle      AS CHARACTER,
                                   INPUT pEmpNum        AS INTEGER,
                                   INPUT pVacationHours AS INTEGER,
                                   INPUT pAddress       AS CHARACTER,
                                   INPUT pPostalCode    AS CHARACTER,
                                   INPUT pPhones        AS CHARACTER EXTENT 3):
        
        DEFINE VARIABLE Empl AS Emp NO-UNDO.

        Empl = NEW Emp().     
        Empl:Initialize(pFirstName, pLastName, pJobTitle, pEmpNum, pVacationHours, pAddress, pPostalCode, pPhones).
        
        CREATE ttEmployee.
        ASSIGN 
            ttEmployee.EmpRef    = Empl
            ttEmployee.FirstName = Empl:FirstName
            ttEmployee.LastName  = Empl:LastName.
        
        NumEmployees = NumEmployees + 1.
            
        RETURN.

    END METHOD.

    /*------------------------------------------------------------------------------
     Purpose:
     Notes:
    ------------------------------------------------------------------------------*/

    METHOD PUBLIC Emp GetEmployee(INPUT pFirstName     AS CHARACTER,
                                  INPUT pLastName      AS CHARACTER):
        
        DEFINE VARIABLE EmpRef AS Emp NO-UNDO.
        
        FIND FIRST ttEmployee NO-LOCK
             WHERE ttEmployee.FirstName = pFirstName
               AND ttEmployee.LastName  = pLastName 
             NO-ERROR.
        
        IF AVAILABLE ttEmployee 
        THEN 
            EmpRef = CAST (ttEmployee.EmpRef, Emp).
        ELSE 
            EmpRef = ?.
            
        RETURN EmpRef.

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
        FOR EACH ttEmployee:
            DELETE OBJECT CAST(ttEmployee.EmpRef, Emp).
            DELETE ttEmployee.
        END.
    END DESTRUCTOR.

END CLASS.