IMPORT util

FUNCTION clear(fieldname)
DEFINE fieldname STRING
DEFINE result STRING

    CALL ui.Interface.frontCall("webcomponent","call",[fieldname,"signaturePadClear"],[result])
END FUNCTION

FUNCTION is_empty(fieldname)
DEFINE fieldname STRING
DEFINE result STRING

    CALL ui.Interface.frontCall("webcomponent","call",[fieldname,"signaturePadEmpty"],[result])
    RETURN (result="true")
END FUNCTION

FUNCTION save(fieldname, filename)
DEFINE fieldname STRING
DEFINE filename STRING

DEFINE result STRING

    TRY
        CALL ui.Interface.frontCall("webcomponent","call",[fieldname,"signaturePadSave"],[result])
        CALL util.Strings.base64Decode(result.subString(23,result.getLength()),filename)
        #DISPLAY result
    CATCH
        CALL ERRORLOG(SFMT("ERROR: wc_signature: Unable to save signature to file :%1:%2", SQLCA.sqlcode, SQLCA.sqlerrm))
        RETURN FALSE
    END TRY
    RETURN TRUE
END FUNCTION
