public class NodeList{
  NodeList(FixedOrbNode fNode, float cx, float cy){
    first = fNode;
    last =  new Node(cd, cy);
    
    first.next = last;
    last.prev = first;
  }

}
