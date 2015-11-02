IMPORT os
IMPORT FGL wc_signature

MAIN
DEFINE signature STRING 

    OPTIONS FIELD ORDER FORM
    OPTIONS INPUT WRAP
    CALL STARTLOG("signature.log")

    OPEN WINDOW signature WITH FORM "wc_signature_test" ATTRIBUTES(TEXT="Signature Input")
    INPUT BY NAME signature WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED, ACCEPT=FALSE, CANCEL=FALSE)
    
        ON ACTION clear ATTRIBUTES(TEXT="Clear Signature")
            -- clears the web component
            CALL wc_signature.clear("formonly.signature")

        ON ACTION clear_file ATTRIBUTES(TEXT="Delete Signature File")
            IF NOT os.Path.delete("signature.png") THEN
                ERROR "Error deleting signature file"
            END IF

        ON ACTION empty ATTRIBUTES(TEXT="Empty Test")
            -- Test if web component is empty
            CALL FGL_WINMESSAGE("Info",SFMT("Web component is empty result=%1",IIF(wc_signature.is_empty("formonly.signature"), "TRUE", "FALSE")),"info")
            
        ON ACTION save ATTRIBUTES(TEXT="Save")
            IF wc_signature.is_empty("formonly.signature") THEN
                ERROR "No signature has been entered"
                NEXT FIELD CURRENT
            END IF
            IF NOT wc_signature.save("formonly.signature","signature.png") THEN
                CALL FGL_WINMESSAGE("Error","Unable to save signature to file, view errorlog for details","stop")
                NEXT FIELD CURRENT
            END IF
            
        ON ACTION view ATTRIBUTES(TEXT="View")
            CALL view_signature("signature.png")
            
        ON ACTION close
            EXIT INPUT
    END INPUT
END MAIN



FUNCTION view_signature(filename)
DEFINE filename STRING

    IF NOT os.Path.exists("signature.png") THEN
        CALL FGL_WINMESSAGE("Error","No signature file has been saved", "stop")
        RETURN
    END IF
    
    -- displays the last saved signature
    OPEN WINDOW view WITH FORM "wc_signature_test_view" ATTRIBUTES(STYLE="dialog", TEXT="View Signature")
    DISPLAY filename TO img
    MENU ""
        ON ACTION close
            EXIT MENU
    END MENU
    CLOSE WINDOW view
END FUNCTION
