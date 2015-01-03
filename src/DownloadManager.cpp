/*
 * DownloadManager.cpp
 *
 *  Created on: Jun 7, 2014
 *      Author: thura_000
 */

#include "DownloadManager.hpp"
#include <bb/system/Clipboard>

#include <QtCore>

DownloadManager::DownloadManager()
{
}

void DownloadManager::setDefaultDir(QString dir)
{
    default_dir = dir;
}

QString DownloadManager::defaultDir()
{
    return default_dir;
}

QString DownloadManager::returnOsLinks(QString hashedswversion, QString osversion, bool verizon)
{
    setOsLinks(hashedswversion, osversion, verizon);
    return oslinks;
}

QString DownloadManager::returnRadioLinks(QString hashedswversion, QString osversion, QString radioversion)
{
    setRadioLinks(hashedswversion, osversion, radioversion);
    return radiolinks;
}

void DownloadManager::setOsLinks(QString hashedswversion, QString osversion, bool verizon)
{
    //Autoloaders
    if (hashedswversion == "08d2e98e6754af941484848930ccbaddfefe13d6"){
        oslinks = ("---AUTOLOADERS---\n"
                "Normal URL\n\n"
                "STL100-1: http://developer.blackberry.com/native/downloads/fetch/Autoload-STL100-1-" + osversion +".exe\n\n" +
                "STL100-2/3: http://developer.blackberry.com/native/downloads/fetch/Autoload-STL100-3-" + osversion +".exe\n\n" +
                "STL100-4: http://developer.blackberry.com/native/downloads/fetch/Autoload-STL100-4-" + osversion +".exe\n\n" +
                "SQN100-X/SQR100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-SQN100-1-" + osversion +".exe\n\n" +
                "STA100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-STA100-5-" + osversion +".exe\n\n" +
                "STJ100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-STJ100-1-" + osversion +".exe\n\n" +
                "SQW100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-SQW100-1-" + osversion +".exe\n\n" +
                "Dev Alpha A: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlpha-" + osversion +".exe\n\n" +
                "Dev Alpha B: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlphaB-" + osversion +".exe\n\n" +
                "Dev Alpha A_B: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlphaA_B-" + osversion +".exe\n\n" +
                "Dev Alpha C: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlphaC-" + osversion +".exe");
    }
    //To look nice, variant URLs (10.3.1.634) are in the radio links
    else {
        if (osversion.indexOf("10.") != -1){
            oslinks = ("---OPERATING SYSTEMS---\n"
                    "TI OMAP (STL100-1)\n"
                    "Debrick OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.factory.desktop/" + osversion + "/winchester.factory_sfi.desktop-" + osversion + "-nto+armle-v7+signed.bar\n" +
                    "Core OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.factory/" + osversion + "/winchester.factory_sfi-" + osversion + "-nto+armle-v7+signed.bar\n\n" +
                    "Qualcomm 8960/8930 (Most others)\n" +
                    "Debrick OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.qc8960.factory_sfi.desktop/" + osversion + "/qc8960.factory_sfi.desktop-" + osversion + "-nto+armle-v7+signed.bar\n" +
                    "Core OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.qc8960.factory_sfi/" + osversion + "/qc8960.factory_sfi-" + osversion + "-nto+armle-v7+signed.bar\n\n");
            //Verizon images
            if (verizon == true){
                oslinks.append("Verizon 8960/8930\n"
                        "Debrick OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.qc8960.verizon_sfi.desktop/" + osversion + "/qc8960.verizon_sfi.desktop-" + osversion + "-nto+armle-v7+signed.bar\n" +
                        "Core OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.qc8960.verizon_sfi/" + osversion + "/qc8960.verizon_sfi-" + osversion + "-nto+armle-v7+signed.bar\n\n");
            }
            //10.3.0 (Passport)
            if (osversion.indexOf("10.3.0") != -1) {
                oslinks.append("Qualcomm 8974 (Passport)\n"
                        "Debrick OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.qc8974.factory_sfi.desktop/" + osversion + "/qc8974.factory_sfi.desktop-" + osversion + "-nto+armle-v7+signed.bar\n"
                        "Core OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.qc8974.factory_sfi/" + osversion + "/qc8974.factory_sfi-" + osversion + "-nto+armle-v7+signed.bar\n\n");
            }
            //10.3.1 (Passport, again)
            if (osversion.indexOf("10.3.1") != -1) {
                oslinks.append("Qualcomm 8974_8960 Hybrid (10.3.1+)\n"
                        "Debrick OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/qc8960.factory_sfi_hybrid_qc8974.desktop-" + osversion + "-nto+armle-v7+signed.bar\n" +
                        "Core OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/qc8960.factory_sfi_hybrid_qc8974-" + osversion + "-nto+armle-v7+signed.bar\n\n");
            }
            oslinks.chop(2); //trailing \n\n
        }
        else {
            oslinks = ("---OPERATING SYSTEMS---\n"
                    "TI OMAP (PlayBook)\n"
                    "Debrick OS: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.coreos.qcfm.os.factory.desktop/" + osversion + "/winchester.factory_sfi.desktop-" + osversion + "-nto+armle-v7+signed.bar");
        }
    }
}

