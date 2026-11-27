Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795809827;
	b=M0TgLtkRKForciRmIz7bikis7+1VMWXxg++o9GsbTfKml5+8m4ZFTCWlGeiM6NwSyuu2
	 NvbngzBDtw86snClfi9hztXGgOAdLREqb5VwOfdwVPRVNH1NVze+E+8dU/LcsNSkGVh5P
	 ybiVkcqc3WWhGawRCnsMQRKKJU0sqA7drB8Z9TlQnzFQpmpYzay1OT96VTfkYZtXi4cxo
	 hA1fklt3QBMu4dzArVrI06D34HFTOn0RRFVM634czwl2s/8w258Hr/aUh+9GXD47s3uWh
	 jUK1atvZqgsIF6191rJUbeBuaxL2E3iHWAM8HWzkm8Msuktogy5Kshu88w2NT+b4DQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795809827;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spamd-Result:X-Spam-Score:X-Spam-Level:X-Spam-Flag;
	bh=gvZJXkmOW+tv79uf7dO5s2nHqtahsAeoQ64d4cbHpIY=;
	b=CTZyXp8qPdeq+0FLK438hhyBO8UWB7FdXx2cwE6v3USzDIOdkqYl4ZHtsDpZ4qQOEzO2
	 Jje0r1uPZdurO1vH8rFsywsdrQgJ8oj4soS2d1oUel5SVIpSOmbRpetVErIuHlGuoif0V
	 7yB4m90T1NRUjWIuQGbfTzDhLRaKfW6yYYnFWCYaZ5eN1bmpVlSyPinUA7N+oUXDG6PJr
	 8HaF5l9ctDVXeEBMDC8/5l7U+dyJqSmuhr7n8KPKETckWMqFhlFXAAQuo5elwG36g4KmV
	 SzsPks+cBQmPw+/HK9eFbOSHE9aOE8PErI1w5Bdcm86ZByT6Xf9eDl1dL2DfgTg1DAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=T6IUlNeu;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CnR14YGq;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=T6IUlNeu;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CnR14YGq;
	arc=none smtp.remote-ip=195.135.223.131
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BC1606A31C
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 20:03:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21BC1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=T6IUlNeu;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CnR14YGq;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=T6IUlNeu;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=CnR14YGq
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id D7CED1F836;
	Fri, 27 Nov 2026 20:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795809824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gvZJXkmOW+tv79uf7dO5s2nHqtahsAeoQ64d4cbHpIY=;
	b=T6IUlNeutJW8Ij42lojNMkDB8E7fpE8A0kydtEHKYIsrCcSzd8XtWsB652I3q4eATcaa3Y
	i9faGFih/l29IhKO9rwuv2tVYR2XHuIiPpiM4rIus0zxzN1VQnXeAR0/OLho0bYTxmKmIN
	LElkhSJ4/pzmZCs+tBV4Pw031ywXPOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795809824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gvZJXkmOW+tv79uf7dO5s2nHqtahsAeoQ64d4cbHpIY=;
	b=CnR14YGqQf/1rpJv7xuvPKF5ExyjWIzHCeWUXXSzkioChWRdaSJQyMCkNuMGWmaVv/sM5a
	Tp1wM2e3Ll5YRjBQ==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1795809824; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gvZJXkmOW+tv79uf7dO5s2nHqtahsAeoQ64d4cbHpIY=;
	b=T6IUlNeutJW8Ij42lojNMkDB8E7fpE8A0kydtEHKYIsrCcSzd8XtWsB652I3q4eATcaa3Y
	i9faGFih/l29IhKO9rwuv2tVYR2XHuIiPpiM4rIus0zxzN1VQnXeAR0/OLho0bYTxmKmIN
	LElkhSJ4/pzmZCs+tBV4Pw031ywXPOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1795809824;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gvZJXkmOW+tv79uf7dO5s2nHqtahsAeoQ64d4cbHpIY=;
	b=CnR14YGqQf/1rpJv7xuvPKF5ExyjWIzHCeWUXXSzkioChWRdaSJQyMCkNuMGWmaVv/sM5a
	Tp1wM2e3Ll5YRjBQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id B4111134E8;
	Fri, 27 Nov 2026 20:03:44 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id tR5NJSDiCWu/KAAAD6G6ig
	(envelope-from <jack@suse.cz>); Fri, 27 Nov 2026 20:03:44 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id 43F755110C; Fri, 27 Nov 2026 21:03:44 +0100 (CET)
