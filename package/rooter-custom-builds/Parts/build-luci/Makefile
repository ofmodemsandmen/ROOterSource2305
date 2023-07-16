#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-luci
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-luci
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+luci +luci-compat +ca-bundle +ca-certificates +libustream-wolfssl +464xlat 
  TITLE:=Luci packages
  PKGARCH:=all
endef

define Package/build-lucidescription
  Luci packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-luci))
