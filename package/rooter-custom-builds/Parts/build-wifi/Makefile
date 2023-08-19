#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-wifi
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-wifi
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+luci-app-guestwifi +luci-app-hotspot
  TITLE:=Wifi packages
  PKGARCH:=all
endef

define Package/build-wifi/description
  Wifi packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-wifi))
