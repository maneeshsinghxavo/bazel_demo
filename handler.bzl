def handle_linkopts(name, tag_name, opts):
    tag_value = "-nostdlib"
    print("{} , {},{} , {}".format(name, tag_name, opts, tag_value))

    is_stdlib_found = [flag for flag in opts if flag in tag_value]

    if is_stdlib_found:
        value = "nostdlib"
        print(" qnx safety build violation detected: target: {}, tag {} , value {}".format(name, tag_name, tag_value))

def handle_copts(name, tag_name, opts):
    tag_value = "-nostdinc"
    is_stdinc_found = [flag for flag in opts if flag in tag_value]

    if is_stdinc_found:
        value = "nostdinc"
        print(" qnx safety build violation detected: tag {} , value {}".format(name, tag_name, tag_value))
