Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793740787;
	b=tf8sgNvrF1bqMDPYYvddjzIBI3i/hHs7j6EEUoHjR304f3tdKL034JLYXsCt/eyvReBy
	 Tmgbx1WvmdyN6kNOdA2lFftn/i+oTxp6bqD1NJiWA65tzjTD4YTdVz6VWS+8YQhvkYNYn
	 I4OY5Zqt9jcIlSSr0CAeL77yINoJMkoCWLJ8UJjzWFDeOB3sK9Ke/hxviVETQSwHjP/nR
	 y19ZFhJ1tE/+L2cgxPhpNqlCyXuZL6hgORe3jX25ikHFM+ZzsWjdTanSWhtY+d0Oksl9V
	 qRgQZXaIObwWaE921T8EAdWy4Sdk6d2hSKWJTHtKHCC2RxFVEuig/qhgVytUJNdQVQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793740787;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Server:X-Rspamd-Queue-Id:
	 X-Stat-Signature:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=cgiKafzwmYihiNEwwhuQW5e3Hs9aNQicS5r4I1jky/g=;
	b=MWu3fQVnBC0i4JLHyQYONgruICNiNc9iHCT6Sn2O0OYPpM82bLwTAK8JKWkW1vPZkafP
	 KEwDVorTK2vo1msimFHEyJiPbCjCjZxsDj9hNrgYBYT/EL1t7H1ESQr9wWu59SFb56YTS
	 UH/9BsYyLQ56JVhJQUJop/FkYpCcGsRH1TbTaaP8UMknUYhYncPfmcYLVj/iAH/uy6p59
	 I4PaveMidng40bW37dEjp1b5Yo/gPXlp3iDZ9CG4xUz6MQS6UnkY9n/rqogs+2SsL808F
	 fLmEh7tRdmAJlVs665lkxorAO6lmOyqkNzp3Bgc2rAEqwnW9W4El+azHxaP2DbbK64w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=RF9p6ibw;
	arc=none smtp.remote-ip=216.40.44.12
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C441E606A324
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 21:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C441E606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=RF9p6ibw
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id 4BCAEA0544;
	Tue,  3 Nov 2026 21:19:44 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf17.hostedemail.com (Postfix) with ESMTPA id 9DBF417;
	Tue,  3 Nov 2026 21:19:42 +0000 (UTC)
Date: Tue, 3 Nov 2026 16:19:41 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Linux Trace Kernel"
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v6] tracefs: Add read-only eventfs filesystem at
 /sys/kernel/events
Message-ID: <20261103161941.21149df1@gandalf.local.home>
In-Reply-To: <sashiko-outbox-196018@kernel.org>
References: <20261103154159.1467e7b5@gandalf.local.home>
	<sashiko-outbox-196018@kernel.org>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: rspamout03
X-Rspamd-Queue-Id: 9DBF417
X-Stat-Signature: 8funx3m5dk1oiqfcxm5r5ycp5weqchf7
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1/XnR1+LQgKkbIgS4FYIoGmVGU6Hz6PvJs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=cgiKafzwmYihiNEwwhuQW5e3Hs9aNQicS5r4I1jky/g=; b=RF9p6ibwrfDL3l9BUXF69Z0Ame9aBbKfZK4btoTbA9iKf3CWttk+uJ/biRzdaG9Y7I4SPKF4t034NYNXEQ1DMqsTV+zTkD3yYBA/Cb+eELM0brfl75Jh5EIBfppugDxtNZQ1s7ZdnZ14TAkiUwDKgb8Wb9ShdFA+l3Ib9B7IvGA=
X-HE-Tag: 1793740782-897667
X-HE-Meta: U2FsdGVkX1/mOHQKMrxxDO04Ep/Q9wxRPYj5M8bpDF1ptW3QcxpzvEfVM9TIXSTpQg8VpfAooDC8CVpM8WKMhEHqXnAFkp045kHCGbYTA24ifDc5H/qcn9CerSkhFSiVFBw+OwQbch2jUqyK0ytU5/6pWXCm+1CIS9U2I4U1tU2xcUdXS/Dc9v8G6u1rsLAFUZ39vAyrjelFHioBezfXrJDet1dnW1yttIgK/2J8TPp73FAajo8vhoRrYYWSgL2hNRHJungnkDtJOtNbaj5JGxZXcWbEaqXdB4W0mJ6ShQClkLtLGRYA8iww5mHPMzHFtqpnMM41UunHt5V0NnBuF7n9Iw/fb6O/

On Tue, 03 Nov 2026 20:55:22 +0000
sashiko-bot@kernel.org wrote:

