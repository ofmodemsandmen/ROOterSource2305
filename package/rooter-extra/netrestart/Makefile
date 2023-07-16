#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=netrestart
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/netrestart
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Optional Applications
  TITLE:=support for timed modem restart
  PKGARCH:=all
endef

define Package/netrestart/description
  Helper scripts to enable timed modem restart
endef


define Build/Compile
endef

define Package/netrestart/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,netrestart))
