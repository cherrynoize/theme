# Define directories
BASE_THEMES_DIR := base-themes
BIN_DIR := bin

# Define install paths
THEMES_INSTALL_DIR := /etc/themes
BIN_INSTALL_DIR := /usr/local/bin

# List of files to install
THEMES_FILES := $(wildcard $(BASE_THEMES_DIR)/*)
HIDDEN_THEME_FILES := $(BASE_THEMES_DIR)/.default.ini
BIN_FILES := $(wildcard $(BIN_DIR)/*)

# Define targets
.PHONY: install uninstall clean

install:
	# Install themes
	mkdir -p $(THEMES_INSTALL_DIR) || true
	cp -r $(THEMES_FILES) $(THEMES_INSTALL_DIR)
	cp -r $(HIDDEN_THEME_FILES) $(THEMES_INSTALL_DIR)
	# Install binaries
	mkdir -p $(BIN_INSTALL_DIR) || true
	chmod +x $(BIN_FILES)
	cp $(BIN_FILES) $(BIN_INSTALL_DIR)
	# Generate cached thumbnail images
	genthumbcache

uninstall:
	# Remove themes
	rm -rf $(foreach file,$(THEMES_FILES),$(THEMES_INSTALL_DIR)/$(notdir $(file)))
	rm -rf $(foreach file,$(HIDDEN_THEMES_FILES),$(THEMES_INSTALL_DIR)/$(notdir $(file)))
	rmdir $(THEMES_INSTALL_DIR) || true
	# Remove binaries
	rm -f $(foreach file,$(BIN_FILES),$(BIN_INSTALL_DIR)/$(notdir $(file)))
	rmdir $(BIN_INSTALL_DIR) || true

clean: uninstall
