#!/usr/bin/env ruby
require 'yaml'
require 'sass'
require 'sass/plugin'
require 'filewatcher'
require 'thread'

class FrontMatter
    @@array = Array.new
    attr_accessor :yaml_name

    def all_instances()
        return @@array
    end

    def initialize(var_name, attributes = {})
        @var_name = var_name
        @yaml_name = attributes[:yaml_name]
        @use_quotes = attributes[:use_quotes]
        @@array << self
    end

    def to_sass(data)
        string = '$' + @var_name + ': ' + add_quotes(data) + ';'
        return string
    end

    def add_quotes(string)
        if (@use_quotes)
            return '"' + string + '"'
        else
            return string
        end
    end
end

module WatcherMixin
    class << self
        def included(base)
            base.extend ClassMethods
        end
    end

    module ClassMethods
        # Pass in 2-piece array objects for filtering into a path hash
        def assign(*dicts)
            @path = Hash.new
            dicts.each do |i|
                @path[i[0]] = i[1]
            end
        end

        # debug so we can print out all of our paths
        def paths()
            return @path
        end

        # return a specific path by key
        def path(type)
            if @path[type] != nil
                return @path[type]
            end
            return nil
        end
    end
end

class Watcher
    include WatcherMixin
    def watch; end;
    def run(callback)
        callback.call
    end
end

class Injector < Watcher
    assign ['data', './data/'], ['sass', './_scss/']
    @@yaml = Injector.path('data') + 'resume.yml'

    def initialize(front_matter)
        @@front_matter = front_matter
    end

    # create a yaml hash from small file
    def read()
        @@data = YAML.load_file(@@yaml)
    end

    def inject()
        inject_path = Injector.path('sass') + '_yaml-front-matter.scss'

        File.open(inject_path, 'w') do |file|
            @@front_matter.each do |fm|
                puts fm.to_sass(@@data[fm.yaml_name])
                file.puts fm.to_sass(@@data[fm.yaml_name])
            end
        end
    end

    def watch()
        FileWatcher.new(@@yaml).watch do |filename|
            read
            inject
            puts "Updated #{filename}"
        end
    end
end

class Builder < Watcher
    assign ['sass', './_scss/'], ['css', './static/stylesheets/']

    def initialize()
        Sass::Plugin.options[:style] = :compressed
        Sass::Plugin.options[:sourcemap] = :none
        Sass::Plugin.options[:cache] = false
        Sass::Plugin.options[:css_location] = Builder.path('css')
        Sass::Plugin.options[:template_location] = Builder.path('sass')
    end

    def watch()
        Sass::Plugin.watch
    end
end

if $PROGRAM_NAME == __FILE__

    # Initialize your front matter 
    fm = []
    fm << FrontMatter.new('resume-color', { use_quotes: true, yaml_name: 'color' })
    fm << FrontMatter.new('list-style', { use_quotes: false, yaml_name: 'list-style' })
    injector = Injector.new(fm)
    builder = Builder.new

    # Manual injection so that we're always at a proper starting point
    injector.read
    injector.inject

    # Threads 
    threads = []
    threads << Thread.new do
        injector.run(injector.watch)
    end
    threads << Thread.new do
        builder.run(builder.watch)
    end

    threads.each do |t|
        t.join
    end
end