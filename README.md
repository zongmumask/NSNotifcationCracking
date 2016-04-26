# NSNotifcationCracking
在iOS中，NSNotification是使用观察者模式来实现的用于跨层传递消息。
##观察者模式
定义：定义对象间的一种一对多的依赖关系。当一个对象的状态发生改变时，所有依赖于它的对象都得到通知并自动更新。
应用场景：
- 有两种抽象类型相互依赖。将它们封装在各自的对象中，就可以对它们单独进行改变和复用。
- 对一个对象的改变需要同时改变其他对象，而不知道具体有多少对象有待改变。
- 一个对象必须通知其他对象，而它又不需要知道其他对象是什么。
![观察者模式.png](http://upload-images.jianshu.io/upload_images/1322498-0427c0bb4561c8aa.png?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)
