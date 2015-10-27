module IonicHelper
  def on_ionic_app
    Capybara.app_host = 'http://localhost:5000'
    visit('/')
    begin
      yield
    rescue => error
      puts error
    ensure
      Capybara.app_host = 'http://localhost:4321'
    end
  end
end
