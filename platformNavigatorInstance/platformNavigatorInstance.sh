PROJECT=cp4i
STORAGECLASSFS=rook-cephfs
cat <<EOF >> platformNavigatorInstance.yaml
apiVersion: integration.ibm.com/v1beta1
kind: PlatformNavigator
metadata:
  name: $PROJECT-platform-navigator-ui
  labels:
    app: $PROJECT-platform-navigator-ui
  namespace: openshift-operators
spec:
  license:
    accept: true
    license: L-RJON-CJR2RX
  storage:
    class: $STORAGECLASSFS
  mqDashboard: true
  replicas: 1
  version: 2022.4.1
EOF
oc apply -f platformNavigatorInstance.yaml
