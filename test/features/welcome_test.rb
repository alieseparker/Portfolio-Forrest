require 'test_helper'
require 'net/http'

feature 'As a site visitor, when visiting the root url' do
  scenario 'I wish to see a welcome page' do
    visit root_url
    page.must_have_content 'Welcome'
  end

  scenario 'I wish to know that my URL works' do
    http = Net::HTTP.new('www.forrestaparker.com', 80)
    response = http.request_get('/')
    p response.code
  end
end
