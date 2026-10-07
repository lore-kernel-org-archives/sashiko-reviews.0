Received: from dvalin.narfation.org (dvalin.narfation.org [213.160.73.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A38B47CA6D
	for <sashiko-reviews@lists.linux.dev>; Wed,  7 Oct 2026 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.160.73.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372778; cv=none; b=AHHDjcM0Fsyw6j32/u5EeBquuNVxUbXiKfbUvBGs1ij5QET881UDU+1oMd9P04ZmIfWWhWhn1GFwYtlGvgCn2YBTQRaibF+JjcBhZzAK0r9mkn7Ckrw89w7xQe2svacyqx4JcKZYcFSJHIkSvGUrN/AXmH7AJrG9P060SBCStQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372778; c=relaxed/simple;
	bh=Lx1d0PFUN4E9JCU1vP3d4yRmf5vo3vZRlaKuKdSu3bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CbxrhEXBuYUw7yTv1nLxbU+FgIeAr6ibmcOlDyqdcZtclOcB0nQ41lilCjBNvS7wy6a2V6lxYnAx2Ft+RSjVkOLz/WAZz10WmLXTvPxW8F/+4KMYmcBs5Di6uVto8bqHvdMzM4scJixK5Uq/CelSWvx18T+pCs00M+pYTerz/sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org; spf=pass smtp.mailfrom=narfation.org; dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b=kXF3P1+/; arc=none smtp.client-ip=213.160.73.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=narfation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=narfation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=narfation.org header.i=@narfation.org header.b="kXF3P1+/"
Received: by dvalin.narfation.org (Postfix) id EEC1E205A6;
	Wed, 07 Oct 2026 11:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
	s=20121; t=1791372757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vz04Eb2/pqjyUHQ2BJmXstIhHtluuH1DN1ZtMn0iV7c=;
	b=kXF3P1+/VW6rGSYtP1tf5XvNwSbdCS47LHppC65zClQb3EvZkFKHmHyoXgi2geFzKqmpQF
	WS6VOT2z9dDdHjDx0UN771aG1+NY2YqoRgMviRdBjEkEbnzMalYdsZXMmaYCMaNMLGXIaE
	ZrR0P2gLlF7V5RoI8+gC9W+saoNKMnk=
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: antonio@mandelbit.com, b.a.t.m.a.n@lists.open-mesh.org
Subject:
 Re: [PATCH batadv 2/4] batman-adv: tt: only update flags for TT events
Date: Wed, 07 Oct 2026 13:32:27 +0200
Message-ID: <5328232.31r3eYUQgx@sven-l14>
In-Reply-To: <sashiko-outbox-162887@kernel.org>
References:
 <20261007-tt-avoid-unhashed-event-v1-0-01c763657916@narfation.org>
 <20261007-tt-avoid-unhashed-event-v1-2-01c763657916@narfation.org>
 <sashiko-outbox-162887@kernel.org>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4959648.LvFx2qVVIh";
 micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart4959648.LvFx2qVVIh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: sashiko-reviews@lists.linux.dev
Cc: antonio@mandelbit.com, b.a.t.m.a.n@lists.open-mesh.org
Date: Wed, 07 Oct 2026 13:32:27 +0200
Message-ID: <5328232.31r3eYUQgx@sven-l14>
In-Reply-To: <sashiko-outbox-162887@kernel.org>
MIME-Version: 1.0

On Wednesday, 7 October 2026 12:54:50 CEST sashiko-bot@kernel.org wrote:
[...]
> [Severity: High]
> While this masks BATADV_TT_CLIENT_ROAM for the incremental event, doesn't the
> flag remain corrupted in the local TT entry (common->flags)?
> 
> Earlier in batadv_tt_local_refresh(), there is this structure:
> 
>                 if (common->flags & BATADV_TT_CLIENT_PENDING) {
>                         ...
>                         common->flags &= ~BATADV_TT_CLIENT_PENDING;
>                         announce = true;
>                 } else if (common->flags & BATADV_TT_CLIENT_ROAM) {
>                         ...
>                         common->flags &= ~BATADV_TT_CLIENT_ROAM;
>                         *roamed_back = true;
>                 }
> 
> When a client roams away, batadv_tt_local_mark_removed() sets both
> BATADV_TT_CLIENT_ROAM and BATADV_TT_CLIENT_PENDING.
> 
> When the client returns, batadv_tt_local_refresh() clears the PENDING flag
> but skips the else if branch. This leaves BATADV_TT_CLIENT_ROAM set
> locally and *roamed_back as false.
> 
> Consequently, won't any full TT dump (batadv_tt_tvlv_generate) erroneously
> announce the returning client as roaming, causing other nodes to mistakenly
> purge their originators for this client or blackhole traffic?
> 
> Furthermore, does the skipped roamed_back assignment prevent
> batadv_tt_local_add_roam() from freeing the global entry and reclaiming the
> client?

Antonio,

this is exactly what I meant in 
https://lore.kernel.org/batman/20261007-tt-avoid-unhashed-event-v1-0-01c763657916@narfation.org/T/#m35e1aeec45790b26b17d4f4297d77bd8d5b90450 
and which was also previously reported at 
https://www.open-mesh.org/issues/482#change-1886


Maybe needed steps are:


Clear ROAM for pending clients after readd (from local and whenever the global 
still has the client_roam set):


diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index e46040fd745ea8ed0d5b3b497e86b6f37c9c8e25..89098976e31d178829fb575546679178b0d7d0eb 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -865,13 +865,18 @@ static void batadv_tt_local_add_roam(struct batadv_priv *bat_priv,
 		return;
 
 	/* Check whether it is a roaming, but don't do anything if the roaming
-	 * process has already been handled
+	 * process has already been handled.
+	 *
+	 * A client which roamed back must always be reclaimed from the
+	 * originator(s) which sent the ROAMING_ADV. The global entry created by
+	 * this ROAMING_ADV might still carry BATADV_TT_CLIENT_ROAM because the
+	 * new originator did not yet announce the client.
 	 */
-	scoped_guard(spinlock_bh, &tt_global->common.flags_lock) {
-		if (tt_global->common.flags & BATADV_TT_CLIENT_ROAM)
-			return;
+	if (!roamed_back) {
+		scoped_guard(spinlock_bh, &tt_global->common.flags_lock) {
+			if (tt_global->common.flags & BATADV_TT_CLIENT_ROAM)
+				return;
 
-		if (!roamed_back) {
 			/* The global entry has to be marked as ROAMING and has to be
 			 * kept for consistency purpose.
 			 *
@@ -939,6 +944,7 @@ static bool batadv_tt_local_add_existing(struct batadv_priv *bat_priv,
 					 bool *roamed_back)
 {
 	struct batadv_tt_common_entry *common = &tt_local->common;
+	bool readded = false;
 
 	tt_local->last_seen = jiffies;
 
@@ -953,10 +959,14 @@ static bool batadv_tt_local_add_existing(struct batadv_priv *bat_priv,
 			 * flag can be reset like it was never enqueued
 			 */
 			common->flags &= ~BATADV_TT_CLIENT_PENDING;
-
-			return true;
+			readded = true;
 		}
 
+		/* a pending client can also carry the ROAM flag when it was
+		 * removed because of a roaming_advertisement. It must not keep
+		 * it after being re-added or it would no longer be considered
+		 * as served by this node
+		 */
 		if (common->flags & BATADV_TT_CLIENT_ROAM) {
 			batadv_dbg(BATADV_DBG_TT, bat_priv,
 				   "Roaming client %pM (vid: %d) came back to its original location\n",
@@ -971,7 +981,7 @@ static bool batadv_tt_local_add_existing(struct batadv_priv *bat_priv,
 		}
 	}
 
-	return false;
+	return readded;
 }
 
 /**





Only transmit ROAM events with DEL:


diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index 89098976e31d178829fb575546679178b0d7d0eb..b14593b6ec6d52986bbb23647420391520e37dc5 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -696,9 +696,17 @@ static void __batadv_tt_local_event(struct batadv_priv *bat_priv,
 	ether_addr_copy(tt_change_node->change.addr, common->addr);
 	tt_change_node->change.vid = htons(common->vid);
 
-	tt_change_node->change.flags = flags;
 	del_op_requested = flags & BATADV_TT_CLIENT_DEL;
 
+	/* the ROAM flag is only meaningful for the receiver in combination
+	 * with a DEL. An ADD with ROAM would be interpreted as a roaming
+	 * advertisement
+	 */
+	if (!del_op_requested)
+		flags &= ~BATADV_TT_CLIENT_ROAM;
+
+	tt_change_node->change.flags = flags;
+
 	/* check for ADD+DEL, DEL+ADD, ADD+ADD or DEL+DEL events */
 	spin_lock_bh(&bat_priv->tt.changes_list_lock);
 	changes = READ_ONCE(bat_priv->tt.local_changes);
@@ -3405,8 +3413,12 @@ static bool batadv_tt_local_valid(void *entry_ptr,
 	if (tt_flags & BATADV_TT_CLIENT_NEW)
 		return false;
 
+	/* the entry is (still) announced. A ROAM flag of an entry which is
+	 * pending to be removed must not be transmitted. Otherwise, the
+	 * receiver would handle it like a roaming advertisement
+	 */
 	if (flags)
-		*flags = tt_flags;
+		*flags = tt_flags & ~BATADV_TT_CLIENT_ROAM;
 
 	return true;
 }




Ignore ROAM for an ADD received for a global entry update via event:


diff --git a/net/batman-adv/translation-table.c b/net/batman-adv/translation-table.c
index b14593b6ec6d52986bbb23647420391520e37dc5..8dd5822c9c7128e67cd8abdb4ddce5dc0c6eec9e 100644
--- a/net/batman-adv/translation-table.c
+++ b/net/batman-adv/translation-table.c
@@ -3996,22 +3996,31 @@ static void _batadv_tt_update_changes(struct batadv_priv *bat_priv,
 				      struct batadv_tvlv_tt_change *tt_change,
 				      u16 tt_num_changes, u8 ttvn)
 {
+	u8 flags;
 	int roams;
 	int i;
 
 	for (i = 0; i < tt_num_changes; i++) {
-		if ((tt_change + i)->flags & BATADV_TT_CLIENT_DEL) {
-			roams = (tt_change + i)->flags & BATADV_TT_CLIENT_ROAM;
+		flags = (tt_change + i)->flags;
+
+		if (flags & BATADV_TT_CLIENT_DEL) {
+			roams = flags & BATADV_TT_CLIENT_ROAM;
 			batadv_tt_global_del(bat_priv, orig_node,
 					     (tt_change + i)->addr,
 					     ntohs((tt_change + i)->vid),
 					     "tt removed by changes",
 					     roams);
 		} else {
+			/* an announced client cannot have roamed away from
+			 * orig_node. Only a ROAMING_ADV is allowed to add a
+			 * global entry with the ROAM flag
+			 */
+			flags &= ~BATADV_TT_CLIENT_ROAM;
+
 			if (!batadv_tt_global_add(bat_priv, orig_node,
 						  (tt_change + i)->addr,
 						  ntohs((tt_change + i)->vid),
-						  (tt_change + i)->flags, ttvn))
+						  flags, ttvn))
 				/* In case of problem while storing a
 				 * global_entry, we stop the updating
 				 * procedure without committing the

--nextPart4959648.LvFx2qVVIh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQS81G/PswftH/OW8cVND3cr0xT1ywUCasYtywAKCRBND3cr0xT1
ywlFAQD0zQxsdEGVH60C435hHvRPKRNO6aHcZloeuWWI4CRJaQEA5Mw/qzH3XtLp
2tFkkQ2uylfCrO85zEYZJudpp36pWQw=
=1sWo
-----END PGP SIGNATURE-----

--nextPart4959648.LvFx2qVVIh--



