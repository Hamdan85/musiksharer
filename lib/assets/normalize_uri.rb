def normalize_uri(uri)
  return uri if uri.is_a? URI

  uri = uri.to_s
  uri, *tail = uri.rpartition "#" if uri["#"]

  URI(URI.encode(uri) << Array(tail).join).to_s
end