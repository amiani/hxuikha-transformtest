let project = new Project('Transform Test');
project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('haxeui-core');
project.addLibrary('haxeui-kha');
resolve(project);