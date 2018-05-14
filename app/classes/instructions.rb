# frozen_string_literal: true

class Instructions
  def initialize(instruction)
    @instruction = instruction
  end

  def instruction
    utf8 = @instruction['html_instructions'].encode('utf-8').gsub(/<div/, '. <div')
    ActionController::Base.helpers.strip_tags(utf8)
  end
end