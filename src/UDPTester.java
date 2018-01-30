/**
 * @version Revision History
 *          <pre>
 *          Author       Version         Date        Changes
 *          jeremyzhang   1.0          2015/8/10     Created
 *
 *          </pre>
 * @since B2B 4.6
 */
import org.jgroups.*;
import org.jgroups.util.Util;


/**
 * Demos the reception of views using a PullPushAdapter. Just start a number of members, and kill them
 * randomly. The view should always be correct.
 */
public class UDPTester extends ReceiverAdapter {
    private Channel channel;


    public void viewAccepted(View new_view) {
        System.out.println("** New view: " + new_view);
    }


    /**
     * Called when a member is suspected
     */
    public void suspect(Address suspected_mbr) {
        System.out.println("Suspected(" + suspected_mbr + ')');
    }



    public void start(String props) throws Exception {

        channel=new JChannel(props);
        channel.setReceiver(this);
        channel.connect("UDPTester");

        while(true) {
            Util.sleep(10000);
        }
    }


    public static void main(String args[]) {
        UDPTester t=new UDPTester();
        String props="udp.xml";

        for(int i=0; i < args.length; i++) {
            if("-help".equals(args[i])) {
                help();
                return;
            }
            if("-props".equals(args[i])) {
                props=args[++i];
                continue;
            }
            if("-bind_addr".equals(args[i])) {
                System.setProperty("jgroups.bind_addr", args[++i]);
                continue;
            }
            if("-mcast_addr".equals(args[i])) {
                System.setProperty("jboss.partition.udpGroup", args[++i]);
                continue;
            }
            if("-mcast_port".equals(args[i])) {
                System.setProperty("jboss.hapartition.mcast_port", args[++i]);
                continue;
            }
            help();
            return;
        }

        try {
            t.start(props);
        }
        catch(Exception e) {
            e.printStackTrace();
        }
    }

    static void help() {
        System.out.println("UDPTester  [-bind_addr <local address ip>]  [-mcast_addr <multicast address ip>] [-mcast_port <multicast  port>]");
    }

}
