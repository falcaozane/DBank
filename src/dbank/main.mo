import Debug "mo:base/Debug";
import Nat "mo:base/Nat";
import Int "mo:base/Int";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  /*
  public func greet(name : Text) : async Text {
    return "Hello, " # name # "!";
  };
  */
  stable var currentValue: Float = 300;
  currentValue := 300;

  stable var startTime = Time.now();
  startTime := Time.now();
  Debug.print(debug_show(startTime));

  //Debug.print(debug_show(currentValue));

  public func topUp(amount: Float) {
    currentValue +=amount;
    Debug.print(debug_show(currentValue));
  };

  public func withdrawl(amount: Float) {
    let tempValue: Float = currentValue - amount;
    if(tempValue>=0){
      currentValue -=amount;
      Debug.print(debug_show(currentValue));
    }
    else{
      Debug.print("Amount to large, current Balance is less")
    }
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  //topUP();
  public func compound(){
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS/1000000000;
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
};
