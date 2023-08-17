#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=z8102
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/z8102
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Router Specific
  TITLE:=Install scripts for z8102
  PKGARCH:=all
endef

define Package/z8102/description
  Helper scripts to install scripts for z8102
endef


define Build/Compile
endef

define Package/z8102/install
	$(CP) ./files/* $(1)/


endef

$(eval $(call BuildPackage,z8102))
