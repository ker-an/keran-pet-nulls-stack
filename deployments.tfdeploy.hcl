# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

deployment "simple" {
  # import = true
  inputs = {
    prefix           = "simple"
    instances        = 2
  }
  deployment_group = deployment_group.simple
}

deployment "complex" {
  inputs = {
    prefix           = "complex"
    instances        = 4
  }
  deployment_group = deployment_group.complex
}

deployment "semi-complex" {
  inputs = {
    prefix           = "complex"
    instances        = 3
  }
  deployment_group = deployment_group.complex
}

deployment_group "simple" {
  auto_approve_checks = [deployment_auto_approve.no_destroy]
}

deployment_group "complex" {}

deployment_auto_approve "no_destroy" {
  check {
    condition = context.plan.changes.remove == 0
    reason    = "Plan removes ${context.plan.changes.remove} resources."
  }
}
