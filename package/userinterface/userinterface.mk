USERINTERFACE_VERSION = 1e19b54afce198cdba366681a4a7d696eb955c11
USERINTERFACE_SITE = https://codeberg.org/48554e6d/commui.git
USERINTERFACE_SITE_METHOD = git
USERINTERFACE_DEPENDENCIES = qt5base qt5quickcontrols2
USERINTERFACE_PREFIX = $(TARGET_DIR)/usr

MYQMAKE = $(TOPDIR)/output/host/usr/bin/qmake

define USERINTERFACE_CONFIGURE_CMDS
	(cd $(@D) && $(MYQMAKE) -r PREFIX=$(USERINTERFACE_PREFIX))
endef

define USERINTERFACE_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define USERINTERFACE_INSTALL_TARGET_CMDS
        (cd $(@D); cp qt-widget-thirdtake $(USERINTERFACE_PREFIX)/bin)

endef

$(eval $(generic-package))
