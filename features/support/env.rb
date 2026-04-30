require 'capybara'
require 'capybara/cucumber'
require 'selenium-webdriver'
require 'rspec'
require 'report_builder'
require 'site_prism'

# Configura o driver do Capybara para usar o Chrome em modo headless, se necessário
headless = ENV['HEADLESS'] == 'false' || ENV['CI'] == 'true'

# Registra o driver do Chrome com as opções configuradas
Capybara.register_driver :chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--window-size=1280,800')
  options.add_argument('--disable-gpu')
  options.add_argument('--no-sandbox')
  options.add_argument('--disable-dev-shm-usage')
  options.add_preference('profile.password_manager_leak_detection', false)
  options.add_preference('credentials_enable_service', false)
  options.add_preference('password_manager_enabled', false)
  options.add_argument('--headless') if headless

  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options)
end

# Configura o Capybara para usar o driver do Chrome e definir o host da aplicação
Capybara.configure do |config|
  config.default_driver    = :chrome
  config.app_host          = 'https://www.saucedemo.com'
  config.default_max_wait_time = 10
end

# Configura o ReportBuilder para gerar um relatório após a execução dos testes
at_exit do
  ReportBuilder.configure do |config|
    config.input_path = 'reports/report.json'
    config.report_path = 'reports/relatorio_final'
    config.report_types = [:html]
    config.report_title = 'Resultados dos Testes Automatizados'
    config.color = 'blue'
  end
  ReportBuilder.build_report
end

# Desativa os avisos de depreciação do Capybara
Warning[:deprecated] = false

# Inclui os matchers do RSpec para usar nas definições dos passos
World(RSpec::Matchers)
