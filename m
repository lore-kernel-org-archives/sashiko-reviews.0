Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795799816;
	b=APPNFSmx50UvWyOAgOuPIw6qfFPjAwRJKjdyp18cG3gRtEBjTHYWQ8eziRNwEkb//YL1
	 Hs7dPzh0840BHLnfVXKVWjTFyNnIudywEHnTiRe0ykXrqKPARBy9G7chiguTvpGlHRB+N
	 EyW14ARQGMOd1FDChAvLe77IbWO4Ua5SjVohusgClfIvl1XiLSvNlSN8k16wRa4k2WzpZ
	 /csyHhga9xVq/+KrlqVPQjmw7L9LtYmUiotcRfr2XPkysA19ZOpoEMdibTdMKARx40W6J
	 YT0iD4wvKNywvmW7KKxFev1FZmPUEWBJBFgdu9GLnISGJp35RxkcaTetR5fvvudYOpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795799816;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spamd-Result:X-Rspamd-Server:X-Rspamd-Action:
	 X-Spam-Flag:X-Spam-Score:X-Spam-Level:X-Rspamd-Queue-Id;
	bh=jAzXSIrHc2uUhJu/CxQuhNZ0je5ZI9pQTwHRwSeTS7g=;
	b=D5vX+7KZccivPwCu2cD6hDfRZUoVk0QUX+FrUc/2SPX2mTCfiHBk+tamoI+1UMKdE8o8
	 Etk9j7awAI1YCPRu8giUxVqqr4ZlR755VSe8vJ05a3DpiuWdMZmnXJXwZJG2VBo67J6FA
	 1QUzNuH0y7r20BMEPLuWg8xyUfD6SuaJftDvIgPVYAnKe8ubeL7tnBKom3zN9zKctVX/X
	 UTjNAvQjrptfBZ9237Lnk2klv4dXWyAy8rDdsC2zzD59RoCq50Skg+urBMsafaJC5BP76
	 6IMDZZDsVMdpdEvAOI5B5Nb7OO+P9EZfS/zXD1Gn5EkfMiVPNajbvRTpMdyUgfIA20g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=IHwPePLG;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WgJMAj7z;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=IHwPePLG;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WgJMAj7z;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A7F9606A31F
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 17:16:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A7F9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=IHwPePLG;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WgJMAj7z;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=IHwPePLG;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=WgJMAj7z
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 283ED229B0;
	Fri, 27 Nov 2026 17:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795799814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAzXSIrHc2uUhJu/CxQuhNZ0je5ZI9pQTwHRwSeTS7g=;
	b=IHwPePLGKduelpYcdvMWPc1pbPT/wqwz7lJKrydcMBw0aFpCbyz+nBWbzIMLiZCYlXvqBZ
	ivXQhPpaAmUwYqVneSacfyEd/JN4UPbZl94lFpgBiVhGy1dbcX2qlKhJzeJCXMJl60Ofo5
	iDgfeAXoEgT33VlI5s8istPZl5Nq9Xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795799814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAzXSIrHc2uUhJu/CxQuhNZ0je5ZI9pQTwHRwSeTS7g=;
	b=WgJMAj7zC77qL/I0jIS/1O9wDaSFwMAIvN5sdfbs3gXi2bD+3d9jEygZ/yFkDoF8UKuGYp
	sjQA9z2VqOQLYlCw==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=IHwPePLG;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=WgJMAj7z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795799814; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAzXSIrHc2uUhJu/CxQuhNZ0je5ZI9pQTwHRwSeTS7g=;
	b=IHwPePLGKduelpYcdvMWPc1pbPT/wqwz7lJKrydcMBw0aFpCbyz+nBWbzIMLiZCYlXvqBZ
	ivXQhPpaAmUwYqVneSacfyEd/JN4UPbZl94lFpgBiVhGy1dbcX2qlKhJzeJCXMJl60Ofo5
	iDgfeAXoEgT33VlI5s8istPZl5Nq9Xw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795799814;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jAzXSIrHc2uUhJu/CxQuhNZ0je5ZI9pQTwHRwSeTS7g=;
	b=WgJMAj7zC77qL/I0jIS/1O9wDaSFwMAIvN5sdfbs3gXi2bD+3d9jEygZ/yFkDoF8UKuGYp
	sjQA9z2VqOQLYlCw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id EF8DD13432;
	Fri, 27 Nov 2026 17:16:53 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id OEivMgW7CWtXAQAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 27 Nov 2026 17:16:53 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 814A9510B9; Fri, 27 Nov 2026 18:16:49 +0100 (CET)
