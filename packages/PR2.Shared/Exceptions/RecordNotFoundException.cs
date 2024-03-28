using PR2.Shared.Common;
using static PR2.Shared.Constants.ExceptionCodes;

namespace PR2.Shared.Exceptions;

public class RecordNotFoundException : ExceptionBase {
    public RecordNotFoundException(string propertyName, string errorMessage)
        : base(propertyName, errorMessage, RecordNotFound) { }
}