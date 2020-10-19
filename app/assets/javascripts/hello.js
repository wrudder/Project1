console.log("hello")

require 'coderay'
CodeRay.scan('puts "Hello, world!"', :ruby).snippet
