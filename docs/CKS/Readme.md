# CKS

## Kube Native security

- Pod security standard: Enforce security predefined profile on namespace level
    - https://kubernetes.io/docs/concepts/security/pod-security-standards/
- Security context: Define access control settings at container level
    - General: https://kubernetes.io/docs/tasks/configure-pod-container/security-context/
    - Apparmor: https://kubernetes.io/docs/tutorials/security/apparmor/
    - Apparmor Wiki: https://gitlab.com/apparmor/apparmor/-/wikis/Documentation
    - Seccomp: https://kubernetes.io/docs/tutorials/security/seccomp/
- Sandbox runtime: gVisor
    - https://kubernetes.io/docs/concepts/containers/runtime-class/
- Audit
    - https://kubernetes.io/docs/tasks/debug/debug-cluster/audit/
- CSR: Issue cert for user
    - https://kubernetes.io/docs/reference/access-authn-authz/certificate-signing-requests/#normal-user
- ImagePolicyWebhook
    - https://kubernetes.io/docs/reference/access-authn-authz/admission-controllers/#imagepolicywebhook
- Networkpolicy
    - https://kubernetes.io/docs/concepts/services-networking/network-policies/

## Third party tools

- OPA: Alternative policy enforce
    - https://www.openpolicyagent.org/docs/latest/kubernetes-primer/
- Falco: BPF real time threat detection
    - https://falco.org/docs/reference/rules/examples/
    - https://falco.org/docs/reference/rules/supported-fields/