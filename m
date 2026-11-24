Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.161
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795523983;
	b=L/qDk7yWkhlDNseQCn8+hZh0qZ14Y8LFU7c7KA2LIXf6eGW1Vq4/3ZpyRFZ+guuCf5ch
	 05gLlUWripv8FwMyxlVPyEJBHFWeegUWVatySaTa/piDwmnzTKqtCqjChqbfdemnPfI6Y
	 HbquOcHL8TjLQ5p0kaQnTGOJ3pegKhVfvRZ+SNo2MHaKwcofTDaONF5RihuZeAkKOw5Ci
	 GVADIKeujMLlgQPVKVWN8DuGzvIGPZRyFD6h6Xkzil7F5B6L21+sEi0/7JZFtVH0WNTfr
	 U+SCOZjZSlVS2RBl39Z5x3KbbEQaZ4FY8AO4nj/n4ynHrAXea/zqtjGqKJjr3bSxzuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795523983;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version:X-Rspamd-Queue-Id;
	bh=QtORVVgQvN/m+JUMAsht2JEt8w4lO9qAkjqbkmAaSCA=;
	b=TzRZ+f+b2nD9dG+ZAbh+k+g+sTxbB/WKazr6VcGTg5NbZNNmK6UI1ggZHl2hj/CXjjiq
	 WITjyM/DZ/5hBxLBOGTXTGNdu/4FICWP7uepgXRPj9nqMJkrov+CGpp6e3fotuSUhhC94
	 FrB5/0/AlEC9mC04TtWxDSccOSiN/PGIVc6y7bo51+VpUI8iqCpBIWEMWM3Hd6siML5Yf
	 n3AZfy4QNMDOh6gDo0l4m51gvJTiKBxayVeNE+rRK4JxzyYsuyDvQDbXkwiSpK+zOboB/
	 84vkgM8mk9D5FyUt4gPxqkzW1bDwK7rZZdNR2H3EdeNgvEEg+9vWhJFF3KCnuUMMUXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=steffen.cc;
	spf=pass smtp.mailfrom=steffen.cc;
	dkim=pass header.d=steffen.cc header.i=@steffen.cc header.a=rsa-sha256 header.s=MBO0001 header.b=vT8iCsfj;
	arc=none smtp.remote-ip=80.241.56.161
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139D606A31E
	for <sashiko-reviews@lists.linux.dev>; Tue, 24 Nov 2026 12:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F139D606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=steffen.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=steffen.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=steffen.cc header.i=@steffen.cc header.a=rsa-sha256 header.s=MBO0001 header.b=vT8iCsfj
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4jYj7925GvzKm5m;
	Tue, 24 Nov 2026 13:39:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=steffen.cc; s=MBO0001;
	t=1795523973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtORVVgQvN/m+JUMAsht2JEt8w4lO9qAkjqbkmAaSCA=;
	b=vT8iCsfjaMtpt0qQMoZFmWskzxyxlimRS8aq4UROs6OvNEAVpS+nmYJhfrn3qB/Q0zqUM/
	llBAEN6EJ6xj3Om7lTojm1+HdXHq420TUFge4mzWLBVo+YK6MfROilfZlKpFmQMMrWRbS8
	Zn08BcoVc2Zz1pg8wa/u6HcKs9k+kHZi6nFVTsw+fCw72iytVi2rALJUbtXLKDId19r8S9
	lto8OPXQvsAsI8MmVf7/knS7Llp5KtwvsewWJb04l8azXyPQyty2fndlwkGfISTxqTNRbf
	uFJ3DKcSrVkqydOvZIdyZKI6OCxRJkaT6he/cbXWKZMvrbD8qSm/N45IjXEFQA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of lists@steffen.cc designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=lists@steffen.cc
Message-ID: <cdf95f8fc50d0ac6374eec389ab1c9c0acd6bc84.camel@dirkwinkel.cc>
Subject: Re: [PATCH iwl-net 4/5] igc: let dev_watchdog reset the adapter
 after a Tx hang
From: Steffen Dirkwinkel <lists@steffen.cc>
To: sashiko-reviews@lists.linux.dev
Cc: intel-wired-lan@lists.osuosl.org
Date: Tue, 24 Nov 2026 13:39:31 +0100
In-Reply-To: <sashiko-outbox-230897@kernel.org>
References: <20261123-e1000e-tx-hang-v1-0-ecb4309942f1@beckhoff.com>
	 <20261123-e1000e-tx-hang-v1-4-ecb4309942f1@beckhoff.com>
	 <sashiko-outbox-230897@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.62.1 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Rspamd-Queue-Id: 4jYj7925GvzKm5m

