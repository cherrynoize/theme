# Define directories
BASE_THEMES_DIR := base-themes
BIN_BASE_DIR := bin
WALLS_BASE_DIR := wallpaper-themes
ROFI_BASE_DIR := rofi

# Define install paths
THEMES_INSTALL_DIR := /etc/themes
BIN_INSTALL_DIR := /usr/local/bin
WALLS_INSTALL_DIR := $(THEMES_INSTALL_DIR)/wallpapers
THUMBNAILS_DIR := ~/.cache/themes/thumbnails
ROFI_INSTALL_DIR := $(THEMES_INSTALL_DIR)/rofi

# List of files to install
THEMES_FILES := $(wildcard $(BASE_THEMES_DIR)/*)
HIDDEN_THEME_FILES := $(BASE_THEMES_DIR)/.default.ini
BIN_FILES := $(wildcard $(BIN_BASE_DIR)/*)
WALL_FILES := $(wildcard $(WALLS_BASE_DIR)/*)
ROFI_FILES := $(wildcard $(ROFI_BASE_DIR)/*)

# Define targets
.PHONY: install install-bin install-themes install-rofi-styles update-bin uninstall clean

install: install-bin install-wallpapers install-themes install-rofi-styles

install-bin:
	mkdir -p $(BIN_INSTALL_DIR) || true
	chmod +x $(BIN_FILES)
	cp $(BIN_FILES) $(BIN_INSTALL_DIR)

install-wallpapers:
	mkdir -p $(WALLS_INSTALL_DIR) || true
	cp -r $(WALL_FILES) $(WALLS_INSTALL_DIR)
	chmod -R 777 $(WALLS_INSTALL_DIR)

install-themes:
	mkdir -p $(THEMES_INSTALL_DIR) || true
	cp -r $(THEMES_FILES) $(THEMES_INSTALL_DIR)
	cp -r $(HIDDEN_THEME_FILES) $(THEMES_INSTALL_DIR)

install-rofi-styles:
	mkdir -p $(ROFI_INSTALL_DIR) || true
	cp -r -n $(ROFI_FILES) $(ROFI_INSTALL_DIR)

update-bin:
	if [ ! -d $(BIN_INSTALL_DIR) ]; then \
		echo "Failed to update binaries: install dir $(BIN_INSTALL_DIR) does not exist"; \
		exit 1; \
	fi
	chmod +x $(BIN_FILES)
	cp $(BIN_FILES) $(BIN_INSTALL_DIR)

uninstall: uninstall-wallpapers uninstall-themes uninstall-binaries
clean: uninstall

uninstall-wallpapers:
	rm -rf $(foreach file,$(WALL_FILES),$(WALLS_INSTALL_DIR)/$(notdir $(file)))
	rmdir $(WALLS_INSTALL_DIR) || true
	rm -rf $(THUMBNAILS_DIR)

uninstall-themes:
	rm -rf $(foreach file,$(THEMES_FILES),$(THEMES_INSTALL_DIR)/$(notdir $(file)))
	rm -rf $(foreach file,$(HIDDEN_THEMES_FILES),$(THEMES_INSTALL_DIR)/$(notdir $(file)))
	rmdir $(THEMES_INSTALL_DIR) || true

uninstall-binaries:
	rm -f $(foreach file,$(BIN_FILES),$(BIN_INSTALL_DIR)/$(notdir $(file)))
