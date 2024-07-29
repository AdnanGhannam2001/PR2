namespace PR2.RabbitMQ.Attributes;

[AttributeUsage(AttributeTargets.Class, AllowMultiple = false)]
public class QueueConsumerAttribute : Attribute
{
    public string? Name { get; set; }
}