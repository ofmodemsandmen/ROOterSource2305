#Owned by DairyMan@Whirlpool
#
#Copyright GNU act.
include $(TOPDIR)/rules.mk

PKG_NAME:=mt300nv2
PKG_VERSION:=1.000
PKG_RELEASE:=1

PKG_MAINTAINER:=Created by DM/makefile by Cobia@whirlpool
include $(INCLUDE_DIR)/package.mk

define Package/mt300nv2
  SECTION:=utils
  CATEGORY:=ROOter
  SUBMENU:=Router Specific
  TITLE:=Install scripts for mt300nv2
  PKGARCH:=all
endef

define Package/mt300nv2/description
  Helper scripts to install scripts for mt300nv2
endef


define Build/Compile
endef

define Package/mt300nv2/install
	$(CP) ./files/* $(1)/


endef

$(eval $(call BuildPackage,mt300nv2))
