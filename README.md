# PySQMWeb

PySQMWeb is a simple Ruby/Sinatra (web) application to display image and data files that generated by [PySQM](https://github.com/mireianievas/PySQM). This web app was built by combining [web-intro-project](https://github.com/orfjackal/web-intro-project) and [tutsplus-build-an-image-gallery-in-ruby](https://github.com/andisugandi/tutsplus-build-an-image-gallery-in-ruby).

## Getting Started

1. Let's suppose your working directory right now is your user home directory, so clone the repository:

        $ git clone git@github.com:andisugandi/pysqmweb.git

2. Change working directory to `pysqmweb`:

        $ cd pysqmweb

3. Make `public/pictures` and `public/data` directory:

        $ mkdir public/pitures
        $ mkdir public/data

4. If your Linux username is `user`, and SQM image and data files generated by PySQM are in `/home/user/PySQM/data/daily_plots/` and `/home/user/PySQM/data/daily_data/` respectively, then make symbolic link to `/home/user/pysqmweb/public/pictures/` and `/home/user/pysqmweb/public/data/` respectively:

        $ ln -s /home/user/PySQM/data/daily_plots/* /home/user/pysqmweb/public/pictures/
        $ ln -s /home/user/PySQM/data/daily_data/* /home/user/pysqmweb/public/data/

5. Install Ruby Gems dependencies and start the web server:

        $ bundle install
        $ bundle exec rackup

6. Using a browser, go to `http://localhost:9292` and you'll see the application running.