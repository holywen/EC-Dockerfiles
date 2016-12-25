SUB_DIRS = commanderBase commanderServer commanderAgent commanderApache commanderRepository

include settings.mk

.PHONY: subdirs $(SUBDIRS) $(COMMON_TARGETS)

$(COMMON_TARGETS):
	$(foreach DIR, $(SUB_DIRS), $(MAKE) -C $(DIR) $@;)
