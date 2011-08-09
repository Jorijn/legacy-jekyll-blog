rm -Rf /Users/mijndert/Sites/mijndertstuij-nl

cd /Users/mijndert/Sites/blog; jekyll

rsync -avz --delete -e 'ssh -p222' /Users/mijndert/Sites/mijndertstuij-nl/ mijndert@mijndertstuij.nl:/var/www/mijndertstuij-nl

