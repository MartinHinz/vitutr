module Jekyll
  class TagsGenerator < Generator

    def generate(site)
        tags_dir = Dir.pwd + '/tags'

        if !Dir.exists?(tags_dir)
            puts "Creating tags dir"
            Dir.mkdir(tags_dir)
        end
        regenerate_flag = false

        site.tags.each do |i|
            if !File.exists?(tags_dir + '/' + i[0] + '.html')
                puts "Creating tag page for: " + i[0]
                tag_file = File.new(tags_dir + '/' + i[0] + '.html', "w")
                tag_file.puts("---\nlayout: blog_by_tag\ntag: " + i[0] + "\npermalink: /tags/" + i[0] + "/\n---")
                tag_file.close

                regenerate_flag = true
            end
        end

        if regenerate_flag
            FileUtils.touch Dir.pwd+'/_config.yml'
        end

    end
  end
end

module Jekyll
  class CategoriesGenerator < Generator

    def generate(site)
        categories_dir = Dir.pwd + '/categories'

        if !Dir.exists?(categories_dir)
            puts "Creating categories dir"
            Dir.mkdir(categories_dir)
        end
        regenerate_flag = false

        site.categories.each do |i|
            if !File.exists?(categories_dir + '/' + CGI.escape(i[0]) + '.html')
                puts "Creating categories page for: " + i[0]
                category_file = File.new(categories_dir + '/' + CGI.escape(i[0]) + '.html', "w")
                category_file.puts("---\nlayout: blog_by_category\ncategory: " + i[0] + "\npermalink: /categories/" + CGI.escape(i[0]) + "/\n---")
                category_file.close

                regenerate_flag = true
            end
        end

        if regenerate_flag
            FileUtils.touch Dir.pwd+'/_config.yml'
        end

    end
  end
end
