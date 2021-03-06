-- | module:    Network.Riak.Search
--   copyright: (c) 2016 Sentenai
--   author:    Antonio Nikishaev <me@lelf.lu>
--   license:   Apache
--
-- Solr search
--
-- http://docs.basho.com/riak/2.1.3/dev/using/search/
{-# LANGUAGE CPP #-}
module Network.Riak.Search where

#if __GLASGOW_HASKELL__ <= 708
import           Control.Applicative
#endif
import           Network.Riak.Connection.Internal
import qualified Network.Riak.Request as Req
import qualified Network.Riak.Response as Resp
import           Network.Riak.Types.Internal

-- | Get an index info for @Just index@, or get all indexes for
-- @Nothing@.
getIndex :: Connection -> Maybe Index -> IO [IndexInfo]
getIndex conn ix = Resp.getIndex <$> exchange conn (Req.getIndex ix)


-- | Search by raw 'SearchQuery' request (a bytestring) using an
-- index.
searchRaw :: Connection -> SearchQuery -> Index -> IO [SearchResult]
searchRaw conn q ix = Resp.search <$> exchange conn (Req.search q ix)
