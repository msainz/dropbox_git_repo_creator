require 'thor'

class Repo < Thor
  include Thor::Actions

  desc 'create NAME', 'Creates new Dropbox repository with the given NAME'
  def create(name)
    say "Creating new Dropbox repository named \"#{name}\""
    inside "~/Dropbox/git" do
      run "mkdir #{name}"
      inside "#{name}" do
        run "git init --bare ~/Dropbox/git/#{name}/#{name}.git"
      end
    end
    inside "~/workspace" do
      run "mkdir #{name}"
      inside "#{name}" do
        run "git init ."
        run "touch README.md"
        run "git add ."
        run "git commit -m 'Initial Commit'"
        run "git remote add origin ~/Dropbox/git/#{name}/#{name}.git"
        run "git push -u origin master"
      end
    end
    inside "~" do
      append_to_file ".bashrc", "export #{name}=~/workspace/#{name}" +
        "\n" + "alias #{name}=\"cd $#{name}\"" + "\n"
    end
    say "Success!"
  end

end
