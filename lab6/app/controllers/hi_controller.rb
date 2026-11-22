class HiController < ApplicationController
  def index
    @stud = 'Student'
    @message = 'Моє повідомлення %d прийшло з Контролера'
    
    @current_time = Time.now.strftime("%H:%M:%S %d-%m-%Y")
  end
end