Date: Fri, 27 Nov 2026 21:03:44 +0100
From: Jan Kara <jack@suse.cz>
To: sashiko-reviews@lists.linux.dev
Cc: Jan Kara <jack@suse.cz>, Christian Brauner <brauner@kernel.org>, 
	Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org, Mikhail Rudenko <xyzzy@yandex-team.ru>, 
	Andreas Gruenbacher <agruenba@redhat.com>
Subject: Re: [PATCH v2 7/8] fs: Protect deferred inode reclaim from freezing
Message-ID: <q4yof5quxzttmn3pjqq3tm3lhupwsmxdwfn2zjrlm57qjdmip3@mukbj3ii55h7>
References: <20261124113450.3451-1-jack@suse.cz>
 <20261124115850.3512-15-jack@suse.cz>
 <sashiko-outbox-233316@kernel.org>
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
In-Reply-To: <sashiko-outbox-233316@kernel.org>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email]
X-Spam-Score: -12.80
X-Spam-Level: 
X-Spam-Flag: NO

On Wed 25-11-26 12:00:07, sashiko-bot@kernel.org wrote:
> > +static void queue_deferred_reclaim(struct super_block *sb, int count,
> > +				   struct list_head *list)
> > +{
> > +	int id = get_deferred_sb_id(sb);
> > +	struct deferred_reclaim_queue *queue =
> > +					&deferred_reclaim.queues[id];
> > +
> > +	spin_lock(&queue->lock);
> > +	list_splice_tail(list, &queue->list);
> > +	atomic_add(count, &sb->s_deferred_reclaim_count);
> > +	/*
> > +	 * Make sure queued inodes are visible before we check whether deferred
> > +	 * reclaim is blocked. Pairs with the barrier in thaw_super_locked().
> > +	 */
> > +	smp_mb__after_atomic();
> > +	spin_unlock(&queue->lock);
> > +
> > +	/*
> > +	 * Skip waking up workers for frozen filesystem. They'd skip the inodes
> > +	 * anyway.
> > +	 */
> > +	if (atomic_read(&sb->s_deferred_reclaim_running) < 0)
> > +		return;
> > +
> > +	wake_deferred_reclaim_workers(sb, count);
> > +}
> 
> [Severity: Low]
> Does this still wake workers unnecessarily during the earlier stages of
> freeze_super()?
> 
> freeze_super() sets sb->s_writers.frozen to SB_FREEZE_WRITE and
> SB_FREEZE_PAGEFAULT before sb_wait_write() and sync_filesystem(), while
> s_deferred_reclaim_running is only set to -1 after sync_filesystem()
> completes.  During that window, queue_deferred_reclaim() wakes workers
> even though __get_inode_reclaim_batch() will immediately skip all inodes
> from sb because s_writers.frozen != SB_UNFROZEN.

Yes, not really harmful but it makes sense to make
__get_inode_reclaim_batch() also check s_deferred_reclaim_running which
avoids these pointless wakeups.

