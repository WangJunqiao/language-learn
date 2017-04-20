
/**
  * Created by junqiao.wang on 4/11/16.
  */
abstract class Term
case class Var(name: String) extends Term
case class Fun(arg: String, body: Term) extends Term
case class App(f: Term, v: Term) extends Term

object Test {
  def main(args: Array[String]): Unit = {
    val x = Var("x");
    println(x.name)
  }
}
