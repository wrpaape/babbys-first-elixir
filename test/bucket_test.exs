defmodule KV.BucketTest do
  use ExUnit.Case, async: true
  import KV.Bucket

  setup do
    {:ok, bucket} = start_link
    {:ok, bucket: bucket}
  end

  def get_assert(bucket, key, value) do
    assert get(bucket, key) == value
  end

  test "stores values by key", %{bucket: bucket} do
    get_assert(bucket, "milk", nil)

    put(bucket, "milk", 3)
    get_assert(bucket, "milk", 3)
  end

  test "deletes values by key", %{bucket: bucket} do
    put(bucket, "orange_juice", true)
    get_assert(bucket, "orange_juice", true)

    delete(bucket, "orange_juice")
    get_assert(bucket, "orange_juice", nil)
  end
end