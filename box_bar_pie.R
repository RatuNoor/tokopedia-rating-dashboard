setwd("C:/Users/ratun/OneDrive - Universitas Airlangga/semester 3/UAS")
data=read.csv("datatokpedafter.csv")
head(data)

#boxplot(rating,ulasan,produk terjual, produk dijual, lama bergabung, lama balas chat)
boxplot(data$rating,
        main = "Rating's Boxplot",
        col = "orange",
        border = "brown",
        horizontal = FALSE,
        notch = TRUE
)
#ulasan
boxplot(data$ulasan,
        main = "Boxplot Ulasan",
        col = "orange",
        border = "brown",
        horizontal = FALSE,
        notch = TRUE
)
#dijual
boxplot(data$produk_dijual,
        main = "Boxplot Produk Dijual",
        col = "orange",
        border = "brown",
        horizontal = FALSE,
        notch = TRUE
)
#lama bergabung
boxplot(data$lama_bergabung,
        main = "Boxplot Lama Bergabung di Tokopedia",
        col = "orange",
        border = "brown",
        horizontal = FALSE,
        notch = TRUE
)
#lama balas chat
boxplot(data$lama_balas_chat,
        main = "Boxplot Lama Balas Chat (jam)",
        col = "orange",
        border = "brown",
        horizontal = FALSE,
        notch = TRUE
)
#pie chart(voucher)
vc = data$voucher
vc =table(vc)
vc
slices <- c(36,57)
lbls <- c("Toko dengan voucher","Toko tanpa voucher")
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels
lbls <- paste(lbls,"%",sep="") # ad % to labels
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Pie Chart of Voucher")

#pie chart rating
data = data$rating
data =table(data$rating)
library(ggplot2)
data <- data.frame(
  Rating=c("Rating 4,7","Rating 4,8","Rating 4,9","Rating 5"),
  value=c(9,18,55,11)
)

ggplot(data, aes(x="", y=value, fill=Rating)) +
  geom_bar(stat="identity", width=1, color="white") +
  coord_polar("y", start=0) +
  
  theme_void()

#barchart rating
library(ggplot2)
data <- data.frame(
  Rating=c("4.7","4.8","4.9","5"),
  value=c(9,18,55,11)
)
barplot(height=data$value, names=data$Rating, 
        col="#69b3a2",
        horiz=T, las=2,
        main = "Barchart Rating Toko",
        xlab = "Banyak Toko",
        ylab = "Rating"
)
count_rating <- table(data$rating)
count_rating
#barchart kategori produk terjual
terjual = data$produk_terjual..kategori.
data = table(terjual)
data
library(ggplot2)
data <- data.frame(
  terjual=c("0-1000","1001-5000","5001-10000",">10000"),
  value=c(45,26,9,13)
)
barplot(height=data$value, names=data$terjual, 
        col="blue",
        horiz=T, las=2,
        main = "Barchart Produk Terjual",
        xlab = "Banyak Toko"
        
)

#barchart produk terjual
count_terjual <-table(data$produk_terjual)
barplot(count_terjual, main="Barchart Produk Terjual",
        xlab = "range produk terjual",
        ylab = "banyak toko",
        names = c("0-1000", "1001-5000", "5001-10000", ">10000"),
        col = c("cyan", "blue", "purple", "magenta")
        )
count_terjual

