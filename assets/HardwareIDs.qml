/*HardwareIDs.qml
 ----------------
 List of hardware IDs, duh.
 
 --Thurask*/

import bb.cascades 1.3
import bb.data 1.0

Page {
    titleBar: TitleBar {
        title: qsTr("Hardware IDs") + Retranslate.onLanguageChanged
    }
    Container {
        horizontalAlignment: HorizontalAlignment.Fill
        Container {
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            Label {
                text: qsTr("Use local file") + Retranslate.onLanguageChanged
                verticalAlignment: VerticalAlignment.Center
            }
            ToggleButton {
                id: localtoggle
                verticalAlignment: VerticalAlignment.Center
                checked: true
                onCheckedChanged: {
                    if (localtoggle.checked == true) {
                        repoDataSource.source = "asset:///xml/hwid.xml";
                        repoDataSource.remote = false;
                        repoDataSource.load();
                    }
                    else {
                        repoDataSource.source = "http://thurask.github.io/hwid.xml";
                        repoDataSource.remote = true;
                        repoDataSource.load();
                    }
                }
            }
        }
        Header {
            title: (localtoggle.checked == true ? qsTr("Hardware IDs (local copy)") + Retranslate.onLanguageChanged : qsTr("Hardware IDs (network copy)") + Retranslate.onLanguageChanged)
        }
        Label {
            id: errorlabel
            text: qsTr("Could not access online file. Loading local copy.") + Retranslate.onLanguageChanged
            multiline: true
            visible: false
        }
        ListView {
            id: listView
            dataModel: repoDataModel
            listItemComponents: [
                ListItemComponent {
                    type: "header"
                },
                ListItemComponent {
                    type: "item"
                    StandardListItem {
                        title: ListItemData.id
                        description: ListItemData.name + " " + ListItemData.variant
                    }
                }
            ]
            scrollIndicatorMode: ScrollIndicatorMode.ProportionalBar
        }
    }  
    attachedObjects: [
        GroupDataModel {
            id: repoDataModel
            sortingKeys: [
            "name",
            "variant"
            ]
            sortedAscending: true
            grouping: ItemGrouping.ByFullValue
        },
        DataSource {
            id: repoDataSource
            remote: false
            source: "asset:///xml/hwid.xml"
            query: "repo/hardware"
            type: DataSourceType.Xml
            onDataLoaded: {
                errorlabel.visible = false;
                repoDataModel.clear();
                repoDataModel.insertList(data)
            }
            onError: {
                repoDataSource.source = "asset:///xml/hwid.xml";
                repoDataSource.remote = false;
                repoDataSource.load();
                errorlabel.visible = true;
            }
        }
    ]
    onCreationCompleted: {
        repoDataSource.load();
    }
}
