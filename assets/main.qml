/*main.qml
 ---------
 Get the party started. Formerly the bulk of the QML, now just a bridge between separate tabs. Extensible!
 
 --Thurask*/

import bb.cascades 1.3

TabbedPane {
    attachedObjects: [
        ComponentDefinition {
            id: helpSheetDefinition
            HelpSheet {
            }
        }
    ]
    Menu.definition: MenuDefinition {
        helpAction: HelpActionItem {
            onTriggered: {
                var help = helpSheetDefinition.createObject()
                help.open();
            }
        }
        actions: [
            ActionItem {
                title: qsTr("Change Theme") + Retranslate.onLanguageChanged
                onTriggered: {
                    if (Application.themeSupport.theme.colorTheme.style == VisualStyle.Bright) {
                        Application.themeSupport.setVisualStyle(VisualStyle.Dark);
                    }
                    else {
                        Application.themeSupport.setVisualStyle(VisualStyle.Bright);
                    }
                }
            }
        ]
    }
    Tab {
        title: qsTr("OS Downloader") + Retranslate.onLanguageChanged
        delegate: Delegate {
            OSDownloader {
                id:osDownloaderPage
                titleBar: TitleBar {
                    title: qsTr("BB10 OS Downloader %1").arg(AppInfo.version)
                }
            }
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateWhenSelected
    }
    Tab {
        title: qsTr("OS Lookup Tool") + Retranslate.onLanguageChanged
        delegate: Delegate {
            AutoLookup {
                id:autoLookupPage
                titleBar: TitleBar {
                    title: qsTr("BB10 OS Downloader %1").arg(AppInfo.version)
                }
            }
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateWhenSelected
    }
    Tab {
        title: qsTr("Hash Tools") + Retranslate.onLanguageChanged
        delegate: Delegate {
            HashTools {
                id:hashToolsPage
                titleBar: TitleBar {
                    title: qsTr("BB10 OS Downloader %1").arg(AppInfo.version)
                }
            }
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateWhenSelected
    }
    Tab {
        title: qsTr("Engineering Screens") + Retranslate.onLanguageChanged
        delegate: Delegate {
            EScreens {
                id:eScreensPage
                titleBar: TitleBar {
                    title: qsTr("BB10 OS Downloader %1").arg(AppInfo.version)
                }
            }
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateImmediately
    }
    Tab {
        title: qsTr("System Info") + Retranslate.onLanguageChanged
        delegate: Delegate {
            SysInfo {
                id:sysInfoPage
                titleBar: TitleBar {
                    title: qsTr("BB10 OS Downloader %1").arg(AppInfo.version)
                }
            }
        }
        delegateActivationPolicy: TabDelegateActivationPolicy.ActivateWhenSelected
    }
}