class InvoiceMailer < ActionMailer::Base
  default from: "from@example.com"

  def send_invoice(invoice, pdf)
      @invoice = invoice
      @pdf = pdf
      attachments['invoice.pdf'] =  @pdf.render
      mail(:to => invoice.subscriber.email, :subject => "Invoice")
  end

end
