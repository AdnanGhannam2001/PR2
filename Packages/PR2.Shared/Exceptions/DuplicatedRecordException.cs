using PR2.Shared.Common;
using static PR2.Shared.Constants.ExceptionCodes;

namespace PR2.Shared.Exceptions;

public class DuplicatedRecordException : ExceptionBase {
    public DuplicatedRecordException(string errorMessage)
        : base("Database", errorMessage, DuplicatedRecord) { }
}