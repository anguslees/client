# Copyright 2017 The kubecfg authors
#
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.

VERSION = dev-$(shell date +%FT%T%z)

GO = go
GOFMT = gofmt

# TODO: Simplify this once ./... ignores ./vendor (go1.9)
GO_PACKAGES = ./utils/... ./pkg/... ./metadata/... ./prototype/...

test: gotest

gotest:
	$(GO) test $(GO_FLAGS) $(GO_PACKAGES)

vet:
	$(GO) vet $(GO_FLAGS) $(GO_PACKAGES)

fmt:
	$(GOFMT) -s -w $(shell $(GO) list -f '{{.Dir}}' $(GO_PACKAGES))

clean:
	# nothing to do?

.PHONY: all test clean vet fmt
