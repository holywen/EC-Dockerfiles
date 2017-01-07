
TAG ?= latest
EFLOW_INSTALLER ?= ElectricFlow-7.1.0.113861
EFLOW_INSTALLER_DOWNLOAD_PATH ?= electric-cloud.sharefileftp.com/products/flow/release_7.1/7.1.0.113861/linux/x86
EFLOW_DOWNLOAD_USER ?= electric-cloud%2Fswen1%40electric-cloud.com
EFLOW_DOWNLOAD_PASS ?= changeme

COMMON_TARGETS = all build push pull cleandata cleanimages clean cleanall save load
