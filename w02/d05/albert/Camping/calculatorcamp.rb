Camping.goes :Calculator

module Calculator::Models
  class Page < Base
  end

  class BasicFields < V 1.0
    def self.up
      create_table Page.table_name do |t|
        t.string :title
        t.text   :content
        # This gives us created_at and updated_at
        t.timestamps
      end
    end

    def self.down
      drop_table Page.table_name
    end
  end
end

def Calculator.create
  Calculator::Models.create_schema
end

module Nuts::Controllers
  class Pages
    def get
      # Only fetch the titles of the pages.
      @pages = Page.all(:select => "title")
      render :list
    end
  end

  class PageX
    def get(title)
      @page = Page.find_by_title(title)
      render :view
    end
  end
end

module Nuts::Views
  def list
    h1 "All pages"
    ul do
      @pages.each do |page|
        li do
          a page.title, :href => R(PageX, page.title)
        end
      end
    end
  end

  def view
    h1 @page.title
    self << @page.content
  end
end

