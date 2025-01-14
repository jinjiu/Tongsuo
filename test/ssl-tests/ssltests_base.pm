# -*- mode: perl; -*-
# Copyright 2016-2022 The OpenSSL Project Authors. All Rights Reserved.
#
# Licensed under the Apache License 2.0 (the "License").  You may not use
# this file except in compliance with the License.  You can obtain a copy
# in the file LICENSE in the source distribution or at
# https://www.openssl.org/source/license.html

## SSL test configurations

package ssltests;

sub test_run
{
    my $dir_sep = $^O ne "VMS" ? "/" : "";
    my $ret = "\${ENV::TEST_RUNS_DIR}";

    foreach (@_) {
        $ret = $ret . $dir_sep . $_;
    }

    return $ret;
}

sub test_pem
{
    my $dir_sep = $^O ne "VMS" ? "/" : "";
    my $ret = "\${ENV::TEST_CERTS_DIR}";

    foreach (@_) {
        $ret = $ret . $dir_sep . $_;
    }

    return $ret;
}

our %base_server = (
    "Certificate" => test_pem("servercert.pem"),
    "PrivateKey"  => test_pem("serverkey.pem"),
    "CipherString" => "DEFAULT",
);

our %base_client = (
    "VerifyCAFile" => test_pem("rootcert.pem"),
    "VerifyMode" => "Peer",
    "CipherString" => "DEFAULT",
);
