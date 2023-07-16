#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-simpin
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-simpin
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Optional Applications
  TITLE:=support for SIM Pin Setting
  PKGARCH:=all
endef

define Package/ext-simpin/description
  Helper scripts to enable SIM Pin Setting
endef


define Build/Compile
endef

define Package/ext-simpin/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,ext-simpin))
