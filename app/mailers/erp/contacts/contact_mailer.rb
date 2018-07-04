module Erp::Contacts
  class ContactMailer < Erp::ApplicationMailer
    def sending_email_contact(msg)
      @msg = msg
      
      #@todo static emails
      @recipients = ['Hùng Nguyễn <1633514@hcmut.edu.vn>']
      
      send_email(@recipients.join("; "), "Nội dung tin nhắn liên hệ/góp ý từ #{@msg.contact.email}")
    end 
  end
end
