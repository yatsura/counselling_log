module ECMC 
  module BrowserHelpers
    def wait_for_browser
      page.driver.browser.manage.timeouts.implicit_wait = 5
      page.driver.browser.find_element(:class => "main_con")
    end

    def accept_popup
      return if page.driver.is_a? Capybara::Poltergeist::Driver
      alert = page.driver.browser.switch_to.alert
      alert.accept
      wait_for_browser
    end
  end
end

