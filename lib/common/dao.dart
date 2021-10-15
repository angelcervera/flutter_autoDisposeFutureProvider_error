abstract class DAO<T> {
  Future<void> delete(String id);
  Future<T> retrieve(String id);
  Stream<T> retrieveStream(String id);
  Future<void> upsert(T entity);
  Future<void> update(T entity);
  Future<String> insert(T entity);
  Stream<List<T>> list();
}
