Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794407850;
	b=p2Ia4qn8teJ0thkp2Zj28OQIasmgsWS+Ug78i2voqMlKTZePM/kVqgbbSl9Jo2RnjDZL
	 BAcwy06RRAgdLTXlX19KuAQMkDCPPyMyG0InbkdRRF9H4F8ZSOypWgFWWGn1qQ1FBBZmR
	 JDWcj9oFKgIbCjm1nlpffBoN/Qq/k6s4t82Rj1zVTwvGJPHMfEPos+yBSssDo+piRI5ON
	 Itk4cs7zREduL9GXLK87oY1fZLpngIFSYlBF+VJNa2bZ6amXzZolU8eG2PtXJi2Um2+Mr
	 ERqCwsZPInCEUPVbViV7/NOnShbcYGs6Qdmmraqv12RqOYd8mJZoILW9C/9OUa7xD8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794407850;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:DKIM-Signature:
	 DKIM-Signature:Received:Received:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Rspamd-Queue-Id:X-Spam-Level:
	 X-Rspamd-Server:X-Rspamd-Action:X-Spam-Flag:X-Spamd-Result:
	 X-Spam-Score;
	bh=O+HDSzgsBsov3BG+U6eNO5vEVeoxzMoOfJ4y2pKnmxk=;
	b=zQF4kVNrtLkiLIdcwQpeuIIsm254d94Ven1YOS+jYuKeoXdfRC5TfwVpv0WtWdxAA5bz
	 URN9UzvlBbbuUOExVYL+kOwrzhxkURzra4ae+EyVPZ80vItz6IN4h6ulQdPsB8z51DD2c
	 T2t/R9wsKiUHIjzwg80pxEWoudRUmrledEa0OjV+s6XzmnUNYob9Mp3JBEHUUvBBU9qn3
	 kY2zZjmjHcASqJNI4YeHogGlVWhRFw7jnXXoBTh9xMfZ9vgTeQrfcxmPFj8QAWxPdyH5M
	 Cuyl8+miPDFMvO+NMZ+x9ALiZFElvSbuqPJ/UsYy60++g2o1JgroEmKO/CcgzriZKoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=suse.cz;
	spf=pass smtp.mailfrom=suse.cz;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=jfspbYxx;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LxszwG7b;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Mc5SRKx4;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sD9sTYYB;
	arc=none smtp.remote-ip=195.135.223.130
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB977606A32A
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 14:37:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB977606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=jfspbYxx;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=LxszwG7b;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=Mc5SRKx4;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=sD9sTYYB
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 79DE633712;
	Wed, 11 Nov 2026 14:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794407846; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+HDSzgsBsov3BG+U6eNO5vEVeoxzMoOfJ4y2pKnmxk=;
	b=jfspbYxxMxn5aSuH4wuf7B7wVb7W0FSEy93AAyuKPvi5wa4biFCwWslailyNYdya94eli4
	HADZ7Spe4yQrMb0HgFXcSlZ+UmfumtTM6AhKKPKJ2zpeOc+Yu1yY2NQaJet4Cj8zS4OOlQ
	HXu4Y0S1HlCnJFRN1gt/rZ8UtN+onlE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794407846;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+HDSzgsBsov3BG+U6eNO5vEVeoxzMoOfJ4y2pKnmxk=;
	b=LxszwG7bvoVcQXAAYRVI6atvXtM5yiMvfNxwMoedCsmuRiz22UYp1gxn1vIpiOHVzPL4VT
	krYvuUb16YK+TYDQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=Mc5SRKx4;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=sD9sTYYB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1794407845; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+HDSzgsBsov3BG+U6eNO5vEVeoxzMoOfJ4y2pKnmxk=;
	b=Mc5SRKx49u8+JyKc25u/O2IhCiYywm8wGceXtSYRpAYykKRSjwuhOmV+uriUHqcDDzWlC4
	PRO+14KUinJreN3z30xbe7AgmISTu8u+VPbDwfLtPfJSIcOhsuZuQeVJgqLZQxn/4SQ6xs
	EeuVnWcUgMvODV91UG8btF1jBZNpa1M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1794407845;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=O+HDSzgsBsov3BG+U6eNO5vEVeoxzMoOfJ4y2pKnmxk=;
	b=sD9sTYYBfwCAiCtwsKWRK7KEbAjqnLnbruL5uXWNOzT3ygig4GZj2/8yqNQrTMpNNh2tg8
	IavcNxUBJujcRuDQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 43F81134E5;
	Wed, 11 Nov 2026 14:37:25 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id O11dBKV99GrZGAAAD6G6ig
	(envelope-from <jack@suse.cz>); Wed, 11 Nov 2026 14:37:25 +0000
Received: by quack.suse.cz (Postfix, from userid 1000)
	id B3D372294F; Wed, 11 Nov 2026 15:37:20 +0100 (CET)
Date: Wed, 11 Nov 2026 15:37:20 +0100
From: Jan Kara <jack@suse.cz>
To: sashiko-reviews@lists.linux.dev
Cc: Breno Leitao <leitao@debian.org>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Julian Sun <sunjunchao@bytedance.com>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org, kernel-team@meta.com, tj@kernel.org, 
	mkoutny@suse.com
Subject: Re: [PATCH v2 4/4] writeback: report a slow writeback wait once per
 timeout
