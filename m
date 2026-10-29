Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793315371;
	b=GNcx0T6OpDePnnslzi7acO9ShPXA8DRDgTqaxeLO2OL6JT8Vwm5hhMq4WvAdUl6AlChI
	 TA6HmtfIj9NOCuSBWMqgYlqeqO0Kh/2H68j0jjNVPhN7EkOofP7pzkNLtpUuRI4BIlHjO
	 bXNInGbLH4JBE4mmGt9CQXqM6A/6sZtCgOUBg8wC9koDQvpLW3c+EJl3xXnV1qDuBwFj0
	 Q4uCLuFLxTHw8ormK/6r0rmauC3MjC/yrP/R0Xzkg7OvSCdlyNSeImBUGRJNRp0bln0Ht
	 YRRFZhdCLCC5u8AnDZdd8JgE3WsR2gDMK2C2/ezfKy7JbuUdb/j6BhoK1OTFI61r/dQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793315371;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:
	 X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=SxAccaK9CQKKqijAxHgkuHdJDdULygHNWNh9e96YezM=;
	b=0FFbqXCx9t4ZpdUIBoNCUYq3AS7b1rGLcwp2PVJkm89QGEc+Nor5mqc73Q2MFMdJyOVd
	 jcyk1xbz6iu0NTy1JQ7h0lrYQR12UaMHNQIGJwK6oA7EmMtzfW75qIsxXvIZcqaBs09BP
	 H2C74pMQcpyqdU98jQBlzWRlxF1pMiXMX3V/L7JRyvh7L9oHBNF+4pn4b5dJIqvMExE3M
	 IZYpnCCTc2FzDNZHXILpwy8Yu6Hbj90eGk8KlRaU7/QORZ9VIuYCkO56zu5K85I5IfDOc
	 qGGCPUR1bxTTkfIv6Wz2HbULY5jPaJcqK5NBbzB/F+FtlpvQaTmWk5Ko2TPG8sLZQ5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cd9jirO9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221C7606A31D
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cd9jirO9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB3B1F01825
	for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 23:09:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793315369;
	bh=SxAccaK9CQKKqijAxHgkuHdJDdULygHNWNh9e96YezM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cd9jirO9W/+vRVFDbjADdAp0u5N2Kmb/GKL7qLaLbHWNxWybKDCURefBIedJUWnSS
	 6/wCareaJPxjAlus2f3zM2c20cRCt++ZPhvdB1eub4OjUE17sps3XjTueKFNY6BJTd
	 2Wmjt0iPz3673rly56jk1ku90ZOCLY5peM14pb9bt9+oDmgB/Mo3IU6CiHhS+Rb1wG
	 Cus/8q3uLUxCRYz5DwNQzGsMKWPXQMkxq7K6Xlebz6PMuKumBDGsNfq4xIQHIDdizP
	 ZQoTXC7m2Hg6OoXbc8mBkHDkA7pnZPa4sCpKCab2s2irMensJU2Zxb7MreQLSAcCyk
	 z/MUB6SsJ+pqQ==
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6b3dc272dcfso97443a12.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 29 Oct 2026 16:09:29 -0700 (PDT)
X-Gm-Message-State: AFq9FYI96fffOR4JlPTXBenH8MJ6+G8jxU4zD+65bQD4nf31Kn/syB0X
	dUuq36rk/Z8ujfvAAet9iXGxOPUlD/L5xs293vjjAi5mGWeREh2QEXXC1xxCk8QTUizNHK9mD72
	DEHvgNCG+/HsBhNoOK2ROgduR5o4+2Es=
X-Received: by 2002:a17:907:6c17:b0:c41:9228:baef with SMTP id
 a640c23a62f3a-c4ca7a54fa0mr46411166b.8.1793315368743; Thu, 29 Oct 2026
 16:09:28 -0700 (PDT)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261028030503.17923-1-kanchanapsridhar2026@gmail.com>
 <20261028030503.17923-6-kanchanapsridhar2026@gmail.com> <sashiko-outbox-188657@kernel.org>
 <CACpmpofjVP17TpyieQ2khsdRL+FMX9oCEcaNE9Hh+vBfGBO2dA@mail.gmail.com>
