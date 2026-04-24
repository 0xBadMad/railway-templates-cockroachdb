FROM cockroachdb/cockroach:latest
CMD ["start-single-node", "--insecure=${COCKROACH_INSECURE:-true}"]
