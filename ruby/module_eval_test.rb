class Thing
end

Thing.module_eval(%q/def hello; puts 'hello world'; end/) #注入方法

Thing.new.hello

Thing.module_eval(%q/puts 'zhi jie zhi xing!!!'/) #注入代码段，直接执行
