desc 'Setup project configuration (Bower, DB, seed)'
task :setup do
  Rake::Task['bower:install']
  Rake::Task['bower:resolve']
  Rake::Task['db:seed']
  exec('rm -rf .git/')
end
