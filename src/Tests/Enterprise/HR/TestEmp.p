
/*------------------------------------------------------------------------
    File        : TestEmp.p
    Purpose     : Test Emp.cls

    Syntax      :

    Description : 

    Author(s)   : Lucas Bicalho
    Created     : Thu May 18 05:29:08 BRT 2023
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */

BLOCK-LEVEL ON ERROR UNDO, THROW.

USING Enterprise.HR.Emp.

DEFINE VARIABLE EmpInstance AS Emp                     NO-UNDO.
DEFINE VARIABLE Phones      AS CHARACTER EXTENT 3      NO-UNDO
                            INIT ["1234-5678", "1234-5679", "1234-5680"].
DEFINE VARIABLE cOutDir     AS CHARACTER               NO-UNDO
                            INIT "D:\workspace\OO-ABL\logs\".
/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
EmpInstance = NEW Emp().

OUTPUT TO VALUE(cOutDir + "testEmp.cls.out").
MESSAGE "# Emp.cls test - " TODAY STRING(TIME, "hh:mm:ss") SKIP(1).

EmpInstance:Initialize("Lucas", 
                       "Bicalho", 
                       "Developer", 
                       123, 
                       99, 
                       "Street 54, 38", 
                       "74000-000", 
                       Phones).

MESSAGE SKIP "## Test GetInfo()" SKIP.
MESSAGE EmpInstance:GetInfo() SKIP(1).
 
MESSAGE SKIP "## Test SetVacationHours(50)" SKIP.
EmpInstance:SetVacationHours(50).
MESSAGE EmpInstance:GetInfo() SKIP(1).

MESSAGE SKIP "## Test SetJobTitle('QA Tester')" SKIP.
EmpInstance:SetJobTitle("QA Tester").
MESSAGE EmpInstance:GetInfo() SKIP(1).
        
OUTPUT CLOSE.
