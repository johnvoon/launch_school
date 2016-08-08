def url?(url)
  !!url.match(/\Ahttps?:\/\/\S+\z/)
end

p url?('http://launchschool.com')
p url?('https://example.com')
p url?('https://example.com hello')
p url?('    https://example.com')