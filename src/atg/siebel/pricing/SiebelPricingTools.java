package atg.siebel.pricing;


import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import atg.commerce.CommerceException;
import atg.commerce.order.CommerceItem;
import atg.commerce.order.Order;
import atg.commerce.pricing.Constants;
import atg.commerce.pricing.GWPInfo;
import atg.commerce.pricing.ItemPriceInfo;
import atg.commerce.pricing.PricingContext;
import atg.commerce.pricing.PricingException;
import atg.commerce.pricing.PricingTools;
import atg.commerce.promotion.GWPManager;
import atg.commerce.promotion.GWPMultiHashKey;
import atg.repository.RepositoryItem;
import atg.service.perfmonitor.PerfStackMismatchException;
import atg.service.perfmonitor.PerformanceMonitor;
import atg.siebel.order.SiebelCommerceItem;

public class SiebelPricingTools extends PricingTools {
  
  private static final String PERFORM_MONITOR_NAME="PricingTools";
  
  /* (non-Javadoc)
   * @see atg.commerce.pricing.PricingTools#priceItemsForOrderTotal(atg.commerce.order.Order, java.util.Collection, java.util.Locale, atg.repository.RepositoryItem, java.util.Map, boolean)
   */
  protected double priceItemsForOrderTotal(Order pOrder,
      Collection pPricingModels,
      Locale pLocale,
      RepositoryItem pProfile,
      Map pExtraParameters,
      boolean pGenerateOrderRanges)
  throws PricingException
  {
    String perfName = "priceItemsForOrderTotal2";
    PerformanceMonitor.startOperation(PERFORM_MONITOR_NAME, perfName);
    boolean cancelPerfMonitor = false;

    synchronized (pOrder) {
      try {
        // make sure the ranges are in place
        if(pGenerateOrderRanges)
          getCommerceItemManager().generateRangesForOrder(pOrder);

        boolean restartPricing = false;
        double total = 0;
        do {
          total = 0;
          
  
          Map params = pExtraParameters;
          if(params == null)
            params = new HashMap();
          List infos = getItemPricingEngine().priceItems(pOrder.getCommerceItems(),
              pPricingModels,
              pLocale,
              pProfile,
              pOrder,
              params);
          if (infos != null) {           
            List<SiebelCommerceItem> flatListOfCommerceItems = new ArrayList<SiebelCommerceItem>();
            getAllCommerceItemsFromList(pOrder.getCommerceItems(), flatListOfCommerceItems);
            
            //int size = getCommerceItemCount(commerceItems);
            int size = flatListOfCommerceItems.size();
            if (isLoggingDebug()) {
              logDebug("commerceItem expanded list size == "+size);
              logDebug("infos list size == "+infos.size());
            }
            if (infos.size() != size)
              throw new PricingException(Constants.ITEM_PRICE_MISMATCH);
            for (int c=0; c<size; c++) {
              CommerceItem item = (CommerceItem)flatListOfCommerceItems.get(c);
              ItemPriceInfo info = (ItemPriceInfo)infos.get(c);
              ItemPriceInfo oldPriceInfo = item.getPriceInfo();
              item.setPriceInfo(info);
              if (isSendPromotionClosenessMessages())
                compareQualifiers(oldPriceInfo, info, pOrder, pProfile);            
            }
            List<RootCommerceItemPriceCalculator> calculators = new ArrayList<RootCommerceItemPriceCalculator>();
            Iterator iter = pOrder.getCommerceItems().iterator();
            while (iter.hasNext()) {
              SiebelCommerceItem nextCommerceItem = (SiebelCommerceItem) iter.next();
              RootCommerceItemPriceCalculator calculator = 
                  new RootCommerceItemPriceCalculator(nextCommerceItem);
              calculators.add(calculator);
            }
            total = ((SiebelOrderPricingEngine) getOrderPricingEngine()).getOrderPriceAmount(calculators);
          }
          GWPManager gwpManager = getGwpManager();
          if (gwpManager != null){
            Map<GWPMultiHashKey, GWPInfo> gwpInfos = (Map<GWPMultiHashKey, GWPInfo>)params.get(Constants.GWPINFOS_KEY);
            PricingContext pricingContext = getPricingContextFactory().createPricingContext(
                pOrder.getCommerceItems(), null, pProfile, pLocale, pOrder, null);
            restartPricing = getGwpManager().processGWPInfos(gwpInfos, pricingContext, params);
             
          }
          params.remove(Constants.GWPINFOS_KEY); 
        } while (restartPricing);
        return total;
      }
      catch (PricingException pe) {
        // Rethrow any pricing exception generated by priceItems
        cancelPerfMonitor = true;
        throw pe;
      }
      catch (CommerceException ce) {
        // Catch any commerce exception generated by getRangesForOrder
        cancelPerfMonitor = true;
        throw new PricingException(ce);
      }
      finally {
        if (pExtraParameters != null){
          pExtraParameters.remove(Constants.GWPINFOS_KEY);
        }
        
        try {
          if(cancelPerfMonitor)
            PerformanceMonitor.cancelOperation(PERFORM_MONITOR_NAME, perfName);
          else
            PerformanceMonitor.endOperation(PERFORM_MONITOR_NAME, perfName);
        } catch (PerfStackMismatchException e) {
          if (isLoggingWarning()) {
            logWarning(e);
          }
        }
      }// end finally
    }
  }
  



  /**
   * @param pCommerceItems
   * @param pNewList
   */
  protected void getAllCommerceItemsFromList(List pCommerceItems, List<SiebelCommerceItem> pNewList) {
    if (isLoggingDebug()) {
      logDebug("Entered getCommerceItemCount() :  pCommerceItems == "
          +pCommerceItems+" : pNewList == "+pNewList);
    }
    if (pCommerceItems != null && pCommerceItems.size() > 0) {
      for (Object rawObject : pCommerceItems) {
        if (rawObject instanceof SiebelCommerceItem) {
          SiebelCommerceItem nextCommerceItem = (SiebelCommerceItem) rawObject;
          pNewList.add(nextCommerceItem);
          if (nextCommerceItem.getCommerceItemCount() > 0) {
            getAllCommerceItemsFromList(nextCommerceItem.getCommerceItems(), pNewList);
          }
        }
      }
    }
    if (isLoggingDebug()) {
      logDebug("Leaving getCommerceItemCount() :  pNewList == "+pNewList);
    }
  }

  

}