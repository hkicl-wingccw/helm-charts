{{/*
Expand the name of the chart.
*/}}
{{- define "hlf-ca.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "hlf-ca.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "hlf-ca.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "hlf-ca.labels" -}}
helm.sh/chart: {{ include "hlf-ca.chart" . }}
{{ include "hlf-ca.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "hlf-ca.selectorLabels" -}}
{{/*Should be used in Helm-charts repo*/}}
{{/*app: {{ .Chart.Name }}*/}}
{{/*version: {{ .Chart.Version }}*/}}
app.kubernetes.io/name: {{ include "hlf-ca.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "hlf-ca.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "hlf-ca.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
App Name
*/}}
{{- define "appname" -}}
{{- default (include "hlf-ca.fullname" .) .Values.appname }}
{{- end }}

{{/*
Org Name
*/}}
{{- define "orgname" -}}
{{- default "default-org" .Values.orgname }}
{{- end }}
