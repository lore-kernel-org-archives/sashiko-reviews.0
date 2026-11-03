Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=216.40.44.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745633;
	b=CQin+G0IT0e7/M7KOWcxoPQQBxhMe3+O+MzCq3DdeJHhqHNfFs4SHbUC1P2x5gNKtWmR
	 4TYoaCdb+w6GqMSS3mFzckH5lAta1JzMhsJx4S2ghTnDy54ufQECe7z7nKqc5JQau727+
	 D0kLuTc+/ULaBKyAaieQtEKig9Rmmvc8YVCgQ8sE+PShht6he9oOL8i5AoFDbiKPCAaOe
	 NhMGIQfBQcrfrtGcFlPd71vhM7hDncmwMELfyKSbQgIiHPaThu6rx2kGdsqXuE7Y6tk86
	 h+KfyVZlQpZa+jCRU1XTdLkF4JK3Z4yJUVmCKHz3PT4NLWEH0n7cCbv6uzxki3zdgRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745633;
	h=DMARC-Filter:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Stat-Signature:X-Rspamd-Server:
	 X-Rspamd-Queue-Id:X-Spam-Status:X-Session-Marker:X-Session-ID:
	 DKIM-Signature:X-HE-Tag:X-HE-Meta;
	bh=ewjEYT7at6mMmUqDrpC37r4P1a0BixvrJSu1ivgWlPM=;
	b=NBP0IAKSYKRqcMLlmg/M86oXanC1WG/JLCbiJCHidvcOkD01oEk8Fu04EtQPaAJ/mIg6
	 RbCgMD+Ly8HF2WeoPUKG/WXRHrfC47vcotYhavcW2deSCEMYavWE6uBQPC62mqUa2ZjbS
	 +zot2rAz8lSaPSzYDwL3Nppq2cQhgqj5PB+K2Zd4RgKhsgy+zT35Qnh6wiAEn5l2HBifH
	 kx4cudKLk2Krt12ocamolT+4q2tP9DrXxzV8k+EXO3VsmVoJlRT6/OEr/veVKH3J5Ce75
	 4pd02+0fu+nPcmp2AavLuN6VMq1X4wA5Nb6Z0bsKe+WPRNetquOjecvtvAtSDF2C3bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=goodmis.org;
	spf=pass smtp.mailfrom=goodmis.org;
	dkim=pass header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=62i4xYp1;
	arc=none smtp.remote-ip=216.40.44.15
