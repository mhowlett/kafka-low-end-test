import org.apache.kafka.clients.consumer.ConsumerRecord;
import org.apache.kafka.clients.consumer.ConsumerRecords;
import org.apache.kafka.clients.consumer.KafkaConsumer;
import org.apache.kafka.clients.producer.KafkaProducer;
import org.apache.kafka.clients.producer.Producer;
import org.apache.kafka.clients.producer.ProducerRecord;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Properties;

import org.apache.log4j.BasicConfigurator;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;


public class Program {

  private static void produce(int N) {

    Properties props = new Properties();
    props.put("bootstrap.servers", "localhost:9092");
    props.put("", "localhost:2181");
    props.put("acks", "all");
    props.put("retries", 0);
    props.put("batch.size", 16384);
    props.put("linger.ms", 1);

    // The total bytes of memory the producer can use to buffer records waiting to be sent to the server.
    // If records are sent faster than they can be delivered to the server the producer will either block
    // or throw an exception based on the preference specified by block.on.buffer.full.
    props.put("buffer.memory", 1000000);
    props.put("block.on.buffer.full", true);

    // The maximum size of a request. This is also effectively a cap on the maximum record size. Note that
    // the server has its own cap on record size which may be different from this. This setting will limit
    // the number of record batches the producer will send in a single request to avoid sending huge requests.
    props.put("max.request.size", 1048576);

    props.put("key.serializer", "org.apache.kafka.common.serialization.StringSerializer");
    props.put("value.serializer", "org.apache.kafka.common.serialization.StringSerializer");

    Producer<String, String> producer = new KafkaProducer<>(props);
    for(int i = 0; i < N; i++) {
      producer.send(new ProducerRecord<>("my-topic", Integer.toString(i), Integer.toString(i)));
    }

    producer.close();
  }

  private static void consume(int N) {

    Properties props = new Properties();
    props.put("bootstrap.servers", "localhost:9092");
    props.put("group.id", "test");
    props.put("enable.auto.commit", "true");
    props.put("auto.commit.interval.ms", "1000");
    props.put("session.timeout.ms", "30000");
    props.put("auto.offset.reset", "smallest");
    props.put("key.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
    props.put("value.deserializer", "org.apache.kafka.common.serialization.StringDeserializer");
    KafkaConsumer<String, String> consumer = new KafkaConsumer<>(props);
    consumer.subscribe(Arrays.asList("my-topic"));
    while (true) {
      ConsumerRecords<String, String> records = consumer.poll(100);
      for (ConsumerRecord<String, String> record : records) {
        System.out.printf("offset = %d, key = %s, value = %s", record.offset(), record.key(), record.value());
      }
      System.out.println("here");
      // consumer.commitSync();
    }
  }

  public static void main(String[] args) {
    System.out.println("starting...");

    String timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
    System.out.println(timeStamp);

    BasicConfigurator.configure();
    Logger.getRootLogger().setLevel(Level.DEBUG);

    if (args[0].equals("p")) {
      produce(Integer.parseInt(args[1]));
    } else if (args[0].equals("c")) {
      consume(Integer.parseInt(args[1]));
    } else {
      System.out.println("unknown parameter 0 - expect 'c' or 'p'.");
    }

    timeStamp = new SimpleDateFormat("yyyyMMdd_HHmmss").format(Calendar.getInstance().getTime());
    System.out.println(timeStamp);

    System.out.println("done...");
  }

}
