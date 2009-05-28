require File.dirname(__FILE__) + '/../spec_helper'

describe 'CounterTags' do
  dataset :pages

  describe '<r:counter />' do
    
    it 'should render 0 on the first use' do
      tag = '<r:counter />'
      expected = "0"
      pages(:home).should render(tag).as(expected)
    end 
    
    it 'should render "01" if it is used twice' do
      tag = '<r:counter /><r:counter />'
      expected = "01"
      pages(:home).should render(tag).as(expected)
    end
    
    it 'should render "012" if it is used twice' do
      tag = '<r:counter /><r:counter /><r:counter />'
      expected = "012"
      pages(:home).should render(tag).as(expected)
    end 
  end  
end