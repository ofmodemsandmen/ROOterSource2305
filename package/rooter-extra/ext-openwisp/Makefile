#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-openwisp
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-openwisp
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Optional Applications
  DEPENDS:=+libc +curl +lua +libuci-lua +luafilesystem +luci-lib-nixio \
  +ca-certificates +lua-cjson +rpcd +rpcd-mod-iwinfo
  TITLE:=Openwisp
  PKGARCH:=all
endef

define Package/ext-openwisp/description
  Helper scripts to install openwisp
endef


define Build/Compile
endef

define Package/ext-openwisp/install
	$(CP) ./files/* $(1)/


endef

$(eval $(call BuildPackage,ext-openwisp))
