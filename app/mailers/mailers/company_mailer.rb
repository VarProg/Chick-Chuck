# frozen_string_literal: true

module Mailers
  class CompanyMailer < ApplicationMailer

    def message_template(user, subject, main_content)
      @h1 = "Привет #{user.user_name} 👋🏻"
      @main_content = main_content
      
      mail to: user.email, 
           subject: subject
    end
  
    def sending
      subject = 'Обновление'
      main_content = "Количество перевозчиков в сервисе постепенно растет и чтобы клиенту было удобнее вас найти, теперь вы можете указать категории услуг, которые вы оказываете, для этого вам нужно перейти по вкладке 'О компании' в личном кабинете и добавить информацию в разделе услуги. Так же, теперь вы можете загрузить фотографии для вашего портфолио, например, ваш автопарк и вашу команду, перейдя по вкладке 'Галерея' в вашем личном кабинете. <br> Заходите в личный кабинет и обновляйте информацию о вашей компании, чтобы выделиться среди других перевозчиков и привлечь своего потенциального клиента!"
      
      User.where.not(type: 'Client').each do |user| 
        Mailers::CompanyMailer.message_template(user, subject, main_content).deliver_later 
      end
    end
    
    def test_sending
      subject = 'Обновление'
      main_content = "Количество перевозчиков в сервисе постепенно растет и чтобы клиенту было удобнее вас найти, теперь вы можете указать категории услуг, которые вы оказываете, для этого вам нужно перейти по вкладке 'О компании' в личном кабинете и добавить информацию в разделе услуги. Так же, теперь вы можете загрузить фотографии для вашего портфолио, например, ваш автопарк и вашу команду, перейдя по вкладке 'Галерея' в вашем личном кабинете. <br> Заходите в личный кабинет и обновляйте информацию о вашей компании, чтобы выделиться среди других перевозчиков и привлечь своего потенциального клиента!"
      
      Mailers::CompanyMailer.message_template(Admin.first, subject, main_content).deliver_now 
    end
  end
end