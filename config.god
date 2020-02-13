count_redis = ENV['REDIS_PAIR_COUNT'].to_i

if count_redis > 0
  for count in 1..count_redis do |count|
    God.watch do |w|
      w.name = "redis_sync_#{count}"
      w.start = "rump -from $REDIS_URI_FROM_#{count} -to $REDIS_URI_TO_#{count}"
      w.keepalive
    end
  end
end
