cmake_minimum_required(VERSION 3.16)

project(PeaceSleep VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 REQUIRED COMPONENTS Quick)


qt_add_executable(PeaceSleep
    main.cpp
)

set_source_files_properties(ui/Globals.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)
set_source_files_properties(ui/IconSet.qml PROPERTIES QT_QML_SINGLETON_TYPE TRUE)


qt_add_qml_module(PeaceSleep
    URI PeaceSleep
    VERSION 1.0
    RESOURCES
        # app icons
        ui/assets/icons/menu.svg
    QML_FILES
        ui/Main.qml
        ui/PSideBar.qml
        ui/PDragSound.qml
        ui/PDropSound.qml
        # singleton
        ui/Globals.qml
        ui/IconSet.qml
        #PeaceSleep Component
        ui/PComponent/PButton.qml
)

set_target_properties(PeaceSleep PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER com.forsuhr.peacesleep
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(PeaceSleep
    PRIVATE Qt6::Quick
)

include(GNUInstallDirs)
install(TARGETS PeaceSleep
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
