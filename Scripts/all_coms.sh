# Command lines for the Project 2
# "Evaluating Hadoop MapReduce for Purchase Data Processing"



# Mapper and Reducer on dataset (page 3)
head -10 purchases.txt | python mapper.py | sort | python reducer.py

# Setup of HDFS (page 4)
docker cp purchases.txt hadoop:/tmp/purchases.txt
docker exec -it hadoop bash
cd $HADOOP_PREFIX
./bin/hdfs dfs -mkdir proj2
./bin/hdfs dfs -put /tmp/purchases.txt proj2

# Check if the file is here (page 5)
./bin/hdfs dfs -ls proj2


# Run in Hadoop : Vanilla (pages 5-7)
# Total income per city
./bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar -mapper mapper.py -reducer reducer.py -input proj2/purchases.txt -output proj2/output -file /tmp/mapper.py -file /tmp/reducer.py

# Start/Finish Time
bin/yarn application -status application_1792254872408_0005

# Local exec process time (page 6)
time bash -c 'cat purchases.txt | python mapper.py | sort | python reducer.py'

# HDFS vs local (page 7)
./bin/hdfs dfs -cat proj2/output/part-00000 | head -n 10
cat -10 local_output.txt | sort | head -n 10


# Run in Hadoop : Purchases 2.0 (pages 7-9)
# Total per product categories
cp /tmp/mapper.py /tmp/mapper1.py

# Local exec process time
time bash -c 'cat /tmp/purchases.txt | python /tmp/mapper1.py | sort | python /tmp/reducer.py'

# Hadoop execution time
time bash -c './bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar -mapper mapper1.py -reducer reducer.py -input proj2/purchases.txt -output proj2/output -file /tmp/mapper1.py -file /tmp/reducer.py'

# HDFS output
./bin/hdfs dfs -cat proj2/output/part-00000


# Run in Hadoop : Purchases 2.2 (pages 10-11)
# Maximum payment per city (reducer1.py)
time bash -c './bin/hadoop jar share/hadoop/tools/lib/hadoop-streaming-2.7.2.jar -mapper mapper.py -reducer reducer1.py -input proj2/purchases.txt -output proj2/output2 -file /tmp/mapper.py -file /tmp/reducer.py'

# Local exec process time
time bash -c 'cat /tmp/purchases.txt | python /tmp/mapper.py | sort | python /tmp/reducer1.py'

# HDFS output
./bin/hdfs dfs -cat proj2/output2/part-00000


# Run in Hadoop : Purchases 3.0 (pages 12-16)
# Local exec process time (mapper2 / reducer2)
time bash -c 'cat /tmp/purchases.txt | python /tmp/mapper2.py | sort | python /tmp/reducer2.py'

# YARN exec process time
time bash -c './bin/yarn jar /usr/local/hadoop/share/hadoop/tools/lib/hadoop-streaming-2.7.0.jar \
  -mapper mapper2.py \
  -reducer reducer2.py \
  -input proj2/purchases.txt \
  -output proj2/output_everything \
  -file /tmp/mapper2.py \
  -file /tmp/reducer2.py '

# Cutting the output file into subfiles (hello.txt = output file)
grep time /tmp/hello.txt > /tmp/time.txt
grep item /tmp/hello.txt > /tmp/item.txt
grep date /tmp/hello.txt > /tmp/date.txt
grep payment /tmp/hello.txt > /tmp/payment.txt
grep city /tmp/hello.txt > /tmp/city.txt

# Copy to local disk
docker cp hadoop:/tmp/time.txt ~/time.txt
docker cp hadoop:/tmp/item.txt ~/item.txt
docker cp hadoop:/tmp/date.txt ~/date.txt
docker cp hadoop:/tmp/payment.txt ~/payment.txt
docker cp hadoop:/tmp/city.txt ~/city.txt
