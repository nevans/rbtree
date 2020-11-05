require 'mkmf'

if enable_config('debug')
  $CFLAGS << ' -g -std=c99 -pedantic -Wall'
else
  $defs << '-DNDEBUG'
end
have_header('ruby/st.h')
have_func('rb_exec_recursive', 'ruby.h')
have_func('rb_exec_recursive_paired', 'ruby.h')
have_func('rb_proc_lambda_p', 'ruby.h')
if Hash.method_defined?(:flatten)
  $defs << '-DHAVE_HASH_FLATTEN'
end
create_makefile('rbtree')
