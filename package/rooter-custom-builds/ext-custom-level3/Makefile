#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-custom-level3
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-custom-level3
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=CustomBuilds
  DEPENDS:=+ext-custom-basic +luci-app-sqm +ext-wireguard +build-usb
  TITLE:=Level3 Build packages
  PKGARCH:=all
endef

define Package/ext-custom-level3/description
  Level3 Build packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,ext-custom-level3))
