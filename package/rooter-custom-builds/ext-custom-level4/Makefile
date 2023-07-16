#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-custom-level4
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-custom-level4
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=CustomBuilds
  DEPENDS:=+ext-custom-basic +ext-wireguard +build-themes +bwallocate +ext-zerotier +build-usb
  TITLE:=Level4 Build packages
  PKGARCH:=all
endef

define Package/ext-custom-level4/description
  Level4 Build packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,ext-custom-level4))
