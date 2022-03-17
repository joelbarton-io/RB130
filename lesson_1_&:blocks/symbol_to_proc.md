# symbol to proc
- used for common acts: `calling_object.method_name(&:callable_method)`
- `:sym.id2name` -> string / alias for `to_s`
- doesn't work for methods that take arguments
- main idea: you can use this shortcut when calling methods with blocks