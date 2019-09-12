library(scales)
colors <- hue_pal()(12)

#random forest importance palette
pal.rf <- bind_cols(imp.rf %>% arrange(Feature) %>% 
                      select(Feature), color = colors[1:10])

#bagged trees importance palette
pal.bag <- pal.rf %>% 
  filter(Feature %in% imp.bag$Feature) %>%
  bind_rows(
    bind_cols(
      feature = imp.bag %>% 
        filter(!Feature %in% imp.rf$Feature) %>% 
        select(Feature) %>% 
        mutate(feature = Feature),
      color = colors[11:12])) %>%
  select(Feature, color) %>%
  deframe()

pal.rf %<>% deframe()