> > @@ -1108,18 +1126,24 @@ static void __get_inode_reclaim_batch(int *start, int end,
> >  	for (i = *start; i < end; i++) {
> >  		struct deferred_reclaim_queue *queue =
> >  						&deferred_reclaim.queues[i];
> > -		struct list_head *entry, tmp;
> > +		struct inode *inode, *next;
> >  
> >  		if (list_empty_careful(&queue->list))
> >  			continue;
> >  		spin_lock(&queue->lock);
> > -		list_for_each(entry, &queue->list) {
> > -			if (*count >= INODE_RECLAIM_BATCH_SIZE)
> > +		list_for_each_entry_safe(inode, next, &queue->list, i_lru) {
> > +			/*
> > +			 * Skip inodes on frozen fs as we'd likely block. We
> > +			 * always accept inodes from read-only fs as there
> > +			 * eviction cannot require writing.
> > +			 */
> > +			if (!sb_rdonly(inode->i_sb) &&
> > +			    inode->i_sb->s_writers.frozen != SB_UNFROZEN)
> > +				continue;
> 
> [Severity: High]
> Can skipping queued inodes here deadlock freeze_super() and stall inode
> lookups?
> 
> Inodes queued for deferred reclaim via prune_icache_sb() or iput_final()
> already have I_FREEING set, but remain hashed in inode_hashtable (and
> filesystem lookup tables such as XFS per-AG radix trees) until evict()
> runs in inode_reclaim_deferred().  Any lookup of such an inode blocks in
> __wait_on_freeing_inode() waiting for evict() to finish.
> 
> CPU0 (freeze_super)       CPU1 (in-flight writer)   CPU2 (reclaim worker)
> -------------------       -----------------------   ---------------------
> s_writers.frozen =
>   SB_FREEZE_WRITE
>                           sb_start_write() held
>                           iget_locked(ino)
>                             __wait_on_freeing_inode()
>                                                     __get_inode_reclaim_batch()
>                                                       s_writers.frozen !=
>                                                         SB_UNFROZEN
>                                                       -> skips inode
> sb_wait_write(
>   SB_FREEZE_WRITE)
>   <-- deadlocks
> 
> Also, while the filesystem is frozen, super_cache_scan() ->
> prune_icache_sb() continues isolating inodes with I_DEFER_RECLAIM or
> I_METADATA_WRITEBACK, setting I_FREEING and queuing them where they will
> not be evicted until thaw, causing any reader looking up those inodes to
> hang uninterruptibly in __wait_on_freeing_inode().

Hum, right. This is actually not a new thing - previously prune_icache_sb()
accumulated inodes with I_FREEING set on its list and evict() could block
on frozen fs when evicting some particular inode and following lookups
would stall the same way. But now we're more paranoid with the freeze
protection so we'll block on frozen filesystem even if evict() actually
would not block (but we don't know). I'll put some more thought to this if
we can improve.

> > +			list_move_tail(&inode->i_lru, list);
> > +			if (++(*count) >= INODE_RECLAIM_BATCH_SIZE)
> >  				break;
> > -			(*count)++;
> >  		}
> > -		list_cut_before(&tmp, &queue->list, entry);
> > -		list_splice_tail(&tmp, list);
> >  		spin_unlock(&queue->lock);
> 
> [Severity: Medium]
> Does leaving skipped inodes from a frozen superblock at the head of
> queue->list cause O(N) rescans under queue->lock?
> 
> Because deferred_reclaim.queues are shared across superblocks and
> queue_deferred_reclaim() appends new batches at the tail, every batch
> dequeued for an unfrozen superblock on the same queue must walk past all
> frozen inodes at the front under queue->lock.  Moreover, when any other
> worker collects fewer than INODE_RECLAIM_BATCH_SIZE inodes from its own
> queue, get_inode_reclaim_batch() wraps around across all queues, seeing
> !list_empty_careful(&queue->list) and locking and scanning all N frozen
> inodes on that queue only to skip them.
> 

Yes, this is variation of the above... Easy to solve this particular one
but the solution depends on what I'll decide to do with the problem above.

> > @@ -1210,6 +1260,13 @@ static void inode_reclaim_deferred(struct work_struct *work)
> >  				sb = inode->i_sb;
> >  				count = 0;
> >  				start = ktime_get_ns();
> > +				/* Protect us from filesystem freezing */
> > +				if (!sb_deferred_reclaim_get(sb)) {
> > +					inode_reclaim_skip_inodes(&inode_batch,
> > +								  sb);
> > +					sb = NULL;
> > +					continue;
> > +				}
> >  			}
> >  			count++;
> >  			list_del_init(&inode->i_lru);
> 
> [Severity: Medium]
> Can evicting a stacked filesystem inode (such as overlayfs or ecryptfs) in
> inode_reclaim_deferred() still block the worker on a frozen lower
> filesystem?
> 
> When iput_final() drops the last reference to an unlinked stacked inode
> under PF_MEMALLOC, it queues the stacked inode to deferred_reclaim:
> 
> fs/inode.c:iput_final() {
>     ...
> 	if (current->flags & PF_MEMALLOC && !inode->i_nlink) {
> 		LIST_HEAD(defer);
> 
> 		list_add(&inode->i_lru, &defer);
> 		queue_deferred_reclaim(sb, 1, &defer);
> 		return;
> 	}
> 	evict(inode);
> }
> 
> __get_inode_reclaim_batch() and sb_deferred_reclaim_get() only check the
> stacked superblock (inode->i_sb), which is unfrozen.  When the worker runs
> evict(inode), current->flags does not have PF_MEMALLOC set, so dropping
> the underlying unlinked dentry/inode in ovl_destroy_inode() or
> ecryptfs_evict_inode() enters iput_final() -> evict() synchronously on the
> frozen lower writable filesystem and blocks on sb_start_intwrite().

This looks a bit artificial. Two layers of stacked filesystems, the lowest
filesystem is frozen and that can block deferred reclaim worker in evict().
If this causes practical problems, we could mark reclaim workers
PF_MEMALLOC but I'm not convinced it's worth it at this point.

> > diff --git a/fs/super.c b/fs/super.c
> > index fa345d5027bff..77e6ab6383b8b 100644
> > --- a/fs/super.c
> > +++ b/fs/super.c
> 
> [ ... ]
> 
> > @@ -2648,6 +2678,7 @@ static int thaw_super_locked(struct super_block *sb, enum freeze_holder who,
> >  	sb->s_writers.frozen = SB_UNFROZEN;
> >  	sb->s_writers.freeze_owner = NULL;
> >  	sb_freeze_wake(sb);
> >  	sb_freeze_unlock(sb, SB_FREEZE_FS);
> > +	sb_unblock_deferred_reclaim(sb);
> >  out_deactivate:
> >  	deactivate_locked_super(sb);
> >  	return 0;
> 
> [Severity: Medium]
> Can setting sb->s_writers.frozen = SB_UNFROZEN before
> sb_unblock_deferred_reclaim(sb) cause inode_reclaim_deferred() to spin in
> a tight loop without calling cond_resched()?
> 
> In both thaw_super_locked() and the freeze_fs() error path of
> freeze_super(), s_writers.frozen becomes SB_UNFROZEN before
> s_deferred_reclaim_running is reset from -1 to 0 in
> sb_unblock_deferred_reclaim().  During that window,
> __get_inode_reclaim_batch() only checks s_writers.frozen != SB_UNFROZEN
> and moves the inodes to inode_batch, after which
> sb_deferred_reclaim_get(sb) fails, inode_reclaim_skip_inodes() splices
> them back onto queue->list, and inode_reclaim_deferred() continues
> without reaching cond_resched(), immediately re-dequeuing the same inodes
> on the next iteration.  Calling sb_unblock_deferred_reclaim(sb) before
> setting s_writers.frozen = SB_UNFROZEN (or also checking
> s_deferred_reclaim_running in __get_inode_reclaim_batch()) would avoid
> this window.

Mostly harmless but easy to improve by making __get_inode_reclaim_batch()
check s_deferred_reclaim_running. I'll do that.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
