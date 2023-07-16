#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=luci-app-openwisp
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/luci-app-openwisp
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Optional Applications
  DEPENDS:=+ext-openwisp
  TITLE:=LuCI support for OpenWISP
  PKGARCH:=all
endef

define Package/luci-app-openwisp/description
  Helper scripts to install LuCI support for OpenWISP
endef


define Build/Compile
endef

define Package/luci-app-openwisp/install
	$(CP) ./files/* $(1)/


endef

$(eval $(call BuildPackage,luci-app-openwisp))
