load("@project//:defs.bzl", "cc_binary", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "hello-greet",
    srcs = ["hello-greet.cc"],
    hdrs = [
        "hello-greet.h",
    ],
    visibility = ["//visibility:public"],
)

cc_binary(
    name = "hello-world",
    srcs = ["hello-world.cc"],
    #    copts = [
    #        "-nostdinc",
    #        "-std=c++11",
    #    ],
    deps = [
        ":hello-greet",
        "//lib:hello-time",
        "//lib:hello-time2",
    ],
)
