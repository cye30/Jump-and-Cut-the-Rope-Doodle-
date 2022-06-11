public class NodeList{
  OrbNode first, last;
  
  NodeList(FixedOrbNode fNode, float cx, float cy){
    first = fNode;
    last =  new Node(cd, cy);
    
    first.next = last;
    last.prev = first;
  }
  
  void add(Node n){
    n.prev = last.prev;
    orb.next = last;
    last.prev.next = orb;
    last.prev = orb;
  }
  
  void processAll(){
    OrbNode current = frst;
    while(current != null){
      current.move();
      current = current.next;
    }
  }
  
  void display(){
    OrbNode current = first;
    while(current != null){
      current.display();
      current = current.next;
    }
  }

}
