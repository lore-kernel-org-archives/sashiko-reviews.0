Received: from mail.aperture-lab.de (mail.aperture-lab.de [116.203.183.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDD0239068
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 01:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=116.203.183.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791335620; cv=none; b=aQboi6bL9KAZ+KcVMSKyzTr9PY19znDjL8pROBPWZaQB7MaZowyvsSN6bROSodk0rJ/Jq0ewu4Ey+7DrE0UfqkWU+qWuODmKnvZxsdHsXbhI9Dr/AK2OEJFyH19KxK2uyog56YUY+7aoeIN6n9CwK/sflGYjC5ksI0H4B9Hp5wQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791335620; c=relaxed/simple;
	bh=fQP1OwswE3OJUY42u89IjQ9Z6vXG8Bj2/UIL7LWsd2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=q87u7JyhsHI9YY5CCW2f+8c0Vraf/FZyUrR+bgGV1XVuUkGHkyY/9NXLaO/VLMM2214oNvghHTDb1Ij7STD/C/66JufZs+UmIyH/aLyGM68fO7U44ypKzV1AJMuiIijSjDaygbqmPBPiktKvIl9zQMcIyIGzJ0ERP+vI+0/ORoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue; spf=pass smtp.mailfrom=c0d3.blue; arc=none smtp.client-ip=116.203.183.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=c0d3.blue
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=c0d3.blue
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C2FC920649;
	Wed, 07 Oct 2026 03:08:04 +0200 (CEST)
Date: Wed, 7 Oct 2026 03:08:03 +0200
From: Linus =?utf-8?Q?L=C3=BCssing?= <linus.luessing@c0d3.blue>
To: b.a.t.m.a.n@lists.open-mesh.org, sashiko-reviews@lists.linux.dev
Cc: sven@narfation.org, marek.lindner@mailbox.org, sw@simonwunderlich.de,
	antonio@mandelbit.com
Subject: Re: [batadv,v14 5/5] batman-adv: avoid superfluous DAT DHT_PUT
 additions to local DAT
Message-ID: <asWbc64vRQgTKt9E@sellars>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261006185037.27163-6-linus.luessing@c0d3.blue>
X-Last-TLS-Session-Version: TLSv1.3

On Tue, Oct 06, 2026 at 07:02:00PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] batadv: CPU exhaustion DoS via O(N) candidate selection in softirq

I think we have this situation already for ARP Replies, even without
this patchset (though limited to the local node)? And avoiding that
seems like it would need quite some rework.

Besides, at least in Gluon we have ARP ratelimiting via
ebtables anyway, as we've had some devices, probably some funny
mobile apps, scanning the full /20 IP range, leading to a lot of
ARP traffic:
https://github.com/freifunk-gluon/gluon/tree/main/package/gluon-ebtables-limit-arp
So we wouldn't be (that) affected and I think any larger and especially
publically accessible batman-adv network should configure such
rate-limiting via netfilter anyway.


> - [Medium] batadv: UAPI source compatibility breakage via reserved field rename

I would have thought that for a field called "reserved" it would
be clear that it'd be subject to change in the future.

Or should I introduce a "struct batadv_unicast_4addr_v2_packet"?


> --
> 
> commit ad436b7e22433bb29047a461fbcafbd08d11c4a3
> Author: Linus Lüssing <linus.luessing@c0d3.blue>
> 
> batman-adv: avoid superfluous DAT DHT_PUT additions to local DAT
> 
> This commit adds a flag to DHT_PUT messages to indicate which pair is
> supposed to be added to the local DHT. This avoids populating the local
> DHT with unnecessary entries that will likely never be queried.
> 
> > diff --git a/include/uapi/linux/batadv_packet.h b/include/uapi/linux/batadv_packet.h
> > index 32436560ecc8b..2a7928fa5195a 100644
> > --- a/include/uapi/linux/batadv_packet.h
> > +++ b/include/uapi/linux/batadv_packet.h
> 
> [ ... ]
> 
> > @@ -445,13 +445,13 @@ struct batadv_unicast_packet {
> >   * @u: common unicast packet header
> >   * @src: address of the source
> >   * @subtype: packet subtype
> > - * @reserved: reserved byte for alignment
> > + * @flags: packet subtype specific flags
> >   */
> >  struct batadv_unicast_4addr_packet {
> >  	struct batadv_unicast_packet u;
> >  	__u8 src[ETH_ALEN];
> >  	__u8 subtype;
> > -	__u8 reserved;
> > +	__u8 flags;
> 
> [Severity: Medium]
> Does renaming the reserved field to flags in the UAPI structure
> batadv_unicast_4addr_packet break source compatibility? Any user-space
> applications referencing the old reserved field name might fail to compile
> after this change.
> 
> >  	/* "4 bytes boundary + 2 bytes" long to make the payload after the
> >  	 * following ethernet header again 4 bytes boundary aligned
> >  	 */
> > diff --git a/net/batman-adv/distributed-arp-table.c b/net/batman-adv/distributed-arp-table.c
> > index 0acb129cf4c5f..3c96c42153685 100644
> > --- a/net/batman-adv/distributed-arp-table.c
> > +++ b/net/batman-adv/distributed-arp-table.c
> 
> [ ... ]
> 
> > @@ -562,6 +565,20 @@ static inline void
> >  batadv_dat_dht_entry_add(struct batadv_priv *bat_priv, __be32 ip,
> >  			 u8 *mac_addr, unsigned short vid)
> >  {
> > +	/* Happens if a new node just beat us as a candidate, an old node
> > +	 * does not have the more specific candidate selection enhancements yet
> > +	 * or if future protocol enhancements, which this node does not have
> > +	 * yet, added new/other candidate selections. For compatibility reasons
> > +	 * do not bail out here.
> > +	 */
> > +	if (!batadv_dat_dht_check_self_is_candidate(bat_priv, ip, vid)) {
> 
> [Severity: High]
> Does calling batadv_dat_dht_check_self_is_candidate() unconditionally in
> batadv_dat_dht_entry_add() during the receive path introduce a denial of
> service vector?
> 
> Looking at batadv_dat_dht_check_self_is_candidate(), it calls
> batadv_dat_select_candidates() which performs a GFP_ATOMIC allocation and
> iterates over the originator hash. Since batadv_dat_dht_entry_add() can be
> triggered from softirq context when processing incoming packets, could an
> attacker send a flood of DHT_PUT messages to exhaust CPU resources and memory?
> 
> > +		batadv_inc_counter(bat_priv,
> > +				   BATADV_CNT_DAT_DHT_ADD_NOT_CANDIDATE);
> > +		batadv_dbg(BATADV_DBG_DAT, bat_priv,
> > +			   "Adding %pI4 %pM (vid: %d), although we are not a candidate\n",
> > +			   &ip, mac_addr, batadv_print_vid(vid));
> > +	}
> > +
> >  	batadv_dat_entry_add(bat_priv, bat_priv->dat.dht_hash, ip, mac_addr,
> >  			     vid, "dht");
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261006185037.27163-1-linus.luessing@c0d3.blue?part=5
