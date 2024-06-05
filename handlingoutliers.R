setwd("C:/Users/ratun/OneDrive - Universitas Airlangga/semester 3/UAS")
data <- read.csv("C:/Users/ratun/OneDrive - Universitas Airlangga/semester 3/UAS/Data kel k.csv",header=TRUE, sep=',')
head(data)


# ------------------------ handling outliers --------------------------------

#ulasan
Q1_ulasan <- quantile(data$ulasan, .25)
Q3_ulasan <- quantile(data$ulasan, .75)
IQR_ulasan <- IQR(data$ulasan)
no_outliers <- subset(data, data$ulasan > (Q1_ulasan - 1.5*IQR_ulasan) & data$ulasan < (Q3_ulasan + 1.5*IQR_ulasan))
dim(no_outliers)
no_outliers
boxplot(no_outliers$ulasan, col = "pink", main="Boxplot Ulasan after")
boxplot(data$ulasan, col = "orange", main="Boxplot Ulasan")

#produk dijual
Q1_dijual <- quantile(data$produk_dijual, .25)
Q3_dijual <- quantile(data$produk_dijual, .75)
IQR_dijual <- IQR(data$produk_dijual)
no_outliers <- subset(no_outliers, no_outliers$produk_dijual > (Q1_dijual - 1.5*IQR_dijual) & no_outliers$produk_dijual < (Q3_dijual + 1.5*IQR_dijual))
#boxplot setelah handling oulier
boxplot(no_outliers$produk_dijual, col="pink", main="Boxplot Produk Dijual After")
#boxplot sebelum
boxplot(data$produk_dijual, col = "orange", main="Boxplot Produk Dijual")
no_outliers
#rating
Q1_rating <- quantile(data$rating, .25)
Q3_rating <- quantile(data$rating, .75)
IQR_rating <- IQR(data$rating)
no_outliers <- subset(no_outliers, no_outliers$rating > (Q1_rating - 1.5*IQR_rating) & no_outliers$rating < (Q3_rating + 1.5*IQR_rating))
boxplot(no_outliers$rating, col="blue", main="Boxplot Rating After")
boxplot(data$rating, col = "orange", main="Boxplot Rating")

no_outliers
#lama bergabung
Q1_lama_bergabung <- quantile(data$lama_bergabung, .25)
Q3_lama_bergabung <- quantile(data$lama_bergabung, .75)
IQR_lama_bergabung <- IQR(data$lama_bergabung)
no_outliers <- subset(no_outliers, no_outliers$lama_bergabung > (Q1_lama_bergabung - 1.5*IQR_lama_bergabung) & no_outliers$lama_bergabung < (Q3_lama_bergabung + 1.5*IQR_lama_bergabung))
boxplot(no_outliers$lama_bergabung, col="pink", main="Boxplot Lama Bergabung After")
boxplot(data$lama_bergabung, col = "orange", main="Boxplot Lama Bergabung")
no_outliers
#Lama balas chat
Q1_lama_balas_chat <- quantile(data$lama_balas_chat, .25)
Q3_lama_balas_chat <- quantile(data$lama_balas_chat, .75)
IQR_lama_balas_chat <- IQR(data$lama_balas_chat)
no_outliers <- subset(no_outliers, no_outliers$lama_balas_chat > (Q1_lama_balas_chat - 1.5*IQR_lama_balas_chat) & no_outliers$lama_balas_chat < (Q3_lama_balas_chat + 1.5*IQR_lama_balas_chat))
boxplot(no_outliers$lama_balas_chat, col="pink", main="Boxplot Lama Balas Chat After")
boxplot(data$lama_balas_chat, col = "orange", main="Boxplot Lama Balas Chat")

is.na(no_outliers)
summary(no_outliers)
no_outliers
write.csv(no_outliers, file="datatokped+kategorik.csv")

