project( kcm_mobile_time )

#include_directories(../../../../components/settings)

#configure_file(config.h.cmake ${CMAKE_CURRENT_BINARY_DIR}/config.h )


set(timesettings_SRCS
    timesettings.cpp
    timezone.cpp
    timezonesmodel.cpp
)

qt5_add_dbus_interface(timesettings_SRCS ${CMAKE_CURRENT_SOURCE_DIR}/timedated1.xml timedated_interface)

add_library(kcm_mobile_time MODULE ${timesettings_SRCS})

target_link_libraries(kcm_mobile_time
    Qt5::Quick
    Qt5::Qml
    KF5::KDELibs4Support
    KF5::QuickAddons
    )
kcoreaddons_desktop_to_json(kcm_mobile_time "timesettings.desktop")

# Time and Date

install(FILES timesettings.desktop DESTINATION ${SERVICES_INSTALL_DIR})
install(TARGETS kcm_mobile_time DESTINATION ${PLUGIN_INSTALL_DIR}/kcms)
kpackage_install_package(package kcm_mobile_time kcms)
