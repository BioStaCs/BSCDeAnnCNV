/*
 * Copyright (c) 2011-2014 BlackBerry Limited.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import bb.cascades 1.4
import  bb.system 1.2

NavigationPane {
    id: navigationPane
    
    
    Page {
        titleBar: TitleBar {
            // Localized text with the dynamic translation and locale updates support
            title: qsTr("DeAnnCnv") + Retranslate.onLocaleOrLanguageChanged
        }
        

    Container {
            id: containID1
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            layout: DockLayout {
            }
            
            ImageView {
                id: flowchart
                opacity: 1
                imageSource: "asset:///images/flow_1.png"
                horizontalAlignment:  HorizontalAlignment.Center
                accessibility.name: "flowchart"
            }
            
            TextArea {
                id: textids
                textFilter: SingleLineTextFilter {

                }
                input.submitKey: SubmitKey.EnterKey
                text: ""
                hintText: "Input your id here"
                layoutProperties: StackLayoutProperties {

                }
                verticalAlignment: VerticalAlignment.Bottom
            }
            
        }
        actions:  [ActionItem {
            id: querryaction
            title: qsTr("Query") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            imageSource: "asset:///query.png"
            
            attachedObjects: [
                SystemDialog {
                    id: queryprogress
                    body: qsTr("Query DeAnnCNV server ...")
                    confirmButton.label: qsTr("Check Result")
                    confirmButton.enabled: true
                    onFinished: {
                        myCppObject.querrystatus()
                        if (queryprogress.result != SystemUiResult.CancelButtonSelection)
                            navigationPane.push(secondPageDefinition.createObject());
                    }
                }
                
            ]

            onTriggered: {
                // A second Page is created and pushed when this action is triggered.
                //textids.text = "Value from txt ++: " + myCppObject.value
                myCppObject.getID(textids.text.toString())
                queryprogress.show();
            }
        },
        ActionItem {
            id: aboutaction
            title: qsTr("About") + Retranslate.onLocaleOrLanguageChanged
            ActionBar.placement: ActionBarPlacement.OnBar
            imageSource: "asset:///favicon.png"
            
            attachedObjects: [
                SystemDialog {
                    id: aboutdiag
                    confirmButton.label: "About US"
                    body: "DeAnnCNV is an online tool, designed for precise Detection and Annotation of Copy Number Variations (CNVs) from whole-exome or nsequencing (WES) data.\nThis is a work of BIOSTACS team. "
                        
                    onFinished: {
                        if (aboutdiag.result == SystemUiResult.ConfirmButtonSelection)
                        linkInvocation.query.uri ="http://mcg.ustc.edu.cn/rpg/aboutus/aboutus.html"
                    }
                    
                                        
                }
                
                
                ]
                onTriggered: {
                    
                    aboutdiag.show();
                }
        }
        ]
        attachedObjects: [
            Invocation {
                id: linkInvocation
                property bool auto_trigger: false
                query {
                    uri: "http://mcg.ustc.edu.cn/db/cnv/"
                    
                    onUriChanged: {
                        linkInvocation.query.updateQuery();
                    }
                }
                
                onArmed: {
                    // don't auto-trigger on initial setup
                    if (auto_trigger)
                        trigger("bb.action.OPEN");
                    auto_trigger = true;    // allow re-arming to auto-trigger
                }
            }
        ]
    }

    attachedObjects: [
        // Definition of the second Page, used to dynamically create the Page above.
        ComponentDefinition {
            id: secondPageDefinition
            source: "DetailsPage.qml"
        }
    ]

    onPopTransitionEnded: {
        // Destroy the popped Page once the back transition has ended.
        page.destroy();
    }
}
