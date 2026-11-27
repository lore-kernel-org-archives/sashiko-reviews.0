Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799980;
	b=g7T8bUxqFtfSRAZFSali67STHIwDsCTMuPYg/0xyMY3NbW+76PvJCgXgfa4VOMEOLx++
	 aGOkiH9rKX1qbQskvqvbR/W43yD5YZtBnpDzBKA9rdJRjVRIyGx+Z2YBJ+Jt9Lsw5VqA8
	 NWiV0/5maUXmvC/LmFGdmypF9TkVnaanR2/IuRsGfN+qrlx7b1xx96q5OlPVlhMXGaOL/
	 0qP2TolG2+MHkkTCj7A9DGu2maZidA9tqgEBxUZJloigWEaR2/42kB7Suqhe2OTTNFhRV
	 Cst51/kglvOUjDVKdDWDS8b9G/CN+B3Wfm8675EhT6v8+PgypRYWwthG+b/sh4oFPOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799980;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=5eEaGQs+qlzFDOnTZyKR6/iEQUt0A17EVipFCA5PZns=;
	b=4NTuz21FfwE+aJeTXQXyvxW+DKpry5IvSd/CH1pjFcza7XbQvyNBAmL7odmCzpG5BYPs
	 /w5s205yT3RoibesfuiH7DSIU1VuSoeAiQpy8H0wKVZPeGvtPKvQoczXvB3BYzgnEJusz
	 eEnqjDYmQEbTJjBghjKgBMtq6ePbtNwNL0b5DMr6NJvqiDv2/cqyfjflr53ZLOycaNTHZ
	 43xgrQk41S+efw1HhrEMceKiVEG7yomCF4GTq9yYiKN0g3gEApbCXMTqpEsXoTh2lVUib
	 ENQYdCI+Cm1+xdpeuIOzg0Xaw65zRemnb35Stv0JAcW99uwgC5PCRXJwLKIsF2Ka61g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=R9tqx0ap;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6rdCS3uh;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=2zpsBrb0;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tYGG06th;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE4C606A324
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 17:19:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDE4C606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=R9tqx0ap;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=6rdCS3uh;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=2zpsBrb0;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=tYGG06th
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 11AB4229B3;
	Fri, 27 Nov 2026 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795799978; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eEaGQs+qlzFDOnTZyKR6/iEQUt0A17EVipFCA5PZns=;
	b=R9tqx0apWJGnNiFVKnIgJX7kf0enA+iHKa9iU+m+lujnRAmeHr/RVWssBXy4bm5h50zM/N
	W+UMkuXoSxQvXDJfHNl8E4DN4CrwJzrw71+7EfdnCgeklY9/Kn+uDIwe4nb2OBLWkEQoz6
	/QxWv9OZK7mK28E7mvFEHV7UumDrM0A=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795799978;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eEaGQs+qlzFDOnTZyKR6/iEQUt0A17EVipFCA5PZns=;
	b=6rdCS3uhdntV0GPzxx9bemPkRVt5e2wLZryT39CmtQYsuWsnATHC/jyyFNW4rvuPatvuWk
	Nj5p/svxUYtZh+Cw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=2zpsBrb0;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=tYGG06th
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795799977; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eEaGQs+qlzFDOnTZyKR6/iEQUt0A17EVipFCA5PZns=;
	b=2zpsBrb0xlk4JmqXOUkxAhNu152KICb+DWgtLP/fPOB6I15TTW3QUeLINWqA0MGvudDFGP
	wiKVCd2DFq5FjYXU7r/ZSeVuAjcFCeTcaXSzXGRtoDwQBcHYe8u54j3Er5nR/dPp4mqvYK
	pfgAQq278GOt4ugC41J/QC0oL6sN4RY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795799977;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5eEaGQs+qlzFDOnTZyKR6/iEQUt0A17EVipFCA5PZns=;
	b=tYGG06thAG3zeOLexa1+0RNFEz2x0ndtWUp+2ycm7wf54LviMbkLEzQ3LrO0GRoan2zygF
	tr0tXYBrHn9escAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D9CDA134F4;
	Fri, 27 Nov 2026 17:19:36 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id ZMz6LKi7CWvZAwAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 27 Nov 2026 17:19:36 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 625E5510BB; Fri, 27 Nov 2026 18:19:36 +0100 (CET)
