# Extends the XML serialization support in activesupport to allow for arrays containing strings, symbols, and integers.

require 'rubygems'
require 'activesupport'
require 'builder'

class Array
  def to_xml(options = {})
    #raise "Not all elements respond to to_xml" unless all? { |e| e.respond_to? :to_xml }
    require 'builder' unless defined?(Builder)

    options = options.dup
    options[:root]     ||= all? { |e| e.is_a?(first.class) && first.class.to_s != "Hash" } ? first.class.to_s.underscore.pluralize : "records"
    options[:children] ||= options[:root].singularize
    options[:indent]   ||= 2
    options[:builder]  ||= Builder::XmlMarkup.new(:indent => options[:indent])

    root     = options.delete(:root).to_s
    children = options.delete(:children)

    if !options.has_key?(:dasherize) || options[:dasherize]
      root = root.dasherize
    end

    options[:builder].instruct! unless options.delete(:skip_instruct)

    opts = options.merge({ :root => children })

    root = root.pluralize
    
    xml = options[:builder]
    if empty?
      xml.tag!(root, options[:skip_types] ? {} : {:type => "array"})
    else
      xml.tag!(root, options[:skip_types] ? {} : {:type => "array"}) do
        yield xml if block_given?
        each do |e|
          if e.respond_to? :to_xml
            e.to_xml(opts.merge({ :skip_instruct => true }))
          else
            xml.tag!(root.singularize, e.to_s)  
          end
        end
      end
    end
  end
end
