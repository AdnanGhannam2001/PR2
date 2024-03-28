using PR2.Shared.Common;
using static PR2.Shared.Constants.ExceptionCodes;

namespace PR2.Shared.Exceptions;

public class OperationCancelledException : ExceptionBase {
    public OperationCancelledException(string propertyName, string errorMessage)
        : base(propertyName, errorMessage, OperationCancelled) { }
}