Date: Fri, 27 Nov 2026 18:16:49 +0100
From: Jan Kara <jack@suse.cz>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mikhail Rudenko <xyzzy@yandex-team.ru>, 
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH v2 3/8] fs: Basic infrastructure for offloading inode
 reclaim
Message-ID: <d3rd2i3q57x6vbluvmaoay5yp3pliqj4e3nlhvckcckagqpelj@pobjh5ixkbpa>
References: <20261124113450.3451-1-jack@suse.cz>
 <20261124115850.3512-11-jack@suse.cz>
 <sashiko-outbox-233312@kernel.org>
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
In-Reply-To: <sashiko-outbox-233312@kernel.org>
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
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.com:email];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spam-Score: -13.01
X-Spam-Level: 
X-Rspamd-Queue-Id: 283ED229B0

On Wed 25-11-26 12:00:03, sashiko-bot@kernel.org wrote:
> > +static void queue_deferred_reclaim(struct super_block *sb, int count,
> > +				   struct list_head *list)
> > +{
> > +	int id = get_deferred_sb_id(sb);
> > +	struct deferred_reclaim_queue *queue =
> > +					&deferred_reclaim.queues[id];
> > +	int i, wake_count;
> > +
> > +	spin_lock(&queue->lock);
> > +	list_splice_tail(list, &queue->list);
> > +	atomic_add(count, &sb->s_deferred_reclaim_count);
> > +	spin_unlock(&queue->lock);
> > +
> > +	/* Queue works to process inodes we've added to the list */
> > +	wake_count = DIV_ROUND_UP(count, INODE_RECLAIM_BATCH_SIZE);
> > +	if (wake_count > deferred_reclaim.workers)
> > +		wake_count = deferred_reclaim.workers;
> > +	for (i = 0; i < wake_count; i++) {
> > +		queue_work(deferred_reclaim.wq,
> > +			   &deferred_reclaim.work[id]);
> > +		id = (id + 1) % deferred_reclaim.workers;
> > +	}
> > +}
> 
> [Severity: Medium]
> Can queue_deferred_reclaim() serialize deferred eviction for a superblock
> onto a single worker when inodes are queued in batches of
> INODE_RECLAIM_BATCH_SIZE (16) or fewer?
> 
> Because get_deferred_sb_id(sb) returns a fixed starting index for a given
> superblock and wake_count is computed only from the current call's count,
> any call with count <= 16 sets wake_count = 1 and only tries to queue
> deferred_reclaim.work[id].  When multiple prune_icache_sb() scans (or
> single-inode queuing from iput_final() in commit "fs: Defer reclaim of
> unlinked inodes") each add <= 16 inodes while work[id] is busy and already
> marked pending, queue_work() on work[id] returns false and the loop exits
> without waking work[id + 1] or any of the other idle workers, even if a
> large backlog has accumulated on queue->list.
> 
> Computing wake_count from the total queued count (or advancing to the next
> worker when queue_work() returns false) would allow sibling workers to help
> drain the queue via get_inode_reclaim_batch().

Correct but I don't think adding in small batches is going to be all that
common that the lower parallelism would really matter enough to complicate
the queueing code. We can reconsider if we find evidence my gut feeling is
wrong.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
