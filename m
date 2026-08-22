Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC6123D2A1
	for <sashiko-reviews@lists.linux.dev>; Sat, 22 Aug 2026 12:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787403213; cv=none; b=nq0OGDD+z0ViJOEvTuLNWCR2rRjpQ0/fYEHFGnpNtbIac7jZc5n9SHhccs2s22s9agDmGFUht2LiNa9oEbq49ffHoAM1/Wy8lwvk86AQY7CzDw8uI0qJxLLJkA/xSl0N+DXcAgOg8tg/5+e3rQ9ffhykXnl/nGOxRFl+tJ/sWTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787403213; c=relaxed/simple;
	bh=UDeHOBBLogvrcdvF1NMyFzgLsxt/g+5dpK/47TsPCXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OKXicIqg2iejTNlnKyvCjO2XsEnO3mvEuOdwxzj64DCVUwWEP8AC1ZWRY1eJrzE+eyNRlQotLQ4O6vG1r9D+TwGs0+nWZG15F2OwIknMcE0M+asVmK8NTNH5R3EPB83OaXq7URP5+vvKeWriCSMGfhqlkR6I109Htre+wwEf2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=LWvy7v+f; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="LWvy7v+f"
Received: by dvalin.narfation.org (Postfix) id A9660206F1;
	Sat, 22 Aug 2026 12:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1787403205;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QV1nXjufxowvVHmjdXBSdcmtjzxdCU1yINavejuXpNM=;
	b=LWvy7v+fLck3f+kKsaC9PmTXHn7iFR7qViualuHjOB9L7P3LWVIeoqV6oeWAMUqjZi+jrL
	7HBnr5EbdH7FZ80hcuYMoR26OhfzcFstWP4/xDn/7Gkz9Cyt6XmFjjTtFC5519UJugHf/3
	vg8ysDeQFCkpj1dBDITFCpmLgg14xy8=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: marek.lindner@mailbox.org, sw@simonwunderlich.de, antonio@mandelbit.com
Subject: Re: [PATCH net 5/9] batman-adv: dat: atomically update mac addresses
Date: Sat, 22 Aug 2026 14:53:13 +0200
Message-ID: <14537989.RDIVbhacDa@sven-desktop>
In-Reply-To: <20260822095830.B06EF1F000E9@smtp.kernel.org>
References:
 <20260821094813.201800-1-sw@simonwunderlich.de>
 <20260821094813.201800-6-sw@simonwunderlich.de>
 <20260822095830.B06EF1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart14080296.dW097sEU6C";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart14080296.dW097sEU6C
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Date: Sat, 22 Aug 2026 14:53:13 +0200
Message-ID: <14537989.RDIVbhacDa@sven-desktop>
In-Reply-To: <20260822095830.B06EF1F000E9@smtp.kernel.org>
MIME-Version: 1.0

On Saturday, 22 August 2026 11:58:30 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> Will this unaligned stack array trigger an unaligned memory access trap on
> architectures that do not support hardware unaligned accesses, such as MIPS
> or SPARC?
> 
> The mac array is allocated on the stack with 1-byte alignment by default.
> It is then passed as the addr parameter into batadv_bla_check_claim(), which 
> subsequently passes it to ether_addr_copy():
> 
> net/batman-adv/bridge_loop_avoidance.c:batadv_bla_check_claim() {
>     ...
>     ether_addr_copy(search_claim.addr, addr);
>     ...
> }
> 
> Because ether_addr_copy() casts the pointers to u16 to perform 16-bit
> operations on these architectures, it strictly requires both the source and
> destination pointers to be 2-byte aligned.
> 
> Can an attacker trigger a kernel panic (denial of service) by sending an
> ARP request for an IP address already present in the node's DAT cache?

See patches below

