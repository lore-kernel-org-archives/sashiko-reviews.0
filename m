Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794226704;
	b=Z1Z70XZg2/OTTmzETNsxhS8fEV5q4cTirnIIxEU4rNwgfFqlbocV5363WaOzpnRA3GdM
	 ASwRHz93MVfARLC4veIsqiGCwPduqdH0p2+CWcGDhtqH/sHgYBnbyT9cO+AzvDAUPzznZ
	 wFBbfz4+sr6UJFAUEBCdpOaCx34/ahLowTt0aa9a3ygCubKfOqDrhm4w+AoZLevgEeml0
	 lMN6GrMJR1YByIZsHY0n5P7C5H4kNSY5Zy6m+9NF5lZQFg6NGMb7nD7eW3KSjIqkbZwsz
	 T3dG61pD+EgBV982E649Fdtsny0Dy283ubcyuCwfGT3cRXunN+Xd/YpH4cH83YP3jJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794226704;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:
	 X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=s8QpvVpNDVewFKc/qW8KTv/Yu1CsTkwsgK7/aqBn6Vw=;
	b=qYulFmYk4eMGuanOtCHmr6glKc4usR+bIZPmbY2shllXCaH5E03cQlzHwo/qIFijMkJu
	 6lrxNmUFB2zsdkABRMjrPY1GNcRGN/cQ0U4aJFT8CdRNDIewaqc16HRXiuXtzkRU4pAi5
	 2+OYcOnURP0vkwM/W7/0c7T0V8e2BJttv9WH8psyjJrbqjnJxvDGhPNcata5newXP7BLP
	 RuA0+af0tZRr0mMd1e++WrCLOkOP8n7VLSV61g5RYEJtncstpN0U3MfixpjHK/bdwlWi4
	 BhSjF8j2MEfro9ZvLx1ofarCtb4gvtOKMplAhRqCGZbdVkO71xOTneGFL3bx6U6wqiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SIJR7PaZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1r3Ro8cV;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1Z1BTZMu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mGqoE1nd;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEFD2606A31C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 12:18:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EEFD2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=SIJR7PaZ;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=1r3Ro8cV;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=1Z1BTZMu;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=mGqoE1nd
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id D51A221E44;
	Mon,  9 Nov 2026 12:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794226702; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8QpvVpNDVewFKc/qW8KTv/Yu1CsTkwsgK7/aqBn6Vw=;
	b=SIJR7PaZ4U+XpZq2vvPgIgqvTCDwGnKA36pP50wEu8wyjZtemA+nWy2k986BZsVss1ka5f
	nCz6mXG0qCurcmfC8GSfWtiGK9MebGccxUkz5rgFUdhqqBB2N+MQF85M2vVzToTJi66HPz
	6jMN/EfDP0NjUAsrkZ+3ELZYmmOLlWk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794226702;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8QpvVpNDVewFKc/qW8KTv/Yu1CsTkwsgK7/aqBn6Vw=;
	b=1r3Ro8cVIcesg7nk8K7EtvH8t+DP10ADIvcSpKiavdtleRUwXS+mgEjIHrRwtOcdn3lb+6
	AvbBcZ5pc03M4fAw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=1Z1BTZMu;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=mGqoE1nd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794226701; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8QpvVpNDVewFKc/qW8KTv/Yu1CsTkwsgK7/aqBn6Vw=;
	b=1Z1BTZMugD6HYxTAQkRQzosn0DP13T0XGiqTTmppMxuG0rRpqQ100/xvQmywNaetv5m1TL
	iGgpm9FwtZ+sJNWE/uTcpiMQTcOuuzN4MaRw+R6zedmVynm7AziMGsrvXyexCQ/EbYxIt5
	+HmO6laH1qBjB2VQsLgJWJaVxFodxZc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794226701;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=s8QpvVpNDVewFKc/qW8KTv/Yu1CsTkwsgK7/aqBn6Vw=;
	b=mGqoE1ndjGEs5d7VGq4ZZvTVuxkzAhovZ+okVogOHVFLw5R801DXUW3Owo37UZBqmUEsdi
	vNlRjVsW9IkBxBAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C74AA13302;
	Mon,  9 Nov 2026 12:18:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id qQuAJQy68WpUXAAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 09 Nov 2026 12:18:20 +0000
Date: Mon, 9 Nov 2026 12:18:19 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Kiryl Shutsemau <kirill@shutemov.name>, 
	"David Hildenbrand (Arm)" <david@kernel.org>
Cc: sashiko-reviews@lists.linux.dev, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Hugh Dickins <hughd@google.com>, Chris Mason <mason@kernel.org>, linux-mm@kvack.org, 
	kernel-team@meta.com
Subject: Re: [PATCH] mm/memory: refuse to map page cache folios that are not
 uptodate
Message-ID: <avG5Wmrff1v-0p8G@pedro-suse.tail5790ac.ts.net>
References: <20261106144323.3634477-1-kirill@shutemov.name>
 <sashiko-outbox-202966@kernel.org>
 <8cd50b75-0845-4e82-a8ed-acfd3a261a3e@kernel.org>
 <avGvM5kpv_z2ezoz@thinkstation>
 <avGwAfK4I31KAPHl@pedro-suse.tail5790ac.ts.net>
 <avG1Rg8OyP74VIFV@thinkstation>
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
In-Reply-To: <avG1Rg8OyP74VIFV@thinkstation>
X-Spamd-Result: default: False [-13.51 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCPT_COUNT_TWELVE(0.00)[15];
	MISSING_XM_UA(0.00)[];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.de:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.51
X-Spam-Level: 
X-Rspamd-Queue-Id: D51A221E44

On Mon, Nov 09, 2026 at 11:58:18AM +0000, Kiryl Shutsemau wrote:
> On Mon, Nov 09, 2026 at 11:37:42AM +0000, Pedro Falcato wrote:
> > On Mon, Nov 09, 2026 at 11:32:44AM +0000, Kiryl Shutsemau wrote:
> > > On Sat, Nov 07, 2026 at 07:17:52PM +0100, David Hildenbrand (Arm) wrote:
> > > > > - [Medium] mm: missing folio_test_uptodate() recheck in
> > > > >   do_shared_fault() mkwrite path
> > > > 
> > > > Kiryl, can you look into that?
> > > 
> > > Yeah, that's legit. Will fix in v2.
> > 
> > Related: https://lore.kernel.org/linux-mm/as-fqjiGj5T5NLOe@casper.infradead.org/
> > 
> > At some point, if filesystems can randomly clear uptodate as a way to signal
> > writeback failure (even without the folio lock!!), these kinds of checks can
> > become a bit too error prone.
> > 
> > Perhaps we need to address this problem first?
> 
> The clearers Sashiko pointed at (ext4, ecryptfs, ntfs) hold the folio
> lock. Which one does it without?

You seem to be correct, from a quick look I can't find anyone doing this
without the folio lock. So it seems we're safe from that angle.

So the only thing we _cannot_ do is assert this on e.g an unmap (since we
stop holding the folio lock).

-- 
Pedro
