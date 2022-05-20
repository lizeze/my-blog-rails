# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

def index
        renderer=   Redcarpet::Render::HTML.new(render_options = {})
        markdown = Redcarpet::Markdown.new(renderer, extensions = {fenced_code_blocks: true,highlight:true})
        content = File.read("md/我的.md")  
        @html=  markdown.render(content)  
         render :template=>'post/index'
    end


# 初始化数据库
```
docker run -d      --name db-for-blog      -e POSTGRES_USER=blog    -e POSTGRES_PASSWORD=123456      -e POSTGRES_DB=my_blog_rails_development     -e PGDATA=/var/lib/postgresql/data/pgdata      -v my-blog-data:/var/lib/postgresql/data      --network=network1    --restart=always   postgres:14
```

# 解决启动异常

```
git config --global core.autocrlf true
rails app:update:bin
```

# 增加字段

```
rails g migration addColumnToBlogs describe:string
rails db:migrate
```