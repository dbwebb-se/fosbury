INSTALL_DIR := /usr/local/bin

.PHONY: install
install: install-fosbury


.PHONY: update
update: install-fosbury


.PHONY: install-fosbury
install-fosbury:
	# @$(call HELPTEXT,$@)
	sudo install -m 0755 fosbury.bash $(INSTALL_DIR)/fosbury
	#@$(call CHECK_VERSION, dbwebb3, | cut -d ' ' -f 1)
