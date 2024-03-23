namespace PR2.Shared.Interfaces;

public interface IWriteRepository<T>
    where T : class
{
    Task<TTransaction> BeginTransactionAsync<TTransaction>(CancellationToken cancellationToken = default);
    
    Task<T> AddAsync(T entity, CancellationToken cancellationToken = default);

    Task UpdateAsync(T entity, CancellationToken cancellationToken = default);

    Task DeleteAsync(T entity, CancellationToken cancellationToken = default);

    Task DeleteRangeAsync(IEnumerable<T> entities, CancellationToken cancellationToken = default);

    Task<int> SaveChangesAsync(CancellationToken cancellationToken = default);
}