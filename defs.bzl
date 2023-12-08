load(":handler.bzl", "handle_copts", "handle_linkopts")
load(":parse_args.bzl", "parse_args")

# Copyright 2018 The Bazel Authors. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

"""Starlark rules for building C++ projects."""

_MIGRATION_TAG = "__CC_RULES_MIGRATION_DO_NOT_USE_WILL_BREAK__"

def _process_copts(attrs):
    """
    _process_copts provides central rule to process copts.

    Args:
    **attrs: Rule attributes
    """

    #    if "copts" in attrs.keys():
    #        fail("%s are using copts" % attrs["name"])
    if ("is_sema" in attrs.keys() and not "code_is_pure_c" in attrs.keys()) or (not "is_sema" in attrs.keys() and "code_is_pure_c" in attrs.keys()):
        fail("something wrong with passed params. check if both is_sema and code_is_pure_c are present for target name {}".format(attrs["name"]))

    if "is_sema" in attrs.keys() and "code_is_pure_c" in attrs.keys():
        is_sema = attrs["is_sema"]

        if not is_sema:
            fail("something wrong with passed params")

    print("before " + str(attrs))
    attrs = {key: value for key, value in attrs.items() if key != "copts"}
    print("after " + str(attrs))
    return attrs

def _add_tags(attrs):
    if "tags" in attrs and attrs["tags"] != None:
        attrs["tags"] = attrs["tags"] + [_MIGRATION_TAG]
    else:
        attrs["tags"] = [_MIGRATION_TAG]
    return attrs

def add_aditional_copts(**attrs):
    addtional_copts = [
        #
        #
        #
        #
        # "-nostdinc",
    ]
    return addtional_copts

def cc_binary(**attrs):
    """Bazel cc_binary rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_binary

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    #attrs = _process_copts(attrs)
    #    COPTS = [
    #        "-std=c++14",
    #    ]
    #
    #    _copts = COPTS + add_aditional_copts(**attrs)
    #    print(_copts)
    #    copts = {"copts": _copts}
    #
    #attrs = _process_copts(attrs)
    native.cc_binary(**attrs)

def cc_test(**attrs):
    """Bazel cc_test rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_test

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.cc_test(**_add_tags(attrs))

def cc_library(**attrs):
    """Bazel cc_library rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_library

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    #    attrs = _process_copts(attrs)
    native.cc_library(**attrs)

def cc_import(**attrs):
    """Bazel cc_import rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_import

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.cc_import(**_add_tags(attrs))

def cc_proto_library(**attrs):
    """Bazel cc_proto_library rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_proto_library

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.cc_proto_library(**_add_tags(attrs))

def fdo_prefetch_hints(**attrs):
    """Bazel fdo_prefetch_hints rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#fdo_prefetch_hints

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.fdo_prefetch_hints(**_add_tags(attrs))

def fdo_profile(**attrs):
    """Bazel fdo_profile rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#fdo_profile

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.fdo_profile(**_add_tags(attrs))

def cc_toolchain(**attrs):
    """Bazel cc_toolchain rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_toolchain

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.cc_toolchain(**_add_tags(attrs))

def cc_toolchain_suite(**attrs):
    """Bazel cc_toolchain_suite rule.

    https://docs.bazel.build/versions/master/be/c-cpp.html#cc_toolchain_suite

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.cc_toolchain_suite(**_add_tags(attrs))

def objc_library(**attrs):
    """Bazel objc_library rule.

    https://docs.bazel.build/versions/master/be/objective-c.html#objc_library

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.objc_library(**_add_tags(attrs))

def objc_import(**attrs):
    """Bazel objc_import rule.

    https://docs.bazel.build/versions/master/be/objective-c.html#objc_import

    Args:
      **attrs: Rule attributes
    """

    # buildifier: disable=native-cc
    parse_args(**attrs)
    native.objc_import(**(attrs))
