Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795801450;
	b=IPsfjNTINigXF2R74gjBywGngSeXRwOAJjEX6nO8SXBKVvophUAGENH1U/xa7eqf6cQ9
	 M5jbtviQJdPpQSJpAk+1+HLxsH/AkiL71eIA1PiNxSPKva1lofK+3K0dH9t21plwyTUXT
	 kCzDV1iVAA7ocvt5UrceRK2hqfC1iRDxEhAfaNnvQfYhRcCRAqvYARiRjsqvlMDZubZsh
	 NuQGwGPoRG87qKn8YPZEDwRcKs7e6P9AKj+jrLIHDOybJ4h8YliN3IpPX2hrKCd6hNjxl
	 xsGU9ZvwL61ePjfP5fXu1XD1i9qpwJDECnOPTxoUjVGz7/SwwUCEomidUqJC/ZhaKvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795801450;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Flag:X-Spam-Level:X-Spamd-Result:X-Spam-Score;
	bh=7Egyy1vePPhNOEn0FzYth/QHCU9MBJzPS/xb+Rlwtu4=;
	b=5Eg95UeWl5jwF9hVpXhepuQeXWzVz6dQRu2wmWZ29m134r+f0yw9NB03KobOl3LqEyxA
	 2oWOYjhDs5A0CF8t0mR3RWH0cc8BCH2n9sHR6CUXFMZa2RXaJn4Ip4PUBYXHih9rlXmVT
	 xZAUZuE+1lglYmcoVeDWeg8cdfyVOoq0xkHt2uBkjicSCBX5lltNwCLUj3uc5sy49QEPg
	 CEvBHaLR9jxlgS1vrDOV3q0pKnwZYTzaF7LLA+xXQpLRd+lmDUUZT/aPIEckrHZnqbjHW
	 7CwcD3hLXL9BImUtK0NluVMz0tvqF6ikpSU5xMfLmYZs0xhqYCEQW64gox22juNNdqA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Q45v8UTn;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YYqSy+wZ;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Q45v8UTn;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YYqSy+wZ;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C4D7606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 17:44:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2C4D7606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Q45v8UTn;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YYqSy+wZ;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Q45v8UTn;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=YYqSy+wZ
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 32A96229B5;
	Fri, 27 Nov 2026 17:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795801448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Egyy1vePPhNOEn0FzYth/QHCU9MBJzPS/xb+Rlwtu4=;
	b=Q45v8UTn/pqG57nIwZvWRw7wFUKaevlaeLwlJTvg6Y2kKjyy9CwrpGpoO6ATQhmN6LUXif
	IqmvRsgbSwwGn/IT8xbeGanHnHFgjoi2B9tn6lTlSEWGbKKB1YVLoviKKLPnyjSLwqb3BB
	P4VbDkmtsF49MOSsKRWsw+hAVZ+adVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795801448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Egyy1vePPhNOEn0FzYth/QHCU9MBJzPS/xb+Rlwtu4=;
	b=YYqSy+wZkDUX+WWvdhqlrP5WaBEaNIYgupecNZmlFe5pBjV4rnfKHFKFFW3STL+yYYtCyf
	Q9X296hyctV9bACQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795801448; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Egyy1vePPhNOEn0FzYth/QHCU9MBJzPS/xb+Rlwtu4=;
	b=Q45v8UTn/pqG57nIwZvWRw7wFUKaevlaeLwlJTvg6Y2kKjyy9CwrpGpoO6ATQhmN6LUXif
	IqmvRsgbSwwGn/IT8xbeGanHnHFgjoi2B9tn6lTlSEWGbKKB1YVLoviKKLPnyjSLwqb3BB
	P4VbDkmtsF49MOSsKRWsw+hAVZ+adVo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795801448;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7Egyy1vePPhNOEn0FzYth/QHCU9MBJzPS/xb+Rlwtu4=;
	b=YYqSy+wZkDUX+WWvdhqlrP5WaBEaNIYgupecNZmlFe5pBjV4rnfKHFKFFW3STL+yYYtCyf
	Q9X296hyctV9bACQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 0938C134E8;
	Fri, 27 Nov 2026 17:44:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id VA8PNmfBCWu0HAAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 27 Nov 2026 17:44:08 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 8A7A5510C7; Fri, 27 Nov 2026 18:44:03 +0100 (CET)
