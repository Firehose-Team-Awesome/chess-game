echo "Please enter a commit description: "
read input_variable
echo "You entered: $input_variable"

# Dumping of seed file requires gem 'seed_dump'

# install seed dump by adding: gem 'seed_dump' to your project gemfile
# then run bundle install

# to dump a seed file uncomment the following line to disable seed dumps comment it out:
# rake db:seed:dump EXCLUDE=[:image_name] MODELS=Course,Section,Lesson FILE=db/seeds/flixter_seed.rb

# see https://github.com/rroblak/seed_dump for more info on the seed_dump
# usage and switches
#
# To export records with :id field use the EXCLUDE=[] option, this will ensure relationships stay intact.

git add --all
git commit -am "$input_variable"
git push origin master