On Tue, 2026-11-24 at 09:56 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found no new issues
> in this patch, but noticed 1 related pre-existing issue it does not
> introduce:
> - [High] igc: permanent Tx queue deadlock in igc_clean_tx_irq() [1]
> --
>=20
> commit c5dcfb32c435e778dcb0ad6b827b371a99667e5b
> Author: Steffen Dirkwinkel <s.dirkwinkel@beckhoff.com>
>=20
> igc: let dev_watchdog reset the adapter after a Tx hang
>=20
> This commit checks whether a Tx subqueue is already stopped before
> stopping it upon detecting a Tx unit hang in igc_clean_tx_irq(), so
> repeated hang reports do not keep resetting trans_start and preventing
> dev_watchdog() from resetting the adapter.
>=20
> > diff --git a/drivers/net/ethernet/intel/igc/igc_main.c b/drivers/net/et=
hernet/intel/igc/igc_main.c
> > index 1fb5f3cbe93c5..a2d383f79a29d 100644
> > --- a/drivers/net/ethernet/intel/igc/igc_main.c
> > +++ b/drivers/net/ethernet/intel/igc/igc_main.c
> > @@ -3281,8 +3281,15 @@ static bool igc_clean_tx_irq(struct igc_q_vector=
 *q_vector, int napi_budget)
> >  =09=09=09=09   tx_buffer->next_to_watch,
> >  =09=09=09=09   jiffies,
> >  =09=09=09=09   tx_buffer->next_to_watch->wb.status);
> > -=09=09=09netif_stop_subqueue(tx_ring->netdev,
> > -=09=09=09=09=09    tx_ring->queue_index);
> > +=09=09=09/* The hang is reported again on every watchdog run,
> > +=09=09=09 * but stop the queue only once: stopping it again
> > +=09=09=09 * would also restart the Tx timeout, so dev_watchdog()
> > +=09=09=09 * would never reset the adapter.
> > +=09=09=09 */
> > +=09=09=09if (!__netif_subqueue_stopped(tx_ring->netdev,
> > +=09=09=09=09=09=09      tx_ring->queue_index))
> > +=09=09=09=09netif_stop_subqueue(tx_ring->netdev,
> > +=09=09=09=09=09=09    tx_ring->queue_index);
> > =20
> >  =09=09=09/* we are about to reset, no point in enabling stuff */
> >  =09=09=09return true;
>=20
> [Severity: High]
> This problem wasn't introduced by this patch, but can a stopped Tx
> subqueue remain permanently stalled in igc_clean_tx_irq() [1] when
> CONFIG_MAX_SKB_FRAGS is large (such as 45 for BIG TCP) and the ring is
> sized to IGC_MIN_TXD (64)?

This is a problem and I can reproduce it on igc (I226) with
CONFIG_MAX_SKB_FRAGS=3D45 and "ethtool -G <if> tx 64".

This isn't a default config and isn't related to the patches though. I can =
send
a separate patch to fix it if desired.

>=20
> A couple of lines below this hunk, igc_clean_tx_irq() only wakes a stoppe=
d
> subqueue when igc_desc_unused(tx_ring) reaches TX_WAKE_THRESHOLD:
>=20
> drivers/net/ethernet/intel/igc/igc_main.c:igc_clean_tx_irq() {
> =09...
> #define TX_WAKE_THRESHOLD (DESC_NEEDED * 2)
> =09if (unlikely(total_packets &&
> =09=09     netif_carrier_ok(tx_ring->netdev) &&
> =09=09     igc_desc_unused(tx_ring) >=3D TX_WAKE_THRESHOLD)) {
> =09...
> }
>=20
> Because DESC_NEEDED is (MAX_SKB_FRAGS + 4), CONFIG_MAX_SKB_FRAGS=3D45 mak=
es
> TX_WAKE_THRESHOLD 98, while igc_desc_unused() on a 64-descriptor ring is =
at
> most 63.  Once igc_maybe_stop_tx() stops the queue, the wake condition ca=
n
> never be satisfied and the queue stays stopped until a Tx watchdog timeou=
t.
>=20
> [1] https://sashiko.dev/#/bug/linux-8616c413-3d5c-4d57-9eda-b2849ebf6eb4
