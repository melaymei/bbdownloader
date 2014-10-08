/*SwLookup.cpp
--------------
Handles software version lookup.

--Thurask*/

#include <QtCore>
#include <QtNetwork>
#include <QtXml>
#include <QDateTime>
#include "SwLookup.hpp"

SwLookup::SwLookup(QObject* parent)
: QObject(parent)
, m_networkAccessManager(new QNetworkAccessManager(this))
{
}

QString SwLookup::softwareRelease()
{
    return m_softwareRelease;
}

void SwLookup::post(QString osVer, QString server)
{
    QRegExp rx("(\\d{0,4}\\.)(\\d{0,4}\\.)(\\d{0,4}\\.)(\\d{0,4})");
    if (osVer.contains(rx) == true){
        QUrl url(server);
        QNetworkRequest request(url);
        QString query = "<srVersionLookupRequest version=\"2.0.0\" authEchoTS=\"1366644680359\">"
                "<clientProperties><hardware>"
                "<pin>0x2FFFFFB3</pin><bsn>1140011878</bsn><imei>004402242176786</imei><id>0x8D00240A</id><isBootROMSecure>true</isBootROMSecure>"
                "</hardware>"
                "<network>"
                "<vendorId>0x0</vendorId><homeNPC>0x60</homeNPC><currentNPC>0x60</currentNPC><ecid>0x1</ecid>"
                "</network>"
                "<software><currentLocale>en_US</currentLocale><legalLocale>en_US</legalLocale>"
                "<osVersion>"+ osVer +"</osVersion><omadmEnabled>false</omadmEnabled></software></clientProperties>"
                "</srVersionLookupRequest>";
        request.setHeader(QNetworkRequest::ContentTypeHeader, "text/xml;charset=UTF-8");
        QNetworkReply* reply = m_networkAccessManager->post(request, query.toUtf8());
        bool ok = connect(reply, SIGNAL(finished()), this, SLOT(onGetReply()));
        Q_ASSERT(ok);
        Q_UNUSED(ok);
    }
    else {
        QString error = tr("Error");
        setSoftwareRelease(error);
    }
}

void SwLookup::onGetReply()
{
    QNetworkReply* reply = qobject_cast<QNetworkReply*>(sender());
    QByteArray data = reply->readAll();
    QXmlStreamReader xml(data);
    while(!xml.atEnd() && !xml.hasError()) {
        if(xml.tokenType() == QXmlStreamReader::StartElement) {
            if (xml.name() == "softwareReleaseVersion")
                m_softwareRelease = xml.readElementText();
            emit softwareReleaseChanged();
        }
        xml.readNext();
    }
    sender()->deleteLater();
}

QString SwLookup::lookupIncrement(QString os)
{
    QStringList splitarray = os.split(".");
    if (splitarray[3] == "") {
        return tr("Error");
    }
    if (splitarray[3].toInt() < 9998){
        splitarray[3] = QString::number((splitarray[3]).toInt() + 3);
        return splitarray.join(".");
    }
    else {
        splitarray[3] = QString::number(0);
        return splitarray.join(".");
    }
}

void SwLookup::setSoftwareRelease(QString sw)
{
    m_softwareRelease = sw;
}
