Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794224267;
	b=uF1VzJ7l7hujcVxv/Ecz83muIk757u3N6fTS66LVZRmgO1lq0WLduorZeBmapPAmZQCZ
	 8dgtk2C96nS7S8duyG4OuQ63Zl0AdN/fmloZAEmGgfrrnPZI1z5XqY3CX3LWRF5e8X9ak
	 G0bhVEq9HfN1hHGcpOfNZjP40xPBL7RiF2AgJviuCcc6SRJDTW3mJZrwwaoecrDNDjy+J
	 4d1iHx+sLJy4cyO4QoqX2ybrHCqskZIZckSNR6r9qgBgsoIzvnfnEVXRm56wJeZXaj8jS
	 VA96jTg5SwyFo2R+h8jQs1N+1iQg4uJHlnlB8/dA/LO1Dn60f98BWqDeB3gSnJ2RF5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794224267;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=PRL63m1JCnXY61879gYZTrgoNvP3XpaHMthdQScuJXY=;
	b=WI8Fh690J2QQHyy/YXRvVHgz9JkaOaB6CVKg/2OJAxWO0TsAomzSwvtFnIdbH3iFqlDt
	 /hCVj+vt3ksTW4GvPuBmfl3N6kvg4kG0YDEKlgqETP6eQ6XgOJ7196VOe8oNpKDstj5sM
	 H/tYpZ7UbxrECQkp8WefbCYywTM+7hnfoYTdTfJyrxR0CLp18b2TyZcM5+/4xuLeKjt/j
	 Y8vZdNbMwEX+iJkN/1ZRow8uqs6ScHRRPNUSWOdzf+p2H4Mlabtl7BJNs16vJ3WwImJ7F
	 yVJbvdGxvW80Um+YQSMDZh5OdWewdeRM72zp6q472oymkiP7+IobyQgwExwUkKiwq3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.de;
	spf=pass smtp.mailfrom=suse.de;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FeIe9h+H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m0TxgWP2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FeIe9h+H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m0TxgWP2;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B599606A33C
	for <sashiko-reviews@lists.linux.dev>; Mon,  9 Nov 2026 11:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B599606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FeIe9h+H;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m0TxgWP2;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FeIe9h+H;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=m0TxgWP2
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 5B85A1F7C5;
	Mon,  9 Nov 2026 11:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794224265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRL63m1JCnXY61879gYZTrgoNvP3XpaHMthdQScuJXY=;
	b=FeIe9h+H4Mgvz6tLkAtMXzI1sMYIPmP6JUreacUuRnBpzFkDnOX631ABslZg30icD2j1il
	boy4Mbccw6ILsTHxJUReYiI8x/BneR8TeRudCExAg+rYEWcex8Am3aRqEuZeJsHrfeiYy8
	ioF9174EIRADEt2vqstb+JHAZJnT454=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794224265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRL63m1JCnXY61879gYZTrgoNvP3XpaHMthdQScuJXY=;
	b=m0TxgWP2LPgSk+eKMmhcMgZKCwwWBKwJYMdNx3edpmcV87UdCz6tGuFE630Ly3U+wWp40e
	3ji39LRSq6LjBUAQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1794224265; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRL63m1JCnXY61879gYZTrgoNvP3XpaHMthdQScuJXY=;
	b=FeIe9h+H4Mgvz6tLkAtMXzI1sMYIPmP6JUreacUuRnBpzFkDnOX631ABslZg30icD2j1il
	boy4Mbccw6ILsTHxJUReYiI8x/BneR8TeRudCExAg+rYEWcex8Am3aRqEuZeJsHrfeiYy8
	ioF9174EIRADEt2vqstb+JHAZJnT454=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1794224265;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=PRL63m1JCnXY61879gYZTrgoNvP3XpaHMthdQScuJXY=;
	b=m0TxgWP2LPgSk+eKMmhcMgZKCwwWBKwJYMdNx3edpmcV87UdCz6tGuFE630Ly3U+wWp40e
	3ji39LRSq6LjBUAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 4D0DB13302;
	Mon,  9 Nov 2026 11:37:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +9fIB4iw8WokMgAAD6G6ig
	(envelope-from <pfalcato@suse.de>); Mon, 09 Nov 2026 11:37:44 +0000
Date: Mon, 9 Nov 2026 11:37:42 +0000
From: Pedro Falcato <pfalcato@suse.de>
To: Kiryl Shutsemau <kirill@shutemov.name>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
	sashiko-reviews@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Hugh Dickins <hughd@google.com>, Chris Mason <mason@kernel.org>, 
	linux-mm@kvack.org, kernel-team@meta.com
Subject: Re: [PATCH] mm/memory: refuse to map page cache folios that are not
 uptodate
Message-ID: <avGwAfK4I31KAPHl@pedro-suse.tail5790ac.ts.net>
References: <20261106144323.3634477-1-kirill@shutemov.name>
 <sashiko-outbox-202966@kernel.org>
 <8cd50b75-0845-4e82-a8ed-acfd3a261a3e@kernel.org>
 <avGvM5kpv_z2ezoz@thinkstation>
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
In-Reply-To: <avGvM5kpv_z2ezoz@thinkstation>
X-Spamd-Result: default: False [-13.30 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -13.30
X-Spam-Level: 
X-Spam-Flag: NO

On Mon, Nov 09, 2026 at 11:32:44AM +0000, Kiryl Shutsemau wrote:
> On Sat, Nov 07, 2026 at 07:17:52PM +0100, David Hildenbrand (Arm) wrote:
> > > - [Medium] mm: missing folio_test_uptodate() recheck in
> > >   do_shared_fault() mkwrite path
> > 
> > Kiryl, can you look into that?
> 
> Yeah, that's legit. Will fix in v2.

Related: https://lore.kernel.org/linux-mm/as-fqjiGj5T5NLOe@casper.infradead.org/

At some point, if filesystems can randomly clear uptodate as a way to signal
writeback failure (even without the folio lock!!), these kinds of checks can
become a bit too error prone.

Perhaps we need to address this problem first?

-- 
Pedro