Date: Fri, 27 Nov 2026 18:19:36 +0100
From: Jan Kara <jack@suse.cz>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mikhail Rudenko <xyzzy@yandex-team.ru>, 
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH v2 4/8] fs: Defer reclaim of unlinked inodes
Message-ID: <d5g4uper5qb7gmypl7qokgr6k6m6ave6vb5u4p3zk2pwyqskvd@422bmdwvrqs6>
References: <20261124113450.3451-1-jack@suse.cz>
 <20261124115850.3512-12-jack@suse.cz>
 <sashiko-outbox-233313@kernel.org>
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
In-Reply-To: <sashiko-outbox-233313@kernel.org>
X-Spamd-Result: default: False [-13.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,suse.cz:email,suse.cz:dkim,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 11AB4229B3

On Wed 25-11-26 12:00:05, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] fs: single-worker serialization in iput_final() via
>   queue_deferred_reclaim()
> --
> 
> commit 8449483727b2bbcd575fed1bb97c8ea7882097a9
> Author: Jan Kara <jack@suse.cz>
> 
> fs: Defer reclaim of unlinked inodes
> 
> This commit offloads the eviction of unlinked inodes to the deferred reclaim
> workqueue when the last reference is dropped from a memory reclaim context.
> 
> > diff --git a/fs/inode.c b/fs/inode.c
> > index 8853eb6015dc0..2977d5f1382b9 100644
> > --- a/fs/inode.c
> > +++ b/fs/inode.c
> > @@ -2240,6 +2240,23 @@ static void iput_final(struct inode *inode)
> >  	inode_lru_list_del(inode);
> >  	spin_unlock(&inode->i_lock);
> >  
> > +	/*
> > +	 * Are we going to delete this inode while in reclaim path? Likely
> > +	 * reclaim of some object (e.g. overlayfs inode) ended up dropping the
> > +	 * last reference to an already deleted inode. Offload the eviction as
> > +	 * it's likely to require memory allocations and block on IO. Since
> > +	 * this eviction was triggered by a reclaim of unrelated object, the
> > +	 * inode is already outliving the operation that originally deleted it
> > +	 * (unlink, file close...). A slightly longer delay thus should not be
> > +	 * observable by userspace.
> > +	 */
> > +	if (current->flags & PF_MEMALLOC && !inode->i_nlink) {
> > +		LIST_HEAD(defer);
> > +
> > +		list_add(&inode->i_lru, &defer);
> > +		queue_deferred_reclaim(sb, 1, &defer);
> > +		return;
> > +	}
> 
> [Severity: Medium]
> Does passing count = 1 to queue_deferred_reclaim() here serialize all
> deferred unlinked inode evictions for a superblock onto a single worker?
> 
> queue_deferred_reclaim() starts at id = get_deferred_sb_id(sb) and computes
> how many workers to wake from the per-call count rather than the total queued
> inodes:
> 
> fs/inode.c:queue_deferred_reclaim() {
> 	...
> 	wake_count = DIV_ROUND_UP(count, INODE_RECLAIM_BATCH_SIZE);
> 	if (wake_count > deferred_reclaim.workers)
> 		wake_count = deferred_reclaim.workers;
> 	for (i = 0; i < wake_count; i++) {
> 		queue_work(deferred_reclaim.wq,
> 			   &deferred_reclaim.work[id]);
> 		id = (id + 1) % deferred_reclaim.workers;
> 	}
> }
> 
> Because iput_final() queues one inode at a time, wake_count is always 1 and
> only deferred_reclaim.work[id] for that superblock's hash id is ever queued.
> When reclaim (such as overlayfs dcache/icache shrinking) drops the last
> reference to many unlinked upper inodes, the remaining workers in
> deferred_reclaim.work are never woken, throttling background inode deletion to
> one thread.

Ok, here we'd be really waking only one worker and I agree some parallelism
in this path might be good. I'll think a bit if we can improve it.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
