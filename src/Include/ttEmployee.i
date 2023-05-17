
/*------------------------------------------------------------------------
    File        : ttEmployee.i
    Purpose     : 

    Syntax      :

    Description : 

    Author(s)   : Lucas Bicalho
    Created     : Wed May 17 05:50:50 BRT 2023
    Notes       :
  ----------------------------------------------------------------------*/

/* ***************************  Definitions  ************************** */


/* ********************  Preprocessor Definitions  ******************** */


/* ***************************  Main Block  *************************** */
DEFINE {&ClassAccess} TEMP-TABLE ttEmployee NO-UNDO
    FIELD FirstName              AS CHARACTER
    FIELD LastName               AS CHARACTER
    FIELD EmpRef                 AS Progress.Lang.Object
    INDEX idxLastName IS WORD-INDEX LastName. 