Message-ID: <67les5imq7hn2my3aiehxdwr43fg6pamqzxz4owrdb7efotgi5@jgvae6eosgqc>
References: <20261110-writeback_stall_report-v2-0-9e0ed75074ca@debian.org>
 <20261110-writeback_stall_report-v2-4-9e0ed75074ca@debian.org>
 <sashiko-outbox-208900@kernel.org>
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-208900@kernel.org>
X-Rspamd-Queue-Id: 79DE633712
X-Spam-Level: 
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Flag: NO
X-Spamd-Result: default: False [-13.01 / 50.00];
	SUSE_INTERNAL_BYPASS(-9.00)[];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,suse.cz:dkim,sashiko.dev:url];
	RCVD_COUNT_THREE(0.00)[3];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:rdns,imap1.dmz-prg2.suse.org:helo,sashiko.dev:url,suse.com:email,suse.cz:dkim];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Spam-Score: -13.01

On Wed 11-11-26 11:47:37, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [High] writeback: hung task wakeup interval exceeds timeout in
>   writeback_sb_inodes()

Aha! Indeed this was the reason why we chose half the hang check interval.
So we really have to go below that. So maybe just fix the duplicated
messages and put up with report twice per hang check interval? Or we could
use 3/4 here if you think it would be better.

								Honza

> --
> 
> commit f3edfd7b6ff429943317ab66c7dd1c29f9226156
> Author: Breno Leitao <leitao@debian.org>
> 
> writeback: report a slow writeback wait once per timeout
> 
> This commit rate-limits the slow writeback report in
> wb_wait_for_completion_cb() to once per hung_task_timeout_secs, initializes
> done->progress_stamp when waiting starts, and increases the progress wakeup
> interval in writeback_sb_inodes() from half the timeout to the full timeout.
> 
> > diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> > index e2da4781b5e00..fcb7fb0196208 100644
> > --- a/fs/fs-writeback.c
> > +++ b/fs/fs-writeback.c
> > @@ -203,12 +203,13 @@ static bool wb_wait_for_completion_cb(struct wb_completion *done,
> >  	unsigned long waited_secs = (jiffies - done->wait_start) / HZ;
> >  	int left = atomic_read(&done->cnt);
> >  
> > -	done->progress_stamp = jiffies;
> > -	if (left && timeout && (waited_secs > timeout))
> > +	if (left && timeout &&
> > +	    time_after(jiffies, done->progress_stamp + timeout * HZ))
> >  		pr_info("INFO: The task %s:%d has been waiting for writeback "
> >  			"completion for more than %lu seconds (bdi %s, work items left: %d).\n",
> >  			current->comm, current->pid, waited_secs,
> >  			bdi_dev_name(bdi), left);
> > +	done->progress_stamp = jiffies;
> >  
> >  	return !left;
> >  }
> > @@ -230,6 +231,7 @@ void wb_wait_for_completion(struct wb_completion *done,
> >  	unsigned long timeout, waited;
> >  
> >  	done->wait_start = jiffies;
> > +	done->progress_stamp = done->wait_start;
> >  	atomic_dec(&done->cnt);		/* put down the initial count */
> >  	wait_event(*done->waitq, wb_wait_for_completion_cb(done, bdi));
> >  
> > @@ -2135,7 +2137,7 @@ static long writeback_sb_inodes(struct super_block *sb,
> >  
> >  		/* Report progress to inform the hung task detector of the progress. */
> >  		if (work->done && work->done->progress_stamp && timeout &&
> > -		   (jiffies - work->done->progress_stamp) > HZ * timeout / 2)
> > +		   (jiffies - work->done->progress_stamp) > HZ * timeout)
> >  			wake_up_all(work->done->waitq);
> 
> [Severity: High]
> Does raising the wakeup threshold from HZ * timeout / 2 to HZ * timeout cause
> khungtaskd to report false-positive hung tasks (or panic when
> sysctl_hung_task_panic is set) during slow writeback?
> 
> In kernel/hung_task.c, task_is_hung() stamps t->last_switch_time with the
> time of the scan that first notices a new switch_count, not the time the
> task actually scheduled:
> 
> kernel/hung_task.c:task_is_hung() {
>     ...
> 	if (switch_count != t->last_switch_count) {
> 		t->last_switch_count = switch_count;
> 		t->last_switch_time = jiffies;
> 		return false;
> 	}
> 	if (time_is_after_jiffies(t->last_switch_time + timeout * HZ))
> 		return false;
> 
> 	return true;
> }
> 
> Because writeback_sb_inodes() only checks the threshold after
> __writeback_single_inode() finishes, consecutive wakeups are spaced by
> HZ * timeout plus the time spent writing the next inode.  That wakeup period
> is strictly longer than khungtaskd's timeout * HZ detection window, so a scan
> that runs right after a wakeup can be followed by the next scan at
> last_switch_time + timeout * HZ before the next wakeup happens, defeating
> 1888635532fb ("writeback: Wake up waiting tasks when finishing the writeback
> of a chunk.").
> 
> Keeping the wakeup threshold at HZ * timeout / 2 while tracking the last
> pr_info() timestamp separately from done->progress_stamp (or only updating
> done->progress_stamp when logging) would avoid waking the waiter late.
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261110-writeback_stall_report-v2-0-9e0ed75074ca@debian.org?part=4
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR
