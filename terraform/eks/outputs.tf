output "eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}
output "node_group_name" {
  value = aws_eks_node_group.node_group.node_group_name
}