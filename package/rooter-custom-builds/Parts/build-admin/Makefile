#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=build-admin
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/build-admin
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=BuildSections
  DEPENDS:=+extramenu +ext-domain +ext-blockport +ext-blacklist
  TITLE:=Administration packages
  PKGARCH:=all
endef

define Package/build-admin/description
  Administration packages
endef


define Build/Compile
endef

$(eval $(call BuildPackage,build-admin))
