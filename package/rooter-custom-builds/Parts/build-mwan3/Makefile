#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-mwan3
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-mwan3
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+luci-app-mwan3 +luci-app-dnsmasq-ipset
  TITLE:=Load Balancing packages
  PKGARCH:=all
endef

define Package/build-mwan3/description
  Load Balancing packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-mwan3))
