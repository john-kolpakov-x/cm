package kz.greetgo.cm.cmd;

import kz.greetgo.cm.robot.RobotManager;

import java.io.InputStream;
import java.io.PrintStream;

public class MainLauncher {
  public static void main(String[] args) throws Exception {
    int totalCount = 0;

    if (System.in.available() > 0) {
      InputStream in = System.in;
      PrintStream out = System.out;
      byte buf[] = new byte[1024 * 4];

      while (true) {
        int count = in.read(buf);
        if (count < 0) break;
        totalCount += count;
        out.write(buf, 0, count);
      }

      System.out.println("Hello from MainLauncher: totalCount = " + totalCount);
      return;
    }


    if (args.length >= 2 && "robot".equals(args[0])) {
      RobotManager robotManager = new RobotManager();
      robotManager.name = args[1];
      robotManager.start();
      return;
    }

    throw new RuntimeException("Unknown command");
  }
}
