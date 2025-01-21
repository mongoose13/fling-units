def execute(command)
  puts command
  exec(command)
end

def silent(command)
  `#{command}`
end

desc "Build measurement classes from configs"
task "gen:build".to_sym do
  execute "dart run build_runner build"
end

desc "Delete autogenerated measurement files"
task "gen:clean".to_sym do
  silent "rm -rf lib/src/generated"
  silent "rm -rf lib/src/library.dart"
end
