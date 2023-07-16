#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-usb
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-usb
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+luci-app-ksmbd +usb-storage +ext-p910nd
  TITLE:=USB packages
  PKGARCH:=all
endef

define Package/build-usb/description
  USB packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-usb))