> >  
> >  /**
> > @@ -521,14 +647,16 @@ lookup_file_dentry(struct dentry *dentry,
> >   * @dir: in which a lookup is being done
> >   * @dentry: file/dir dentry
> >   * @flags: Just passed to simple_lookup()
> > + * @ro: Denote if this is from a read-only eventfs
> >   *
> >   * Used to create dynamic file/dir with-in @dir, search with-in @ei
> >   * list, if @dentry found go ahead and create the file/dir
> >   */
> >  
> > -static struct dentry *eventfs_root_lookup(struct inode *dir,
> > -					  struct dentry *dentry,
> > -					  unsigned int flags)
> > +static struct dentry *__eventfs_root_lookup(struct inode *dir,
> > +					    struct dentry *dentry,
> > +					    unsigned int flags,
> > +					    bool ro)  
> 
> [Severity: Low]
> As reported by Sashiko on v5 [1], this isn't a bug, but since
> eventfs_root_lookup() was renamed to __eventfs_root_lookup(), should the
> function name in the kernel-doc comment header above it also be updated to
> __eventfs_root_lookup to avoid a W=1 kernel-doc warning?
> 

As I replied then, I'm going to keep it as is for now.

> [ ... ]
> 
> > @@ -837,6 +995,48 @@ struct eventfs_inode *eventfs_create_events_dir(const char *name, struct dentry
> >  	return ERR_PTR(-ENOMEM);
> >  }
> >  
> > +/**
> > + * eventfs_create_events_ro_copy - create a read-only events directory
> > + * @ei: The eventfs_inode to use to create a read-only copy from
> > + *
> > + * This function configures the eventfs filesystem root as a read-only
> > + * trace event directory using the existing eventfs_inode lazy-lookup
> > + * infrastructure.
> > + */
> > +int eventfs_create_events_ro_copy(struct eventfs_inode *ei)
> > +{
> > +	static struct dentry *dentry;
> > +	struct tracefs_inode *ti;
> > +	struct inode *inode;
> > +	int ret;
> > +
> > +	/* Can only be called once. */
> > +	if (dentry)
> > +		return -EBUSY;
> > +
> > +	/* Reference acquired but never freed */
> > +	dentry = eventfs_ro_get_root();
> > +	if (IS_ERR(dentry)) {
> > +		ret = PTR_ERR(dentry);
> > +		dentry = NULL;
> > +		return ret;
> > +	}
> > +
> > +	inode = d_inode(dentry);
> > +
> > +	ti = get_tracefs(inode);
> > +	ti->flags |= TRACEFS_EVENT_INODE;
> > +	ti->private = ei;  
> 
> [Severity: Medium]
> As reported by Sashiko on v4 [2], should eventfs_create_events_ro_copy()
> also set TRACEFS_RO_EVENT_INODE in ti->flags on the root inode?

Well, it couldn't have been reported in v4 as that flag was just added in v6 ;-)

> 
> In eventfs_ro_fill_super(), the root inode is allocated via new_inode(sb),
> which calls tracefs_alloc_inode() and places the root tracefs_inode on the
> global tracefs_inodes list. Because TRACEFS_RO_EVENT_INODE is only set on
> child inodes in eventfs_get_inode(), remounting tracefs with uid= or gid=
> mount options (once the bitwise check in tracefs_apply_options() is fixed)
> will still match the pinned /sys/kernel/events root inode, overwrite its
> i_uid and i_gid, and redundantly call eventfs_remount() on the global
> events tree.

But sure. I'll add it to the root inode too.


> 
> > diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
> > index f3d6188a3b7b2..f895ee9ed4540 100644
> > --- a/fs/tracefs/inode.c
> > +++ b/fs/tracefs/inode.c
> > @@ -341,6 +341,14 @@ static int tracefs_apply_options(struct super_block *sb, bool remount)
> >  		srcu_idx = eventfs_remount_lock();
> >  		rcu_read_lock();
> >  		list_for_each_entry_rcu(ti, &tracefs_inodes, list) {
> > +
> > +			/*
> > +			 * Ignore read-only eventfs inodes as they are not
> > +			 * part of tracefs.
> > +			 */
> > +			if (ti->flags | TRACEFS_RO_EVENT_INODE)
> > +				continue;  
> 
> [Severity: Medium]
> Should this check in tracefs_apply_options() use a bitwise AND (&) instead
> of a bitwise OR (|)?

Ug! My mind said '&' but my fingers typed '|' :-p

OK, v7 coming up.

-- Steve
