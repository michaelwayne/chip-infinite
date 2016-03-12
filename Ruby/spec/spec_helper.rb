$LOAD_PATH << File.expand_path('.')

RSpec.configure do |config|
  config.mock_with :rspec do |mock|
    mock.syntax = :expect
  end

  config.expect_with :rspec do |expect|
    expect.syntax = :expect
  end
end
