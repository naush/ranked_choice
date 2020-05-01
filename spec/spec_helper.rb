# frozen_string_literal: true

Dir[File.join('.', 'src/**/*.rb')].sort.each do |f|
  require f
end
