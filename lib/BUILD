load("@project//:defs.bzl", "cc_binary", "cc_library")

package(default_visibility = ["//visibility:public"])

cc_library(
    name = "hello-time",
    srcs = ["hello-time.cc"],
    hdrs = [
        "hello-time.h",
        "hello-time2.h",
    ],
    copts = [
        #"-nostdinc",
    ],
)

cc_library(
    name = "hello-time2",
    srcs = ["hello-time.cc"],
    hdrs = [
        "hello-time.h",
        "hello-time2.h",
    ],
    copts = [
        # "-nostdinc",
    ],
)
