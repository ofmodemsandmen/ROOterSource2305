#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=wg1602
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/wg1602
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Router Specific
  TITLE:=Install scripts for WG1602
  PKGARCH:=all
endef

define Package/wg1602/description
  Helper scripts to install scripts for WG1602
endef


define Build/Compile
endef

define Package/wg1602/install
	$(CP) ./files/* $(1)/
endef

$(eval $(call BuildPackage,wg1602))
