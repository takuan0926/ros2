import rclpy
from rclpy.node import Node
from std_msgs.msg import Int16

class Listener(Node):
    def __init__(self):
        super().__init__("listener")
        self.sub = self.create_subscription(Int16, "countup", self.cb, 10)
        #サブスクリプションの作成

    def cb(self, msg):
        #コールバック関数: メッセージを受信したときに呼び出される
        self.get_logger().info(f"受信:{msg.data}")

def main():
    rclpy.init()
    node = Listener()
    rclpy.spin(node)
    node.destroy_node()  #ノードの終了処理
    rclpy.shutdown()

if __name__ == "__main__":
    main()
##なんでだよ
