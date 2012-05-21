class InvoiceMailer < ActionMailer::Base
  default from: MAIL[Rails.env]["send_as"]

  def send_invoice(invoice, pdf, email_address)
      @invoice = invoice
      @pdf = pdf
      attachments['invoice.pdf'] =  @pdf.render
      mail(:to => email_address, :subject => "Invoice")
  end

end
