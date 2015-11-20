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

Page {
    titleBar: TitleBar {
        // Localized text with the dynamic translation and locale updates support
        title: qsTr("Query") + Retranslate.onLocaleOrLanguageChanged      
    }
    Container {
        ScrollView {
            Container {
                
                background: Color.create ("#f8f8f8")
                layout: StackLayout {
                    orientation: LayoutOrientation.TopToBottom
                }
                Label {
                    id: statusLabel
                    leftMargin: 10
                    text: "No webpage yet."
                } 
                WebView {
                    id: webView
                    url: "http://mcg.ustc.edu.cn/db/cnv/check.php?rand_num="+textids.text.toString()
                    accessibility.name: "Web View"
                    settings.devicePixelRatio: 0.5
                    onLoadingChanged: {
                        if (loadRequest.status ==  WebLoadStatus.Started ) {
                            statusLabel.setText("Load started.")
                        }
                        else if (loadRequest.status ==  WebLoadStatus.Succeeded ) {
                            statusLabel.setText("Load finished.")
                        }
                        else if (loadRequest.status ==  WebLoadStatus.Failed ) {
                            statusLabel.setText("Load failed.")
                        }
                    }
                }
            }
            accessibility.name: "Scroll Window"
        }
        
                
        
        TextField {
            id: iformationtxt
            text: myCppObject.getstatus()
            
            verticalAlignment: VerticalAlignment.Bottom
        }
    }
    
    

}
