/*Autolookup.qml
 ---------------
 Get some SW/OS pairs. Export your findings to a text file, if you want.
 
 --Thurask*/

import bb.cascades 1.3
import bb.system 1.2
import qt.timer 1.0

Page {
    property bool scanning: false
    property bool silentmode
    attachedObjects: [
        QTimer{
            id: timer
            interval: 500
            onTimeout: {
                _swlookup.softwareReleaseChanged.connect(timer.lookup());
                _swlookup.post(autolookup_input.text);                
            }
            function lookup() {
                if (silentmode == false){
                    outputtext.text = outputtext.text + ("OS " + autolookup_input.text + " - " + (_swlookup.softwareRelease().indexOf("SR") != -1 ? "" : "SR ") + _swlookup.softwareRelease() + "\n");
                }
                if (silentmode == true){
                    if (_swlookup.softwareRelease().indexOf(".") != -1){
                        outputtext.text = outputtext.text + ("OS " + autolookup_input.text + " - SR " + _swlookup.softwareRelease() + "\n");
                    }
                }
                autolookup_input.text = _swlookup.lookupIncrement(autolookup_input.text);
                if (timer.active == false){
                    timer.start();
                }
            }
        },
        SystemToast {
            id: lookupexporttoast
            body: ""
            button.enabled: false
            button.label: ""
            onFinished: {
                if (lookupexporttoast.result == SystemUiResult.ButtonSelection){
                    outputtext.setText(outputtext.storedtext);
                }
            }
        },
        Invocation {
            id: myQuery
            query {
                mimeType: "text/plain"
                data: outputtext.text
                invokeActionId: "bb.action.SHARE"
                onQueryChanged: {
                    myQuery.query.updateQuery()
                }
            }
        }
    ]
    Container {
        Header {
            title: qsTr("Input") + Retranslate.onLanguageChanged
        }
        Container {
            topPadding: 20.0
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Label {
                text: qsTr("OS Version:") + Retranslate.onLanguageChanged
                verticalAlignment: VerticalAlignment.Center
            }
            TextField {
                id: autolookup_input
                verticalAlignment: VerticalAlignment.Center
                enabled: (scanning == false)
                onTextChanging: {
                    _swlookup.post(autolookup_input.text, serverdropdown.selectedValue);
                }
                onTextChanged: {
                    _swlookup.post(autolookup_input.text, serverdropdown.selectedValue);
                }
                hintText: qsTr("Enter OS version") + Retranslate.onLanguageChanged
                validator: Validator {
                    id: validator
                    mode: ValidationMode.Immediate
                    onValidate: {
                        var regex = RegExp(/\b\d{1,4}\.\d{1,4}\.\d{1,4}\.\d{1,4}\b/)
                        if (regex.test(autolookup_input.text) == true) {
                            validator.setValid(true);
                        }
                        else {
                            validator.setValid(false);
                        }
                    }
                }
            }
        }
        Label {
            text: qsTr("If you get duplicate readings, raise the interval.") + Retranslate.onLanguageChanged
            horizontalAlignment: HorizontalAlignment.Center
        }
        DropDown {
            id: serverdropdown
            title: qsTr("Server") + Retranslate.onLanguageChanged
            enabled: (scanning == false)
            Option {
                id: main
                text: "Main"
                value: "https://cs.sl.blackberry.com/cse/srVersionLookup/2.0.0/"
                selected: true
            }
            Option {
                id: beta
                text: "Beta"
                value: "https://beta.sl.eval.blackberry.com/slscse/srVersionLookup/2.0.0/"
            }
            Option {
                id: beta2
                text: "Beta 2"
                value: "https://beta2.sl.eval.blackberry.com/slscse/srVersionLookup/2.0.0/"
            }
            Option {
                id: alpha
                text: "Alpha"
                value: "https://alpha.sl.eval.blackberry.com/slscse/srVersionLookup/2.0.0/"
            }
            Option {
                id: alpha2
                text: "Alpha 2"
                value: "https://alpha2.sl.eval.blackberry.com/slscse/srVersionLookup/2.0.0/"
            }
        }
        DropDown {
            id: timeoutdropdown
            title: qsTr("Lookup Interval") + Retranslate.onLanguageChanged
            enabled: (scanning == false)
            Option {
                id: quartersecond
                text: qsTr("250 ms") + Retranslate.onLanguageChanged
                value: 250
                enabled: (serverdropdown.selectedIndex == 0) //Fast lookup only works for prod, oddly enough
            }
            Option {
                id: halfsecond
                text: qsTr("500 ms") + Retranslate.onLanguageChanged
                value: 500
                selected: true
            }
            Option {
                id: threequartersecond
                text: qsTr("750 ms") + Retranslate.onLanguageChanged
                value: 750
            }
            Option {
                id: fullsecond
                text: qsTr("1000 ms") + Retranslate.onLanguageChanged
                value: 1000
            }
            onSelectedOptionChanged: {
                timer.interval = timeoutdropdown.selectedValue;
            }
        }
        Container {
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            Label {
                text: qsTr("Only show releases?") + Retranslate.onLanguageChanged
                verticalAlignment: VerticalAlignment.Center
            }
            ToggleButton {
                id: silentbutton
                onCheckedChanged: {
                    if (checked){
                        silentmode = true
                    }
                    else {
                        silentmode = false
                    }
                }
            }
        }
        Container {
            topPadding: 10.0
            layout: StackLayout {
                orientation: LayoutOrientation.LeftToRight
            }
            horizontalAlignment: HorizontalAlignment.Center
            Button {
                id: autolookupbutton
                text: qsTr("Start") + Retranslate.onLanguageChanged
                onClicked: {
                    if (validator.valid == false){
                        autolookup_input.text = qsTr("Please input a valid OS version") + Retranslate.onLanguageChanged;
                    }
                    else {
                        if (scanning == false) {
                            scanning = true;
                            autolookupbutton.text = qsTr("Stop") + Retranslate.onLanguageChanged
                            _swlookup.softwareReleaseChanged.connect(timer.lookup())
                            _swlookup.post(autolookup_input.text, serverdropdown.selectedValue);
                        }
                        else {
                            scanning = false;
                            autolookupbutton.text = qsTr("Start") + Retranslate.onLanguageChanged
                            timer.stop();
                        }
                    }
                }
            }
            Button {
                id: autoclearbutton
                text: qsTr("Clear") + Retranslate.onLanguageChanged
                enabled: (scanning == false)
                onClicked: {
                    outputtext.storedtext = outputtext.text;
                    outputtext.text = "";
                    lookupexporttoast.body = qsTr("Cleared") + Retranslate.onLanguageChanged;
                    lookupexporttoast.button.enabled = true;
                    lookupexporttoast.button.label = qsTr("Undo") + Retranslate.onLanguageChanged;
                    lookupexporttoast.show();
                }
            }
            Button {
                id: autosharebutton
                text: qsTr("Share") + Retranslate.onLanguageChanged
                enabled: (scanning == false)
                onClicked: {
                    myQuery.trigger(myQuery.query.invokeActionId)
                }
            }
            Button {
                id: autoexportbutton
                text: qsTr("Export") + Retranslate.onLanguageChanged
                enabled: (scanning == false)
                onClicked: {
                    _manager.saveTextFile(outputtext.text, "Lookup-" + (serverdropdown.selectedOption));
                    lookupexporttoast.body = qsTr("Lookups saved to default directory") + Retranslate.onLanguageChanged;
                    lookupexporttoast.button.enabled = false;
                    lookupexporttoast.button.label = "";
                    lookupexporttoast.show();
                }
            }
        }
        Header {
            title: "Results"
        }
        Container {
            ScrollView {
                scrollViewProperties.scrollMode: ScrollMode.Vertical
                scrollViewProperties.pinchToZoomEnabled: false
                scrollViewProperties.overScrollEffectMode: OverScrollEffectMode.None
                TextArea {
                    property string storedtext
                    text: ""
                    editable: false
                    id: outputtext
                    textFormat: TextFormat.Plain
                    content.flags: TextContentFlag.ActiveTextOff
                }
            }
        }
    }
}
