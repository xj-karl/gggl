package com.cczu.util.common;

import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.cczu.sys.system.entity.User;
import com.cczu.sys.system.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cczu.sys.comm.utils.Global;

@Component
public class MailUtil {

    private static UserService userService;

    @Autowired
    public void setUserService(UserService userService) {
        MailUtil.userService = userService;
    }

	private static String host = Global.getMailhost();  
    private static String auth = "true";//注意：服务器上如果没有身份认证则为false
    private static String domainUser = Global.getMaildomainUser();
    private static String address = Global.getMailaddress();  
    private static String password = Global.getMailpassword();  
    
    public static void send(String[] to, String[] cc, String[] bcc, String subject, String content) throws Exception {  
        Properties props = new Properties();  
        props.put("mail.smtp.host", host);  
        props.put("mail.smtp.auth", auth);  
        //props.put("mail.smtp.port", "25");
        Session s = Session.getInstance(props);  
        //s.setDebug(true);  
  
        MimeMessage message = new MimeMessage(s);  
  
        InternetAddress from = new InternetAddress(address);  
        message.setFrom(from);  
        InternetAddress[] Toaddress = new InternetAddress[to.length];  
        for (int i = 0; i < to.length; i++){
            Toaddress[i] = new InternetAddress(to[i]);
        }
        message.setRecipients(Message.RecipientType.TO, Toaddress);  
  
        if (cc != null) {  
            InternetAddress[] Ccaddress = new InternetAddress[cc.length];  
            for (int i = 0; i < cc.length; i++)  
                Ccaddress[i] = new InternetAddress(cc[i]);  
            message.setRecipients(Message.RecipientType.CC, Ccaddress);  
        }  
  
        if (bcc != null) {  
            InternetAddress[] Bccaddress = new InternetAddress[bcc.length];  
            for (int i = 0; i < bcc.length; i++)  
                Bccaddress[i] = new InternetAddress(bcc[i]);  
            message.setRecipients(Message.RecipientType.BCC, Bccaddress);  
        }  
        
        message.setSubject(subject,"GB2312");  
        message.setSentDate(new Date());  
  
        BodyPart mdp = new MimeBodyPart();  
        mdp.setContent(content, "text/html;charset=utf-8");  
        Multipart mm = new MimeMultipart();  
        mm.addBodyPart(mdp);  
        message.setContent(mm);  
  
        message.saveChanges();  
        Transport transport = s.getTransport("smtp");  
        transport.connect(host, (null == domainUser) ? address : domainUser, password);
        //transport.connect();
        transport.sendMessage(message, message.getAllRecipients());  
        transport.close();  
    }

    public static void tomail(String dsprids,String subject,String content){
        if(!StringUtils.isEmpty(dsprids)){
            List<User> emailuser = userService.findUserByIditems(dsprids);
            if(emailuser.size()>0){
                String[] a = new String[emailuser.size()];
                for(int i = 0;i<emailuser.size();i++){
                    a[i] = emailuser.get(i).getEmail();
                }
                try {
                    MailUtil.send(a, null, null, subject, content);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
