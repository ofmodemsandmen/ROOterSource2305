#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-custom-level1
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-custom-level1
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=CustomBuilds
  DEPENDS:=+ext-custom-basic +bwallocate +ext-wireguard +build-usb +ext-extra  
  TITLE:=Level1 Build packages
  PKGARCH:=all
endef

define Package/ext-custom-level1/description
  Level1 Build packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,ext-custom-level1))
