if exists("loaded_errormarker")
    let &errorformat="%f:%l: %t%*[^:]:%m," . &errorformat
    let &errorformat="%f:%l:%c: %t%*[^:]:%m," . &errorformat
    let errormarker_warningtypes = "wW"
    sign define errormarker_error text=EE linehl=Error
endif
