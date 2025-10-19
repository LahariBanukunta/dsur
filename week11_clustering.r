#Week 11: Clustering Model:
#a) Clustering algorithms for unsupervised classification.
data(iris)
iris_scaled <- scale(iris[, 1:4])

# K-Means Clustering
set.seed(123)
kmeans_model <- kmeans(iris_scaled, centers = 3, nstart = 25)
iris$Cluster_KMeans <- as.factor(kmeans_model$cluster)
print(table(iris$Cluster_KMeans, iris$Species))

# Hierarchical Clustering
dist_matrix <- dist(iris_scaled)
hclust_model <- hclust(dist_matrix, method = "complete")
clusters_hc <- cutree(hclust_model, k = 3)
iris$Cluster_HC <- as.factor(clusters_hc)
print(table(iris$Cluster_HC, iris$Species))


#b) Plot the cluster data using R visualizations.
data(iris)
iris_scaled <- scale(iris[, 1:4])

# K-Means Clustering
set.seed(123)
kmeans_model <- kmeans(iris_scaled, centers = 3, nstart = 25)
iris$Cluster_KMeans <- as.factor(kmeans_model$cluster)
plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Cluster_KMeans, pch = 19)
legend("topright", legend = levels(iris$Cluster_KMeans), col = 1:3, pch = 19)

# Hierarchical Clustering
hclust_model <- hclust(dist(iris_scaled), method = "complete")
clusters_hc <- cutree(hclust_model, k = 3)
iris$Cluster_HC <- as.factor(clusters_hc)
plot(iris$Petal.Length, iris$Petal.Width, col = iris$Cluster_HC, pch = 19)
legend("topright", legend = levels(iris$Cluster_HC), col = 1:3, pch = 19)

# Dendrogram
plot(hclust_model, labels = clusters_hc, cex = 0.7)
