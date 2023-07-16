#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-openvpn
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-openvpn
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+luci-app-rootervpn +openvpn-easy-rsa +openvpn-openssl
  TITLE:=OpenVpn packages
  PKGARCH:=all
endef

define Package/build-openvpn/description
  OpenVpn packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-openvpn))
