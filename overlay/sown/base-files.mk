# Figure out the containing dir of this Makefile
OVERLAY_DIR:=$(dir $(abspath $(lastword $(MAKEFILE_LIST))))

# Declare custom installation commands
define custom_install_commands
        @echo "Installing extra files from $(OVERLAY_DIR)"
        $(INSTALL_DIR) $(1)/etc
        $(INSTALL_DATA) $(OVERLAY_DIR)/files/rc.local $(1)/etc/rc.local
endef

# Append custom commands to install recipe,
# and make sure to include a newline to avoid syntax error
Package/base-files/install += $(newline)$(custom_install_commands)
