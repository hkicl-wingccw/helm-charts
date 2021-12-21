{{- define "common.labels.standard" -}}
app: {{ .Chart.Name }}
version: {{ .Chart.Version }}
app.kubernetes.io/name: {{ include "common.names.name" . }}
helm.sh/chart: {{ include "common.names.chart" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
 {{- end -}}
