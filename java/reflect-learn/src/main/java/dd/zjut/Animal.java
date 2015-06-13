package dd.zjut;

/**
 * Created by dd on 15-6-13.
 */
public class Animal {
    enum Type {
        HIGH_IQ, LOW_IQ
    }

    private Type type;


    public void setType(Type type) {
        this.type = type;
    }

    public Type getType() {
        return type;
    }
}
