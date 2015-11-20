/*
 * lambda.h
 *
 *  Created on: Apr 13, 2015
 *      Author: yifan
 */

#ifndef LAMBDA_H_
#define LAMBDA_H_

#include <fstream>
#include <vector>
#include <math.h>

#include <string>
//#include "lambdaBMP.h"
#include <curl/curl.h>
#include <string>

#include <QObject>
#include <QMetaType>

//static int wait_on_socket(curl_socket_t sockfd, int for_recv, long timeout_ms);

class MyCppObject : public  QObject
{
    Q_OBJECT
    /*!
     * The value of the object.
     */
    Q_PROPERTY(int value READ value WRITE setValue NOTIFY valueChanged)

public:
    /*!
     * Constructs an instance of MyCppObject and sets the
     * parent. When the parent object is destroyed,
     * this object is as well.
     */
    explicit MyCppObject(QObject *parent = 0){ m_iValue = 0;st=1;}
    virtual ~MyCppObject(){}

    int CNVquerry(std::string uuid){
        CURL *curl;
        CURLcode res;
        std::string IDS = "http://mcg.ustc.edu.cn/db/cnv/check.php?rand_num=" + uuid;

        curl = curl_easy_init();
        if(curl) {
          curl_easy_setopt(curl, CURLOPT_URL, IDS.c_str());
          /* example.com is redirected, so we tell libcurl to follow redirection */
          curl_easy_setopt(curl, CURLOPT_FOLLOWLOCATION, 1L);

          /* Perform the request, res will get the return code */
          res = curl_easy_perform(curl);
          /* Check for errors */
          if(res != CURLE_OK)
          //fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
          /* always cleanup */
          curl_easy_cleanup(curl);
          return 0;
          }
        return 1;
        }
    /*!
     * Resets the value to its default value.
     */
    void reset(){m_iValue = 0;}
    /*!
     * Gets the current value.
     */
    int value(){return(m_iValue);}
    /*!
     * Sets the value.
     */
    void setValue(int i){m_iValue = i;}
    Q_INVOKABLE void getID(QString e){localgetID=e;}
    Q_INVOKABLE QString querrystatus(){
        QString OK_st= "ID:" + localgetID + " Existing";
        QString uOK_st= "ID:" + localgetID + " Doesn't Exist";
        std::string utf8_text = localgetID.toUtf8().constData();
        int d = CNVquerry(utf8_text);
        st = d;
        if (d==1){
            return uOK_st;
        }
        return OK_st;
    }

    Q_INVOKABLE QString getstatus(){
        QString OK_st= "ID:" + localgetID + " Exists.";
        QString uOK_st= "ID:" + localgetID + " Doesn't Exist.";
        std::string utf8_text = localgetID.toUtf8().constData();
        if (st==1){
            return uOK_st;
        }
        return OK_st;

    }

signals:
    void valueChanged(int);

private:
    int m_iValue;
    QString localgetID;
    int st; // status
};



static int wait_on_socket(curl_socket_t sockfd, int for_recv, long timeout_ms)
{
  struct timeval tv;
  fd_set infd, outfd, errfd;
  int res;

  tv.tv_sec = timeout_ms / 1000;
  tv.tv_usec= (timeout_ms % 1000) * 1000;

  FD_ZERO(&infd);
  FD_ZERO(&outfd);
  FD_ZERO(&errfd);

  FD_SET(sockfd, &errfd); /* always check for error */

  if(for_recv)
  {
    FD_SET(sockfd, &infd);
  }
  else
  {
    FD_SET(sockfd, &outfd);
  }

  /* select() returns the number of signalled sockets or -1 */
  res = select(sockfd + 1, &infd, &outfd, &errfd, &tv);
  return res;
}


#endif /* LAMBDA_H_ */
