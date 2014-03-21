require 'spec_helper'
require 'timecop'

describe 'Visiting the home page' do


  it "displays the year dynamically" do
    visit "/"

    within("footer") do
      expect(page).to have_content("2014")
    end
  end

  it "displays the pictures" do
    visit "/"

    page.should have_css('img')
    #this is a horribly inaccurate test

  end

  it "displays 10% off prices on wednesday" do
    visit "/"

    #Timecop.freeze(Time.local(2014,3,19))
    if Time.new.wednesday?
      expect(page).to have_content("5.36")
    else
      expect(page).to have_content("5.95")
    end

    #Timecop.return

  end

  it "displays thursday dishes on a thursday" do
    visit "/"

    if Time.new.thursday?
      expect(page).to have_content("Channa Masala")
    else
      expect(page).to have_content("Saag Paneer")
    end

  end


end




#this is testing the html file