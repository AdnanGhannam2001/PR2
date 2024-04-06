namespace PR2.Contracts.Events;

public sealed record MemberRoleChangedEvent(string GroupId, string MemberId, string Role);