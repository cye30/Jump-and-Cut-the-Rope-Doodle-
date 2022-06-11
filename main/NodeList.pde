public class NodeList{
  Node first, last;
  
  NodeList(Node fNode, Node candy){
    first = fNode;
    last =  candy;
    
    first.next = last;
    last.prev = first;
  }
  
  void add(Node n){
    n.prev = last.prev;
    n.next = last;
    last.prev.next = n;
    last.prev = n;
  }
  
  void processAll(){
    Node current = first.next;
    while(current != null){
      current.move();
      current = current.next;
    }
  }
  
  void display(){
    Node current = first;
    while(current != null){
      current.display();
      current = current.next;
    }
  }

}
