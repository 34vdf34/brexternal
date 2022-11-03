TELEMETRYMSG_VERSION = 88e169f2b4df41d8b87cdf37e2011050589cbae7
TELEMETRYMSG_SITE = $(call github,34vdf34,telemetrymsg,$(TELEMETRYMSG_VERSION))
TELEMETRYMSG_DEPENDENCIES = libcurl
TELEMETRYMSG_PREFIX = $(TARGET_DIR)/usr

define TELEMETRYMSG_BUILD_CMDS
     $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define TELEMETRYMSG_INSTALL_TARGET_CMDS
        (cd $(@D); cp telemetryclient telemetryserver $(TELEMETRYMSG_PREFIX)/bin)
endef

define TELEMETRYMSG_CLEAN_CMDS
        $(MAKE) $(TELEMETRYMSG_MAKE_OPTS) -C $(@D) clean
endef

$(eval $(generic-package))
