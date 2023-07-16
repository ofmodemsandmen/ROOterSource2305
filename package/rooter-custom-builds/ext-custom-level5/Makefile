#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=ext-custom-level5
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/ext-custom-level5
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=CustomBuilds
  DEPENDS:=+ext-custom-basic +build-themes +bwallocate +ext-zerotier \
  		+luci-app-ttyd +luci-app-acl +luci-app-ksmbd +arc-storage \
  		+luci-app-upnp
  TITLE:=Level5 Build packages
  PKGARCH:=all
endef

define Package/ext-custom-level5/description
  Level5 Build packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,ext-custom-level5))
