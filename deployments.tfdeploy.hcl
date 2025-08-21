# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  import = true
  inputs = {
    prefix           = "simple"
    instances        = 1
  }
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
}