void DownloadManager::setRadioLinks(QString hashedswversion, QString osversion, QString radioversion)
{
    if (hashedswversion == "08d2e98e6754af941484848930ccbaddfefe13d6"){
        radiolinks = ("Variant URL\n\n"
                "STL100-1: http://developer.blackberry.com/native/downloads/fetch/Autoload-STL-100-1-" + osversion +".exe\n\n" +
                "STL100-2/3: http://developer.blackberry.com/native/downloads/fetch/Autoload-STL-100-3-" + osversion +".exe\n\n" +
                "STL100-4: http://developer.blackberry.com/native/downloads/fetch/Autoload-STL-100-4-" + osversion +".exe\n\n" +
                "SQN100-X/SQR100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-SQN-100-1-" + osversion +".exe\n\n" +
                "STA100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-STA-100-5-" + osversion +".exe\n\n" +
                "STJ100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-STJ-100-1-" + osversion +".exe\n\n" +
                "SQW100-X: http://developer.blackberry.com/native/downloads/fetch/Autoload-SQW-100-1-" + osversion +".exe\n\n" +
                "Dev Alpha A: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlpha-" + osversion +".exe\n\n" +
                "Dev Alpha B: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlphaB-" + osversion +".exe\n\n" +
                "Dev Alpha A_B: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlphaA_B-" + osversion +".exe\n\n" +
                "Dev Alpha C: http://developer.blackberry.com/native/downloads/fetch/Autoload-DevAlphaC-" + osversion +".exe");
    }
    else {
        if (osversion.indexOf("10.") != -1){
            radiolinks = ("---RADIOS---\n"
                    "OMAP Z10: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.m5730/" + radioversion + "/m5730-" + radioversion + "-nto+armle-v7+signed.bar\n\n" +
                    "Qualcomm Z10/P9982: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.qc8960/" + radioversion + "/qc8960-" + radioversion + "-nto+armle-v7+signed.bar\n\n" +
                    "Verizon Z10: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.qc8960.omadm/" + radioversion + "/qc8960.omadm-" + radioversion + "-nto+armle-v7+signed.bar\n\n" +
                    "Q10/Q5/P9983: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.qc8960.wtr/" + radioversion + "/qc8960.wtr-" + radioversion + "-nto+armle-v7+signed.bar\n\n");
            //10.2.0 and up (Z30, Kopi/Cafe/Z3)
            if (osversion.indexOf("10.0.") == -1 && osversion.indexOf("10.1.") == -1) {
                radiolinks.append("Z30/Manitoba/Classic: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.qc8960.wtr5/" + radioversion + "/qc8960.wtr5-" + radioversion + "-nto+armle-v7+signed.bar\n\n");
                radiolinks.append("Z3/Kopi/Cafe: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.qc8930.wtr5/" + radioversion + "/qc8930.wtr5-" + radioversion + "-nto+armle-v7+signed.bar\n\n");
            }
            //10.3.0 and up (Passport)
            if (osversion.indexOf("10.0.") == -1 && osversion.indexOf("10.1.") == -1 && osversion.indexOf("10.2.") == -1) {
                radiolinks.append("Passport: http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/com.qnx.qcfm.radio.qc8974.wtr2/" + radioversion + "/qc8974.wtr2-" + radioversion + "-nto+armle-v7+signed.bar\n\n");
            }
            radiolinks.chop(2); //trailing \n\n
        }
        else {
            if (radioversion.indexOf("N/A") != -1){
                radiolinks = "";
            }
            else {
                radiolinks = ("---RADIOS---\n"
                        "PlayBook (old): http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/mod-qcmdm9k-" + radioversion + "-nto+armle-v7+signed.bar\n" +
                        "PlayBook (new): http://cdn.fs.sl.blackberry.com/fs/qnx/production/" + hashedswversion + "/mod.qcmdm9k-" + radioversion + "-nto+armle-v7+signed.bar");
            }
        }
    }
}

