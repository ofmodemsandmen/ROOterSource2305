#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-iphone
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-iphone
  SECTION:=utils
  CATEGORY:=ROOter
   SUBMENU:=BuildSections
  DEPENDS:=+usbmuxd +libusbmuxd-utils +libimobiledevice-utils +kmod-usb-net-ipheth
  TITLE:=ROOter support w/o MWan3 for LteFix
  PKGARCH:=all
endef

define Package/build-iphone/description
  Helper scripts to enable ROOter support for LteFix
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-iphone))
