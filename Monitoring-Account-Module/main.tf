variable "source_account_org_path" {
 type = list(string)
}


resource "aws_oam_sink" "monitoring_account_oam_sink" {
 name = "Sink"
}


resource "aws_oam_sink_policy" "monitoring_account_oam_sink_policy" {
 sink_identifier = aws_oam_sink.monitoring_account_oam_sink.id


 policy = jsonencode({
   Version = "2012-10-17"
   Statement = [
     {
       Action   = ["oam:CreateLink", "oam:UpdateLink"]
       Effect   = "Allow"
       Resource = "*"
       Principal = {
         "AWS" = var.source_account_org_path
       }
       Condition = {
         "ForAllValues:StringEquals" = {
           "oam:ResourceTypes" = ["AWS::CloudWatch::Metric","AWS::Logs::LogGroup","AWS::XRay::Trace","AWS::ApplicationInsights::Application"]
         }
       }
     }
   ]
 })
}
