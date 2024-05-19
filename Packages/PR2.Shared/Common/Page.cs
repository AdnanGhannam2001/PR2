using System.Collections;

namespace PR2.Shared.Common;

public class Page<T> {
    public Page(IEnumerable<T> items, int total) {
        Items = items;
        Total = total;
    }

    public IEnumerable<T> Items { get; init; }

    public int Total { get; init; }

    public override string ToString()
        => $"{Items.Count()} items out of {Total}";
}