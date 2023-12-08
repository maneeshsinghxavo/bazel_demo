load(":handler.bzl", "handle_copts", "handle_linkopts")

def parse_args(**kwargs):

    kwargs_updated = {key: value for key, value in kwargs.items() if key != "copts"}
    kwargs.clear()

    kwargs = kwargs_updated

    name = ""
    for key, value in kwargs.items():
        if (key == "name"):
            name = value
        else:
            tag_name = "tag_name " + name + ":" + key
            #tag_value = "tag_value ".join(value)
            print("{} -----> {}".format(tag_name, value))

