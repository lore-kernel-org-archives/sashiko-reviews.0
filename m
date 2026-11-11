Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=82.195.75.108
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794418521;
	b=tMlMEYX9w3DpZ7f9IakobbuLhVKTmb/cxwknM75qFR7ICLGIsZxUClMgU5msnpU1Proh
	 nBwE2rxvEED39yoYAeRMBTsGpHK/eSUyU2NGHTRrMUosmuj2sk3iYnBKVEFndUatm9X6Y
	 /ebf3IzPlCzfy460SVH4U+hC5q3AHwums/E1MUg68iSGzdVII7bgLrMtAO9Bavr58uoXX
	 zAUwkKoKM8vqbx+xT8rJh9tiVATTHtLhpwydDdkjF2YIWYRz0+opg4A4MrG1JDLrxWcWQ
	 Mw2x1JWEmEysw9IIXTz+DlXtX9LHgiDbFF7EXHCLl0Me+1XlfSzhhI/QOkE/RofvccQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794418521;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Debian-User;
	bh=SBjsNrGoXRYjHeYNxlw6XSlAt+wBO4QS9+w7Q2owwCA=;
	b=ltVuoGGc0VvwAYdQU+eAelkCd7C68nm7V5usJ2glB7zrq9rzs6yb9//XtfacvCh/7tmh
	 3QeQiUcne0HQrpzDCL6B3ST5sd2QRe4/PYC6TKhmaeY/ZofCMQYXUqXEkYRtzHrLvSn28
	 43mvtR/yZ2LYkx3ZU7vXQYitxwiEEoMy2MtiGto3zHXMr1lAQXMefpRsOOQq+Vh7Bo0Rk
	 dw4Rs4nR37uLgGVuU8OuBc5BJagTENVk70muGH0rdxBrUVQh+tmRPaVM99xal/fSNQO7T
	 pVzNvIt9ogVTp2Y9EooucPPqXmC3cCTHKlLQPC2DnItD/3AdmK9oic4O37wgTYaGGPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=debian.org;
	spf=pass smtp.mailfrom=debian.org;
	dkim=pass header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dFJ9mwDH;
	arc=none smtp.remote-ip=82.195.75.108
Received: from stravinsky.debian.org (stravinsky.debian.org [82.195.75.108])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59F05606A31C;
	Wed, 11 Nov 2026 17:35:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59F05606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=debian.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=debian.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=debian.org header.i=@debian.org header.a=rsa-sha256 header.s=smtpauto.stravinsky header.b=dFJ9mwDH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=debian.org;
	s=smtpauto.stravinsky; h=X-Debian-User:In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=SBjsNrGoXRYjHeYNxlw6XSlAt+wBO4QS9+w7Q2owwCA=; b=dFJ9mwDH7tr5QFpcqR3mvhWYzU
	gqOVrUf6698CNa0sZlbCmngt5Hi5wiZ27BuiVZHIbWq29VRx7OnYn69+LSjm/wKlOZmcUCbe3of/r
	WkVGzBJKDus1d91p/BvWJXvClForJAWDpkDwDy7L+cmPKYLjA04YPzHfCaKDT1gMaOpKoskmRUfr5
	TDJ6/ihTQDEElJ2aInM5wCr9Y7Zi4xkwPV479vLHNRgjoNmHPqEaok/SjW5Dewyt/QiV5qX2pwrm5
	Tp32oa3PBAoSXEgViXI9qf1TzqIHiCMIX322fLiXaPAuYXQsP6xMNPNMXTeDNLw+LlVaA3GiQgV4i
	3m3MDZLg==;
Received: from authenticated-user
	by stravinsky.debian.org with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.96)
	(envelope-from <leitao@debian.org>)
	id 1xRCE1-00DLgV-2A;
	Wed, 11 Nov 2026 17:35:14 +0000
Date: Wed, 11 Nov 2026 09:35:03 -0800
From: Breno Leitao <leitao@debian.org>
To: John Ogness <john.ogness@linutronix.de>
Cc: sashiko-reviews@lists.linux.dev, Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, printk@lists.linux.dev, 
	Gustavo Luiz Duarte <gustavold@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH printk 6/6] netconsole: Always perform unsafe flushing on
 panic/kdb/restart
Message-ID: <avSXwwYEXZ6qsL4g@gmail.com>
References: <20261109123127.489676-1-john.ogness@linutronix.de>
 <20261109123127.489676-7-john.ogness@linutronix.de>
 <sashiko-outbox-207027@kernel.org>
 <87qzgrmnql.fsf@jogness.linutronix.de>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87qzgrmnql.fsf@jogness.linutronix.de>
X-Debian-User: leitao

On Wed, Nov 11, 2026 at 03:50:34PM +0106, John Ogness wrote:
> On 2026-11-10, sashiko-bot@kernel.org wrote:
> >>  	.write_thread = netconsole_write_basic,
> >>  	.write_atomic = netconsole_write_basic,
> >
> > [Severity: Critical]
> > This problem wasn't introduced by this patch, but can netconsole_write()
> > race with target list updates or device teardown [1] when called from
> > write_atomic without target_list_lock?
> >
> > While write_thread holds target_list_lock via netconsole_device_lock(),
> > write_atomic invokes netconsole_write() locklessly.  netconsole_write()
> > traverses target_list with non-RCU list_for_each_entry() and dereferences
> > nt->np.dev in netif_running(nt->np.dev) and netcons_skb_pop():
> >
> > drivers/net/netconsole.c:netconsole_write() {
> > 	...
> > 	list_for_each_entry(nt, &target_list, list) {
> > 		if (nt->extended != extended || nt->state != STATE_ENABLED ||
> > 		    !netif_running(nt->np.dev))
> > 			continue;
> > 	...
> > }
> >
> > A concurrent target addition, removal, or device release on another CPU can
> > corrupt the list traversal or cause a NULL pointer dereference or
> > use-after-free on nt->np.dev:
> >
> > CPU0                                CPU1
> > drop_netconsole_target()            netconsole_write()
> >   spin_lock_irqsave(&target_list_lock)
> >   list_del(&nt->list)
> >                                       list_for_each_entry(nt, &target_list, ...)
> >                                         <-- follows torn pointer / LIST_POISON
> > netcons_release_dev()
> >   nt->np.dev = NULL
> >                                         netif_running(nt->np.dev)
> >                                           <-- NULL pointer dereference
> >
> > [1] https://sashiko.dev/#/bug/linux-5d4ba9e4-a230-401f-bfcf-b5d9ed4aa3b5
> 
> @Breno:
> 
> One option would be to change @target_list to be an nmi-safe srcu
> protected list, such as the @console_list. In your cover page [0] for
> the RFC NBCON netconsole you mentioned it as a "next step". It is
> important if we want to use unsafe flushes from non-panic situations.
> 
> Although, we could get that for free if your "one console per target"
> patch [2] is merged. That would be an important additional benefit.

Right, and I've started to work on it with commit a9560343d4e9da
("netconsole: publish the userdata payload with RCU"), and this is on my
todo list.

IIRC the real problem is not target_list, which would be simple to move
to RCU, but the TX lock on network side (__netpoll_send_skb() ->
HARD_TX_TRYLOCK(dev, txq)), which seems to be incompatible with NMI
context, even being a trylock?