Received: from relay.hostedemail.com (smtprelay0015.hostedemail.com [216.40.44.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D460606A326
	for <sashiko-reviews@lists.linux.dev>; Tue,  3 Nov 2026 22:40:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2D460606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goodmis.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=goodmis.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=goodmis.org header.i=@goodmis.org header.a=rsa-sha256 header.s=dkim1 header.b=62i4xYp1
Received: from omf13.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 7539D1A05B4;
	Tue,  3 Nov 2026 22:40:30 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: rostedt@goodmis.org) by omf13.hostedemail.com (Postfix) with ESMTPA id A39A720010;
	Tue,  3 Nov 2026 22:40:28 +0000 (UTC)
Date: Tue, 3 Nov 2026 17:40:27 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, "Linux Trace Kernel"
 <linux-trace-kernel@vger.kernel.org>
Subject: Re: [PATCH v7] tracefs: Add read-only eventfs filesystem at
 /sys/kernel/events
Message-ID: <20261103174027.35c261c4@gandalf.local.home>
In-Reply-To: <sashiko-outbox-196087@kernel.org>
References: <20261103163803.77170132@gandalf.local.home>
	<sashiko-outbox-196087@kernel.org>
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
X-Stat-Signature: jzr8yeanuximbpy7pbp661zu46j3z6j3
X-Rspamd-Server: rspamout01
X-Rspamd-Queue-Id: A39A720010
X-Session-Marker: 726F737465647440676F6F646D69732E6F7267
X-Session-ID: U2FsdGVkX1+iyKxRCiUJRLiyYsR/Ws1Kv8YshGXOTFk=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=goodmis.org; h=date:from:to:cc:subject:message-id:in-reply-to:references:mime-version:content-type:content-transfer-encoding; s=dkim1; bh=ewjEYT7at6mMmUqDrpC37r4P1a0BixvrJSu1ivgWlPM=; b=62i4xYp1Cbb3qwOtUsP43WOopFehjO40sawwv8m0s339e75/CLDtrs3bo4exSStIuovKNkPanqwssTB5/kqDDBPPa/zf9P/Rq5cwZc0BOZ6bydmk/9hGA7PIx3loVLNHqu2QwSWF4nQcoARFbIzs7qazmT3yKi53bLkXSop+QDY=
X-HE-Tag: 1793745628-632290
X-HE-Meta: U2FsdGVkX19j4axnv9hat1pNfi5EXsU1V2oZvDxrLGAiJOughetzbG8wFDBbTTLeRnEr56PNNUaaKVnqlF9AviSko/EjGS4cqz43Wh1OGO3eJRfsN/WYcsUWoMv0caGXL9a5SDI12QlZ9+Xd+GsC52xbY0WQMmPVJ2RY5XrWAVB0j2czZHnuSVpIChKJRj7nrwqxDahR3qqek824RqmiS26vhbnRfJpxV1xMNGa0SMkIiopSYiu2V9iKlKYR1lvNvl5PlDiKuAQHOvpm3ElAhI06ZsQ1dMrtCu8GK05xb7y/OfoPSXo/gTmkylvxXtRaK1KP16zkp7Ojz1RrzEgk2nkSBY8Zp5it

On Tue, 03 Nov 2026 21:57:51 +0000
sashiko-bot@kernel.org wrote:

> > +static struct vfsmount *eventfs_ro_mount;
> > +static int eventfs_ro_mount_count;
> > +
> > +static int eventfs_ro_fill_super(struct super_block *sb, struct fs_context *fc)
> > +{
> > +	struct inode *inode;
> > +	struct dentry *root;
> > +
> > +	sb->s_blocksize = PAGE_SIZE;
> > +	sb->s_blocksize_bits = PAGE_SHIFT;
> > +	sb->s_magic = EVENTFS_SUPER_MAGIC;
> > +	sb->s_op = &eventfs_ro_super_operations;
> > +	sb->s_time_gran = 1;
> > +	sb->s_flags |= SB_RDONLY;
> > +
> > +	inode = new_inode(sb);
> > +	if (!inode)
> > +		return -ENOMEM;  
> 
> [Severity: Medium]
> As reported by Sashiko on v4 [1], in eventfs_ro_fill_super(), new_inode(sb)
> invokes tracefs_alloc_inode() via eventfs_ro_super_operations and links the
> root tracefs_inode onto the global tracefs_inodes list without setting
> TRACEFS_RO_EVENT_INODE.
> 
> TRACEFS_RO_EVENT_INODE is only set on the root inode later in
> eventfs_create_events_ro_copy(). However, if LOCKDOWN_TRACEFS is active at
> boot, create_event_toplevel_files() returns -EPERM before calling
> eventfs_create_events_ro_copy():
> 
>     e_events = eventfs_create_events_dir("events", parent, events_entries,
>                                          nr_entries, tr);
>     ...
>     /* Lockdown causes e_events to be NULL*/
>     if (!e_events)
>         return -EPERM;
> 
> If eventfs is mounted by userspace (or in the window during
> eventfs_ro_get_root() before eventfs_create_events_ro_copy() sets
> ti->flags), can a tracefs remount with uid= or gid= options walk
> tracefs_inodes in tracefs_apply_options() and overwrite i_uid and i_gid on
> the read-only eventfs root inode?

That can't happen because the eventfs_create_events_ro_copy() is done at
bootup *before* user space starts. So all is fine.

> 
> Should TRACEFS_RO_EVENT_INODE be set on get_tracefs(inode)->flags directly in
> eventfs_ro_fill_super() when the root inode is allocated?

Nope, no need.


> 
> [ ... ]
> 
> > @@ -327,7 +432,7 @@ static void update_inode_attr(struct inode *inode, umode_t mode,
> >  }
> >  
> >  static struct inode *eventfs_get_inode(struct dentry *dentry, struct eventfs_attr *attr,
> > -				       umode_t mode,  struct eventfs_inode *ei)
> > +				       umode_t mode,  struct eventfs_inode *ei, bool ro)
> >  {
> >  	struct eventfs_root_inode *rei;
> >  	struct eventfs_inode *pei;
> > @@ -342,6 +447,9 @@ static struct inode *eventfs_get_inode(struct dentry *dentry, struct eventfs_att
> >  	ti->private = ei;
> >  	ti->flags |= TRACEFS_EVENT_INODE;
> >  
> > +	if (ro)
> > +		ti->flags |= TRACEFS_RO_EVENT_INODE;  
> 
> [Severity: Medium]
> When a read-only eventfs inode is evicted and its struct tracefs_inode slab
> object is later reused for a normal tracefs inode, does the stale
> TRACEFS_RO_EVENT_INODE flag remain set in ti->flags?
> 
> Because eventfs_ro_super_operations shares tracefs_inode_cachep, an evicted
> read-only eventfs inode goes through tracefs_drop_inode(), which only clears
> TRACEFS_EVENT_INODE:
> 
>     static int tracefs_drop_inode(struct inode *inode)
>     {
>         struct tracefs_inode *ti = get_tracefs(inode);
>         ...
>         ti->flags &= ~TRACEFS_EVENT_INODE;
> 
>         return 1;
>     }

Oh, this is a bug. I need to clear the RO_EVENT_INODE flag too.

> 
> The slab constructor init_once() only runs when a new slab is allocated, not
> when a freed object is reallocated by tracefs_alloc_inode() via
> alloc_inode_sb(), and neither tracefs_alloc_inode() nor callers such as
> tracefs_create_file(), __create_dir(), eventfs_create_events_dir(), or
> eventfs_get_inode(..., ro=false) reset ti->flags.
> 
> If a slab object previously used for a read-only eventfs inode is reused for
> a tracefs inode (or the tracefs events directory inode), won't
> tracefs_apply_options() see the stale TRACEFS_RO_EVENT_INODE bit and skip
> updating its uid/gid and calling eventfs_remount()?
> 
> [ ... ]
> 
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
> As reported by Sashiko on v5 [2], this isn't a bug, but since
> eventfs_root_lookup() was renamed to __eventfs_root_lookup(), should the
> function name in the kernel-doc comment header above it also be updated to
> __eventfs_root_lookup to avoid a W=1 kernel-doc warning?

Again, I'll handle this later.

-- Steve

> 
> [1] https://lore.kernel.org/r/sashiko-outbox-194145@kernel.org
> [2] https://lore.kernel.org/r/sashiko-outbox-195864@kernel.org
> 