> 
> (Note: this also applies to the other functions modified in this patch:
> batadv_dat_snoop_incoming_arp_request

No, there is no access of mac which requires u16 byte alignment

> , batadv_dat_snoop_incoming_arp_reply,

No, there is no access of mac which requires u16 byte alignment


> and batadv_dat_cache_dump_entry

No, there is no access of mac which requires u16 byte alignment


Now to the rest of the mac addresses on the stack:

This is not only a problem in this place but many other places in batman-adv 
(and was already a potential problem before this patch). Will throw around a 
lot of __aligned(2) or ether_addr_equal_unaligned in a separate patch.


diff --git i/net/batman-adv/bridge_loop_avoidance.c w/net/batman-adv/bridge_loop_avoidance.c
index f635da4b..5d108a20 100644
--- i/net/batman-adv/bridge_loop_avoidance.c
+++ w/net/batman-adv/bridge_loop_avoidance.c
@@ -663,7 +663,7 @@ static void batadv_bla_send_request(struct batadv_bla_backbone_gw *backbone_gw)
 static void batadv_bla_send_announce(struct batadv_priv *bat_priv,
 				     struct batadv_bla_backbone_gw *backbone_gw)
 {
-	u8 mac[ETH_ALEN];
+	u8 mac[ETH_ALEN] __aligned(2);
 	__be16 crc;
 
 	memcpy(mac, batadv_announce_mac, 4);
diff --git i/net/batman-adv/distributed-arp-table.c w/net/batman-adv/distributed-arp-table.c
index 011cfdc4..8672923e 100644
--- i/net/batman-adv/distributed-arp-table.c
+++ w/net/batman-adv/distributed-arp-table.c
@@ -1236,10 +1236,10 @@ bool batadv_dat_snoop_outgoing_arp_request(struct batadv_priv *bat_priv,
 {
 	struct net_device *mesh_iface = bat_priv->mesh_iface;
 	struct batadv_dat_entry *dat_entry = NULL;
+	u8 mac[ETH_ALEN] __aligned(2);
 	struct sk_buff *skb_new;
 	unsigned short vid;
 	bool ret = false;
-	u8 mac[ETH_ALEN];
 	int hdr_size = 0;
 	__be32 ip_dst;
 	__be32 ip_src;
diff --git i/net/batman-adv/mesh-interface.c w/net/batman-adv/mesh-interface.c
index 53bb9836..ddb48f0b 100644
--- i/net/batman-adv/mesh-interface.c
+++ w/net/batman-adv/mesh-interface.c
@@ -141,9 +141,9 @@ static struct net_device_stats *batadv_interface_stats(struct net_device *dev)
 static int batadv_interface_set_mac_addr(struct net_device *dev, void *p)
 {
 	struct batadv_priv *bat_priv = netdev_priv(dev);
+	u8 old_addr[ETH_ALEN] __aligned(2);
 	struct batadv_meshif_vlan *vlan;
 	struct sockaddr *addr = p;
-	u8 old_addr[ETH_ALEN];
 
 	if (!is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
@@ -220,6 +220,7 @@ static netdev_tx_t batadv_interface_tx(struct sk_buff *skb,
 	enum batadv_forw_mode forw_mode = BATADV_FORW_BCAST;
 	struct batadv_hard_iface *primary_if = NULL;
 	struct batadv_bcast_packet *bcast_packet;
+	u8 chaddr[ETH_ALEN] __aligned(2);
 	int network_offset = ETH_HLEN;
 	unsigned int header_len = 0;
 	unsigned long brd_delay = 0;
@@ -229,7 +230,6 @@ static netdev_tx_t batadv_interface_tx(struct sk_buff *skb,
 	struct ethhdr *ethhdr;
 	bool do_bcast = false;
 	u8 *dst_hint = NULL;
-	u8 chaddr[ETH_ALEN];
 	unsigned short vid;
 	bool client_added;
 	__be16 proto;
diff --git i/net/batman-adv/multicast.c w/net/batman-adv/multicast.c
index 155592ab..4a92f672 100644
--- i/net/batman-adv/multicast.c
+++ w/net/batman-adv/multicast.c
@@ -374,9 +374,9 @@ batadv_mcast_mla_meshif_get_ipv4(struct net_device *dev,
 				 struct hlist_head *mcast_list,
 				 struct batadv_mcast_mla_flags *flags)
 {
+	u8 mcast_addr[ETH_ALEN] __aligned(2);
 	struct batadv_hw_addr *new;
 	struct in_device *in_dev;
-	u8 mcast_addr[ETH_ALEN];
 	struct ip_mc_list *pmc;
 	int ret = 0;
 
@@ -441,9 +441,9 @@ batadv_mcast_mla_meshif_get_ipv6(struct net_device *dev,
 				 struct hlist_head *mcast_list,
 				 struct batadv_mcast_mla_flags *flags)
 {
+	u8 mcast_addr[ETH_ALEN] __aligned(2);
 	struct batadv_hw_addr *new;
 	struct inet6_dev *in6_dev;
-	u8 mcast_addr[ETH_ALEN];
 	struct ifmcaddr6 *pmc6;
 	int ret = 0;
 
@@ -593,10 +593,10 @@ static int batadv_mcast_mla_bridge_get(struct net_device *dev,
 				       struct batadv_mcast_mla_flags *flags)
 {
 	struct list_head bridge_mcast_list = LIST_HEAD_INIT(bridge_mcast_list);
+	u8 mcast_addr[ETH_ALEN] __aligned(2);
 	u8 tvlv_flags = flags->tvlv_flags;
 	struct br_ip_list *br_ip_entry;
 	struct batadv_hw_addr *new;
-	u8 mcast_addr[ETH_ALEN];
 	struct br_ip_list *tmp;
 	int ret;






Not 100% needed but just for completeness sake

diff --git i/net/batman-adv/bridge_loop_avoidance.c w/net/batman-adv/bridge_loop_avoidance.c
index f635da4b..1f8a6eb3 100644
--- i/net/batman-adv/bridge_loop_avoidance.c
+++ w/net/batman-adv/bridge_loop_avoidance.c
@@ -663,7 +663,7 @@ static void batadv_bla_send_request(struct batadv_bla_backbone_gw *backbone_gw)
 static void batadv_bla_send_announce(struct batadv_priv *bat_priv,
 				     struct batadv_bla_backbone_gw *backbone_gw)
 {
-	u8 mac[ETH_ALEN];
+	u8 mac[ETH_ALEN] __aligned(2);
 	__be16 crc;
 
 	memcpy(mac, batadv_announce_mac, 4);
@@ -1582,7 +1582,9 @@ static struct lock_class_key batadv_backbone_hash_lock_class_key;
  */
 int batadv_bla_init(struct batadv_priv *bat_priv)
 {
-	u8 claim_dest[ETH_ALEN] = {0xff, 0x43, 0x05, 0x00, 0x00, 0x00};
+	static const u8 claim_dest[ETH_ALEN] __aligned(2) = {
+		0xff, 0x43, 0x05, 0x00, 0x00, 0x00
+	};
 	struct batadv_hard_iface *primary_if;
 	unsigned long entrytime;
 	u16 crc;
diff --git i/net/batman-adv/distributed-arp-table.c w/net/batman-adv/distributed-arp-table.c
index 011cfdc4..ae0e45a2 100644
--- i/net/batman-adv/distributed-arp-table.c
+++ w/net/batman-adv/distributed-arp-table.c
@@ -940,7 +940,7 @@ batadv_dat_cache_dump_entry(struct sk_buff *msg, u32 portid,
 			    struct netlink_callback *cb,
 			    struct batadv_dat_entry *dat_entry)
 {
-	u8 mac[ETH_ALEN];
+	u8 mac[ETH_ALEN] __aligned(2);
 	u64 u64_mac;
 	int msecs;
 	void *hdr;
@@ -1236,10 +1236,10 @@ bool batadv_dat_snoop_outgoing_arp_request(struct batadv_priv *bat_priv,
 {
 	struct net_device *mesh_iface = bat_priv->mesh_iface;
 	struct batadv_dat_entry *dat_entry = NULL;
+	u8 mac[ETH_ALEN] __aligned(2);
 	struct sk_buff *skb_new;
 	unsigned short vid;
 	bool ret = false;
-	u8 mac[ETH_ALEN];
 	int hdr_size = 0;
 	__be32 ip_dst;
 	__be32 ip_src;
@@ -1344,10 +1344,10 @@ bool batadv_dat_snoop_incoming_arp_request(struct batadv_priv *bat_priv,
 					   struct sk_buff *skb, int hdr_size)
 {
 	struct batadv_dat_entry *dat_entry = NULL;
+	u8 mac[ETH_ALEN] __aligned(2);
 	struct sk_buff *skb_new;
 	unsigned short vid;
 	bool ret = false;
-	u8 mac[ETH_ALEN];
 	__be32 ip_src;
 	__be32 ip_dst;
 	u64 u64_mac;
@@ -1474,9 +1474,9 @@ bool batadv_dat_snoop_incoming_arp_reply(struct batadv_priv *bat_priv,
 					 struct sk_buff *skb, int hdr_size)
 {
 	struct batadv_dat_entry *dat_entry = NULL;
+	u8 mac[ETH_ALEN] __aligned(2);
 	bool dropped = false;
 	unsigned short vid;
-	u8 mac[ETH_ALEN];
 	__be32 ip_src;
 	__be32 ip_dst;
 	u64 u64_mac;
diff --git i/net/batman-adv/mesh-interface.c w/net/batman-adv/mesh-interface.c
index 53bb9836..3c95d9ce 100644
--- i/net/batman-adv/mesh-interface.c
+++ w/net/batman-adv/mesh-interface.c
@@ -141,9 +141,9 @@ static struct net_device_stats *batadv_interface_stats(struct net_device *dev)
 static int batadv_interface_set_mac_addr(struct net_device *dev, void *p)
 {
 	struct batadv_priv *bat_priv = netdev_priv(dev);
+	u8 old_addr[ETH_ALEN] __aligned(2);
 	struct batadv_meshif_vlan *vlan;
 	struct sockaddr *addr = p;
-	u8 old_addr[ETH_ALEN];
 
 	if (!is_valid_ether_addr(addr->sa_data))
 		return -EADDRNOTAVAIL;
@@ -213,13 +213,18 @@ static void batadv_interface_set_rx_mode(struct net_device *dev)
 static netdev_tx_t batadv_interface_tx(struct sk_buff *skb,
 				       struct net_device *mesh_iface)
 {
-	static const u8 ectp_addr[ETH_ALEN] = {0xCF, 0x00, 0x00, 0x00, 0x00, 0x00};
-	static const u8 stp_addr[ETH_ALEN] = {0x01, 0x80, 0xC2, 0x00, 0x00, 0x00};
 	struct batadv_priv *bat_priv = netdev_priv(mesh_iface);
 	enum batadv_dhcp_recipient dhcp_rcp = BATADV_DHCP_NO;
 	enum batadv_forw_mode forw_mode = BATADV_FORW_BCAST;
+	static const u8 ectp_addr[ETH_ALEN] __aligned(2) = {
+		0xCF, 0x00, 0x00, 0x00, 0x00, 0x00
+	};
+	static const u8 stp_addr[ETH_ALEN] __aligned(2) = {
+		0x01, 0x80, 0xC2, 0x00, 0x00, 0x00
+	};
 	struct batadv_hard_iface *primary_if = NULL;
 	struct batadv_bcast_packet *bcast_packet;
+	u8 chaddr[ETH_ALEN] __aligned(2);
 	int network_offset = ETH_HLEN;
 	unsigned int header_len = 0;
 	unsigned long brd_delay = 0;
@@ -229,7 +234,6 @@ static netdev_tx_t batadv_interface_tx(struct sk_buff *skb,
 	struct ethhdr *ethhdr;
 	bool do_bcast = false;
 	u8 *dst_hint = NULL;
-	u8 chaddr[ETH_ALEN];
 	unsigned short vid;
 	bool client_added;
 	__be16 proto;
diff --git i/net/batman-adv/multicast.c w/net/batman-adv/multicast.c
index 155592ab..4a92f672 100644
--- i/net/batman-adv/multicast.c
+++ w/net/batman-adv/multicast.c
@@ -374,9 +374,9 @@ batadv_mcast_mla_meshif_get_ipv4(struct net_device *dev,
 				 struct hlist_head *mcast_list,
 				 struct batadv_mcast_mla_flags *flags)
 {
+	u8 mcast_addr[ETH_ALEN] __aligned(2);
 	struct batadv_hw_addr *new;
 	struct in_device *in_dev;
-	u8 mcast_addr[ETH_ALEN];
 	struct ip_mc_list *pmc;
 	int ret = 0;
 
@@ -441,9 +441,9 @@ batadv_mcast_mla_meshif_get_ipv6(struct net_device *dev,
 				 struct hlist_head *mcast_list,
 				 struct batadv_mcast_mla_flags *flags)
 {
+	u8 mcast_addr[ETH_ALEN] __aligned(2);
 	struct batadv_hw_addr *new;
 	struct inet6_dev *in6_dev;
-	u8 mcast_addr[ETH_ALEN];
 	struct ifmcaddr6 *pmc6;
 	int ret = 0;
 
@@ -593,10 +593,10 @@ static int batadv_mcast_mla_bridge_get(struct net_device *dev,
 				       struct batadv_mcast_mla_flags *flags)
 {
 	struct list_head bridge_mcast_list = LIST_HEAD_INIT(bridge_mcast_list);
+	u8 mcast_addr[ETH_ALEN] __aligned(2);
 	u8 tvlv_flags = flags->tvlv_flags;
 	struct br_ip_list *br_ip_entry;
 	struct batadv_hw_addr *new;
-	u8 mcast_addr[ETH_ALEN];
 	struct br_ip_list *tmp;
 	int ret;
 






And maybe in the structs just for completeness ake (even when currently 
everything is already aligned correctly):

diff --git i/net/batman-adv/types.h w/net/batman-adv/types.h
index 9bdc5a3e..c4bfd4cd 100644
--- i/net/batman-adv/types.h
+++ w/net/batman-adv/types.h
@@ -410,7 +410,7 @@ struct batadv_orig_bat_iv {
  */
 struct batadv_orig_node {
 	/** @orig: originator ethernet address */
-	u8 orig[ETH_ALEN];
+	u8 orig[ETH_ALEN] __aligned(2);
 
 	/** @ifinfo_list: list for routers per outgoing interface */
 	struct hlist_head ifinfo_list;
@@ -634,12 +634,12 @@ struct batadv_hardif_neigh_node {
 	struct hlist_node list;
 
 	/** @addr: the MAC address of the neighboring interface */
-	u8 addr[ETH_ALEN];
+	u8 addr[ETH_ALEN] __aligned(2);
 
 	/**
 	 * @orig: the address of the originator this neighbor node belongs to
 	 */
-	u8 orig[ETH_ALEN];
+	u8 orig[ETH_ALEN] __aligned(2);
 
 	/** @if_incoming: pointer to incoming hard-interface */
 	struct batadv_hard_iface *if_incoming;
@@ -677,7 +677,7 @@ struct batadv_neigh_node {
 #endif
 
 	/** @addr: the MAC address of the neighboring interface */
-	u8 addr[ETH_ALEN];
+	u8 addr[ETH_ALEN] __aligned(2);
 
 	/** @ifinfo_list: list for routing metrics per outgoing interface */
 	struct hlist_head ifinfo_list;
@@ -777,7 +777,7 @@ struct batadv_neigh_ifinfo {
  */
 struct batadv_bcast_duplist_entry {
 	/** @orig: mac address of orig node originating the broadcast */
-	u8 orig[ETH_ALEN];
+	u8 orig[ETH_ALEN] __aligned(2);
 
 	/** @crc: crc32 checksum of broadcast payload */
 	u32 crc;
@@ -1085,7 +1085,7 @@ struct batadv_priv_bla {
 	struct batadv_hashtable *backbone_hash;
 
 	/** @loopdetect_addr: MAC address used for own loopdetection frames */
-	u8 loopdetect_addr[ETH_ALEN];
+	u8 loopdetect_addr[ETH_ALEN] __aligned(2);
 
 	/**
 	 * @loopdetect_lasttime: time when the loopdetection frames were sent
@@ -1352,7 +1352,7 @@ struct batadv_tp_vars_common {
 	struct batadv_priv *bat_priv;
 
 	/** @other_end: mac address of remote */
-	u8 other_end[ETH_ALEN];
+	u8 other_end[ETH_ALEN] __aligned(2);
 
 	/** @session: TP session identifier */
 	u8 session[2];
@@ -1765,7 +1765,7 @@ struct batadv_bla_backbone_gw {
 	 * @orig: originator address of backbone node (mac address of primary
 	 *  iface)
 	 */
-	u8 orig[ETH_ALEN];
+	u8 orig[ETH_ALEN] __aligned(2);
 
 	/** @vid: vlan id this gateway was detected on */
 	unsigned short vid;
@@ -1810,7 +1810,7 @@ struct batadv_bla_backbone_gw {
  */
 struct batadv_bla_claim {
 	/** @addr: mac address of claimed non-mesh client */
-	u8 addr[ETH_ALEN];
+	u8 addr[ETH_ALEN] __aligned(2);
 
 	/** @vid: vlan id this client was detected on */
 	unsigned short vid;
@@ -1840,7 +1840,7 @@ struct batadv_bla_claim {
  */
 struct batadv_tt_common_entry {
 	/** @addr: mac address of non-mesh client */
-	u8 addr[ETH_ALEN];
+	u8 addr[ETH_ALEN] __aligned(2);
 
 	/** @vid: VLAN identifier */
 	unsigned short vid;
@@ -1942,7 +1942,7 @@ struct batadv_tt_req_node {
 	/**
 	 * @addr: mac address of the originator this request was sent to
 	 */
-	u8 addr[ETH_ALEN];
+	u8 addr[ETH_ALEN] __aligned(2);
 
 	/** @issued_at: timestamp used for purging stale tt requests */
 	unsigned long issued_at;
@@ -1959,7 +1959,7 @@ struct batadv_tt_req_node {
  */
 struct batadv_tt_roam_node {
 	/** @addr: mac address of the client in the roaming phase */
-	u8 addr[ETH_ALEN];
+	u8 addr[ETH_ALEN] __aligned(2);
 
 	/** @vid: VLAN identifier */
 	u16 vid;
@@ -2204,7 +2204,7 @@ struct batadv_hw_addr {
 	struct hlist_node list;
 
 	/** @addr: the MAC address of this list entry */
-	unsigned char addr[ETH_ALEN];
+	unsigned char addr[ETH_ALEN] __aligned(2);
 };
 
 /**


Regards,
	Sven
--nextPart14080296.dW097sEU6C
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCaombuQAKCRBND3cr0xT1
y6F1AP9I6t8oCbObzi+0wYXLhtDq1OjAXN7IE1J2qHwJa5qCRwEA+D6F88m7OFJy
MqlUuJyR8KfcOsKZn+N4miv7DtkTLQ4=
=WDhq
-----END PGP SIGNATURE-----

--nextPart14080296.dW097sEU6C--