void DownloadManager::setExportUrls(QString hashedswversion, QString osversion, QString radioversion, bool verizon)
{
    setOsLinks(hashedswversion, osversion, verizon);
    setRadioLinks(hashedswversion, osversion, radioversion);
    exporturls = oslinks + "\n" + radiolinks;
}

void DownloadManager::exportLinks(QString swrelease, QString hashedswversion, QString osversion, QString radioversion, bool verizon)
{
    setExportUrls(hashedswversion, osversion, radioversion, verizon);
    saveTextFile(exporturls, swrelease);
}

void DownloadManager::copyOsLinks(QString hashedswversion, QString osversion, bool verizon)
{
    setOsLinks(hashedswversion, osversion, verizon);
    QByteArray exporturls_qba = oslinks.toUtf8();
    bb::system::Clipboard clipboard;
    clipboard.clear();
    clipboard.insert("text/plain", exporturls_qba);
}

void DownloadManager::copyRadioLinks(QString hashedswversion, QString osversion, QString radioversion)
{
    setRadioLinks(hashedswversion, osversion, radioversion);
    QByteArray exporturls_qba = radiolinks.toUtf8();
    bb::system::Clipboard clipboard;
    clipboard.clear();
    clipboard.insert("text/plain", exporturls_qba);
}

void DownloadManager::copyLinks(QString hashedswversion, QString osversion, QString radioversion, bool verizon)
{
    setExportUrls(hashedswversion, osversion, radioversion, verizon);
    QByteArray exporturls_qba = exporturls.toUtf8();
    bb::system::Clipboard clipboard;
    clipboard.clear();
    clipboard.insert("text/plain", exporturls_qba);
}

QString DownloadManager::returnLinks(QString hashedswversion, QString osversion, QString radioversion, bool verizon)
{
    setExportUrls(hashedswversion, osversion, radioversion, verizon);
    return exporturls;
}

void DownloadManager::saveTextFile(QString urls, QString swrelease)
{
    QDir dir(default_dir);
    if (!dir.exists()) {
        dir.mkpath(".");
    }
    //Get local date and time
    QDateTime dateTime = QDateTime::currentDateTime();
    QString dateTimeString = dateTime.toString("yyyy_MMM_dd_hh_mm_ss");
    QFile file(default_dir+swrelease+"-"+dateTimeString+".txt");
    QFileInfo fi(file);
    filename = fi.absoluteFilePath();
    file.open(QIODevice::WriteOnly);
    QTextStream outStream(&file);
    outStream << urls;
    file.close();
}

QString DownloadManager::returnFilename()
{
    return "file://" + filename;
}

QString DownloadManager::readTextFile(QString uri, QString mode)
{
    QFile file(uri);
    file.open(QIODevice::ReadOnly);
    QTextStream textStream(&file);
    QString text;
    if (mode == "normal"){
        text = textStream.readAll();
    }
    if (mode == "firstline"){
        text = textStream.readLine();
    }
    if (mode == "branch"){
        while (!textStream.atEnd()){
            QString tempstring = textStream.readLine();
            if (tempstring.startsWith("Build Branch") == true){
                text = tempstring;
            }
        }
    }
    file.close();
    return text;
}