Date: Fri, 27 Nov 2026 18:44:03 +0100
From: Jan Kara <jack@suse.cz>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mikhail Rudenko <xyzzy@yandex-team.ru>, 
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH v2 6/8] fs: Add throttling to deferred inode reclaim
Message-ID: <a3zxiwdovphr2vywf3kficx5hgz22log5xdbl3lupqinkzozd4@ggvcd7ux3vro>
References: <20261124113450.3451-1-jack@suse.cz>
 <20261124115850.3512-14-jack@suse.cz>
 <sashiko-outbox-233315@kernel.org>
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
In-Reply-To: <sashiko-outbox-233315@kernel.org>
X-Spam-Flag: NO
X-Spam-Level: 
X-Spamd-Result: default: False [-12.80 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_DN_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -12.80

On Wed 25-11-26 12:00:05, sashiko-bot@kernel.org wrote:
> > +	len = atomic_read(&sb->s_deferred_reclaim_count);
> > +	if (len > INODE_DEFERRED_RECLAIM_LIMIT) {
> > +		u64 delay = READ_ONCE(sb->s_deferred_reclaim_delay);
> > +		struct deferred_reclaim_delay *dd;
> > +
> > +		if (!delay)
> > +			return;
> > +
> > +		dd = kmalloc_obj(*dd, GFP_NOFS | __GFP_NORETRY);
> > +		/*
> > +		 * If the allocation failed, don't bother. Throttling is
> > +		 * approximate anyway and next time we'll throttle more.
> > +		 */
> > +		if (!dd)
> > +			return;
> 
> [Severity: Low]
> Since allocation failure is intentionally ignored here, should this include
> __GFP_NOWARN so a failed slab expansion under memory pressure does not trigger
> warn_alloc() and slab_out_of_memory() splats in dmesg?  Also, MM guidelines
> prefer scoped memalloc_nofs_save()/memalloc_nofs_restore() (or
> GFP_NOWAIT | __GFP_NOWARN) over passing GFP_NOFS directly.

Not really, I think we want a warning here if allocation fails.

> > +
> > +		/*
> > +		 * Scale the delay based on how much we exceed the limit. Wait
> > +		 * at most 4x as long as estimated time to reclaim the inode.
> > +		 */
> > +		len = min(len, 5 * INODE_DEFERRED_RECLAIM_LIMIT);
> > +		delay = div_u64(delay * (len - INODE_DEFERRED_RECLAIM_LIMIT),
> > +				INODE_DEFERRED_RECLAIM_LIMIT);
> 
> [Severity: Medium]
> Does passing nsecs_to_jiffies(dd->delay) to schedule_timeout_killable() stall
> tasks for a full jiffy whenever the scaled nanosecond delay is sub-jiffy or 0?
> 
> throttle_inode_deferred_reclaim() checks !delay and allocates dd before
> scaling delay down by (len - 8192) / 8192, so a small s_deferred_reclaim_delay
> near the limit scales to 0 ns and still queues deferred_delay_work().
> Even when the scaled delay is non-zero, any sub-jiffy value is truncated to
> 0 jiffies by nsecs_to_jiffies(), and schedule_timeout(0) does not return
> immediately: it arms a timer for jiffies + 1 and sleeps until the next timer
> tick (1 to 10 ms depending on HZ), defeating the proportional ramp-up.
> 
> Scaling delay before checking !delay and allocating dd, and sleeping with
> schedule_hrtimeout() in deferred_delay_work(), would avoid queuing 0-ns waits
> and preserve sub-jiffy delays.

Yes, I'll move the condition to avoid pointless schedule().

> > diff --git a/include/trace/events/writeback.h b/include/trace/events/writeback.h
> > index c2a5b492a71a5..d371d1112843f 100644
> > --- a/include/trace/events/writeback.h
> > +++ b/include/trace/events/writeback.h
> [ ... ]
> > +TRACE_EVENT(mark_inode_reclaim_deferred_throttle,
> > +	TP_PROTO(struct inode *inode, unsigned int len, u64 delay),
> > +	TP_ARGS(inode, len, delay),
> 
> [Severity: Low]
> This isn't a bug, but tracepoint names normally follow the subsystem_event
> convention (such as inode_reclaim_throttle, matching inode_reclaim_update_stat
> above) rather than starting with the verb mark_.

No. The trace point is named after the function where it is.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
