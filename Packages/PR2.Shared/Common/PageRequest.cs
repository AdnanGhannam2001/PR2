using System.Linq.Expressions;

namespace PR2.Shared.Common;

public record PageRequest<T>(int PageNumber = 0,
    int PageSize = 10,
    Expression<Func<T, bool>>? Predicate = null,
    Expression<Func<T, dynamic>>? KeySelector = null,
    bool Desc = false);