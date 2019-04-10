{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}

{{- define "environment.controller.name" -}}
{{- default "environment-controller" .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

