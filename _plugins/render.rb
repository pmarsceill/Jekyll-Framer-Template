1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
52
53
54
55
56
57
58
59
60
61
62
63
64
65
# Liquid::Template.register_tag('render_file', Jekyll::RenderFile)
# Title: Render Partial Tag for Jekyll
# Author: Brandon Mathis http://brandonmathis.com with file path update by Catherine Farman
# Description: Import files on your filesystem into any blog post and render them inline.
# Note: Paths are relative to the present working directory.
#
# Syntax {% render path/to/file %}
#
# Example 1:
# {% render about/_bio.markdown %}
#
# This will import source/about/_bio.markdown and render it inline.
# In this example I used an underscore at the beginning of the filename to prevent Jekyll
# from generating an about/bio.html (Jekyll doesn't convert files beginning with underscores)
#
# Example 2:
# {% render templates/includes/header.html %}
# Some projects may have a separate templates folder to create template code.
# You can include markup from those files using this tag.
#
#

require 'pathname'

module Jekyll

  class RenderPartialTag < Liquid::Tag
    def initialize(tag_name, markup, tokens)
      @file = nil
      @raw = false
      if markup =~ /^(\S+)\s?(\w+)?/
        @file = $1.strip
        @raw = $2 == 'raw'
      end
      super
    end

    def render(context)
      file_dir = Dir.pwd
      file_path = Pathname.new(file_dir).expand_path
      file = file_path + @file

      unless file.file?
        return "File #{file} could not be found"
      end

      Dir.chdir(file_path) do
        contents = file.read
        if contents =~ /\A-{3}.+[^\A]-{3}\n(.+)/m
          contents = $1.lstrip
        end
        if @raw
          contents
        else
          partial = Liquid::Template.parse(contents)
          context.stack do
            partial.render(context)
          end
        end
      end
    end
  end
end

Liquid::Template.register_tag('render', Jekyll::RenderPartialTag)
