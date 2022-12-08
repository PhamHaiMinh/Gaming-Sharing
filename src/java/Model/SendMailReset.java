/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.util.Properties;
import jakarta.mail.Message;
import jakarta.mail.MessagingException;
import jakarta.mail.PasswordAuthentication;
import jakarta.mail.Session;
import jakarta.mail.Transport;
import jakarta.mail.internet.InternetAddress;
import jakarta.mail.internet.MimeMessage;

/**
 *
 * @author Admin
 */
public class SendMailReset {

    public SendMailReset() {
    }

    public void sendMailResetPass(String to, String key) {
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");

        Session session = Session.getDefaultInstance(props, new jakarta.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("philonghiryu@gmail.com", "gijm efvt cutv ojsh");
            }
        });
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(to));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject("Reset password link: ");
            message.setText("Click here to verify Reset password account: " + "http://localhost:9999/Gaming_Sharing/ConfirmResetPass?key=" + key + "&email=" + to);
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
    public static void main(String[] args) {
    new    SendMailReset().sendMailResetPass("luckienphongcover@gmail.com", "541545");
    }
}
