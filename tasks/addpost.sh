rm -Rf /Users/mijndert/Sites/mijndertstuij-nl/blog/

cd /Users/mijndert/Sites/blog; jekyll

rsync -avz --delete -e 'ssh -p222' /Users/mijndert/Sites/mijndertstuij-nl/blog/ mijndert@mijndertstuij.nl:/var/www/mijndertstuij-nl/blog