In-Reply-To: <CACpmpofjVP17TpyieQ2khsdRL+FMX9oCEcaNE9Hh+vBfGBO2dA@mail.gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Thu, 29 Oct 2026 16:09:16 -0700
X-Gmail-Original-Message-ID: <CAO9r8zMxUZxWjZaRx8ZK69qQBmd9EQ3OY3kv8DDVsuDky_7Axg@mail.gmail.com>
X-Gm-Features: AclHuK88KyLz-z--PbBy0WnVbdAZWcqI-BsmnnLL1fm3tmu9BUUE_ZogzqpNpS0
Message-ID: <CAO9r8zMxUZxWjZaRx8ZK69qQBmd9EQ3OY3kv8DDVsuDky_7Axg@mail.gmail.com>
Subject: Re: [PATCH v2 5/8] mm: zswap: Store the folio's node id in the zswap_entry.
To: "Kanchana P. Sridhar" <kanchanapsridhar2026@gmail.com>
Cc: sashiko-reviews@lists.linux.dev, hannes@cmpxchg.org, nphamcs@gmail.com, 
	chengming.zhou@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	herbert@gondor.apana.org.au, davem@davemloft.net, 
	linux-crypto@vger.kernel.org, rientjes@google.com, willy@infradead.org, 
	senozhatsky@chromium.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> > > @@ -1507,9 +1506,10 @@ static bool zswap_store_page(struct folio *fol=
io, long index,
> > >  {
> > >       swp_entry_t page_swpentry =3D folio_swap_entry(folio, index);
> > >       struct zswap_entry *entry, *old;
> > > +     int nid =3D folio_nid(folio);
> > >
> > >       /* allocate entry */
> > > -     entry =3D zswap_entry_cache_alloc(GFP_KERNEL, folio_nid(folio))=
;
> > > +     entry =3D zswap_entry_cache_alloc(GFP_KERNEL);
> > >       if (!entry) {
> > >               zswap_reject_kmemcache_fail++;
> > >               return false;
> > > @@ -1524,6 +1524,7 @@ static bool zswap_store_page(struct folio *foli=
o, long index,
> > >        * to an unrelated live pool.
> > >        */
> > >       entry->pool_idx =3D pool->idx;
> > > +     entry->nid =3D nid;
> >
> > [Severity: Medium]
> > What happens during cgroup or pool reclaim in shrink_memcg() if the swa=
pped
> > folio resides on a NUMA node without normal memory (for example, a
> > ZONE_MOVABLE-only or ZONE_HIGHMEM-only node)?
> >
> > Previously, entry_to_nid() derived the node from virt_to_page(entry), w=
hich
> > was allocated from slab with GFP_KERNEL and therefore always resided on=
 a
> > node in N_NORMAL_MEMORY.
> >
> > With entry->nid now set to folio_nid(folio) in zswap_store_page(), anon=
ymous
> > and shmem folios allocated with GFP_HIGHUSER_MOVABLE can have an entry-=
>nid
> > that is in N_MEMORY, but not in N_NORMAL_MEMORY. zswap_lru_add() insert=
s
> > those entries into zswap_list_lru for entry->nid, but shrink_memcg() on=
ly
> > walks N_NORMAL_MEMORY nodes:
> >
> > mm/zswap.c:shrink_memcg() {
> >     ...
> >         for_each_node_state(nid, N_NORMAL_MEMORY) {
> >                 unsigned long nr_to_walk =3D SWAP_CLUSTER_MAX;
> >
> >                 shrunk +=3D list_lru_walk_one(&zswap_list_lru, nid, mem=
cg,
> >                                             &shrink_memcg_cb, NULL, &nr=
_to_walk);
> >                 scanned +=3D SWAP_CLUSTER_MAX - nr_to_walk;
> >         }
> > }
> >
> > Should shrink_memcg() iterate over N_MEMORY instead of N_NORMAL_MEMORY =
so
> > that entries from movable-only or highmem-only nodes can be reclaimed b=
y
> > shrink_worker() and mem_cgroup_try_charge_zswap()?
>
> Conversely, is the previous behavior correct? The entry is created on
> a node in N_NORMAL_MEMORY, and when that node is under memory pressure
> the folio (allocated on ZONE_MOVABLE-only or ZONE_HIGHMEM-only node)
> could get written back. This doesn't resolve the memory pressure for
> the node on which the entry is allocated.

Yeah I think the previous behavior might be wrong if Sashiko is right
about the slab not being on the same node as the page.

>
> Nhat/Yosry/Johannes: Does Sashiko's suggestion for the shrink_memcg()
> modification look Ok to you?

It seems correct from a high-level but I didn't look closely.


>
> Thanks,
> Kanchana
> >
> > --
> > Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261028030503.=
17923-1-kanchanapsridhar2026@gmail.com?part=3D5
