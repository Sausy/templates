import rospy
import time
from std_msgs.msg import String

rospy.init_node("hand_script")
pub = rospy.Publisher("/roboy/hand/gesture", String, queue_size=1)
rate=rospy.Rate(1);


#echo("start loop");

while not rospy.is_shutdown():
	ros_msg = "G0"
	pub.publish(ros_msg)
	rate.sleep();
	time.sleep(5);
	ros_msg = "G1"
        pub.publish(ros_msg)
	rate.sleep();
	time.sleep(5);
	ros_msg = "G3"
        pub.publish(ros_msg)
	rate.sleep();
	time.sleep(5);
	ros_msg = "G2"
        pub.publish(ros_msg)
	rate.sleep();
	time.sleep(5);

