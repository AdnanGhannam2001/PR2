using System.Linq.Expressions;
using PR2.Shared.Common;

namespace PR2.Shared.Interfaces;

public interface IReadRepository<T>
    where T : class
{
    Task<T?> GetByIdAsync<TKey>(TKey id, CancellationToken cancellationToken = default) where TKey : notnull, IComparable;

    Task<List<T>> ListAsync(CancellationToken cancellationToken = default);

    // TODO: Add Filter
    Task<Page<T>> GetPageAsync<TKey>(int pageNumber,
        int pageSize,
        Func<T, TKey>? keySelector = null,
        bool desc = false,
        CancellationToken cancellationToken = default);

    Task<int> CountAsync(CancellationToken cancellationToken = default);
    Task<int> CountAsync(Expression<Func<T, bool>> predicate, CancellationToken cancellationToken = default);

    Task<bool> AnyAsync(CancellationToken cancellationToken = default);
    Task<bool> AnyAsync(Expression<Func<T, bool>> predicate, CancellationToken cancellationToken = default);
}