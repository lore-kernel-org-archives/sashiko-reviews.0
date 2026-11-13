Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=165.173.182.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1794532678;
	b=S2fHyKGxS2R4CZz4JvUL23aMAa/NJ+V7mQaoONiN6Dlj0FYk2JfkGu6wP9ezVaQuAYhq
	 vREPBgeab9GgIeaxA8vAXhFDr0k+GFNuaLnVRESapKSVF66SqEs2zBbNR0V/YxBvL8HFt
	 XAfD+xR0kOYGqBoH4c9DXZ1x/V6xGdlMM5RRStU7YhQ83Bgw4tn9YOxAymbTNuNh7gz/P
	 3kdgFRZibI0jvDqlDHIdppGyL/7he67Bvbk3gFGGRbGV6SYPXam/qNfOyEq359aA2u7pZ
	 JRdNTWdkVGeiYSLFhyeN7GVjoQ/2mamlTqMAiIiGM6t3hwWtoXSWRQjgLrpLH0tu9uA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794532678;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-Zoho-Virus-Status:
	 X-Zoho-AV-Stamp;
	bh=KE1akkFEuJf75Kt6P5uZlGEjaUFqQNlIPt1KnGsOo0k=;
	b=mhcBqG91PQBoj4zFAAIFPPXE7FvWrOnOIgDWpe6+tLqbskPGTXns8S/1UL20GC9Fxttn
	 2HWblJKjLw06yeN2o4d/rPtZ0Ue5kbrAHUZFCml2CJDtZY0X6j7JOeWbeLBxJGxXZASNn
	 rc19x7Z0tlfOqaIgxmNV4HJDKIeM8HDqAi0j6KotqrxoxaxS9h1JOxcH6piCSfS0Igu+b
	 4hYxGUJixe99JTExFW4KSjGhT/2Kpti0h2RS/ueyi9XOC1KGdeUqoc/M9+A0T+AiunhMl
	 4dazc5pGdrDJHjzasbjyoTmbUHbDHbFl8mRdiLyAYw+fAGMSpkwnxW4S2cC7O/V3Eqg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=ah1EcesW;
	arc=fail smtp.remote-ip=165.173.182.11
Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A404606A321
	for <sashiko-reviews@lists.linux.dev>; Fri, 13 Nov 2026 01:17:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A404606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=ah1EcesW
ARC-Seal: i=1; a=rsa-sha256; t=1794532671; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LYVDVsKvyVLFCrMhKau9bzPN1E2+4gar0OyQJ/61scIlFJmUPj60BmNs22GYT7twdC9HV1sEUp/MBlsB4RqTZcycaiJmoAjMfDBTFPp2PQoqhO0PHvJB0pGyCet/WA0yR1PybOxR2tjT2NUrhr/iK70e+bHnA9lwvG7Z2vH3Zp0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794532671; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/j72zvAt1WMfGgTCF0Yh8J98QSKVFNx6xjG61oB4OkM=; 
	b=j4cJUW7SO8NIX3R6sAZ5VqaOsdkiqg7RM8DRFG0rvDhh0qK9fcyu6Wi7qf+511V8tqE4Cfox5B+HLw4W9SVsH33awA1+PXJ+XmKnKnsLynUPyD+xC2QPfx97xm2tWJ6TBDsHn5oJNsJGkY+UiJQizMp+iVGjRvGQ0QndanIFgSE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: a=rsa-sha256; b=ah1EcesWxMyDmAUOAmDwYXqXQoLc79ZmLJrJ3DGxL50TCiM7ak0p0W9o8F3fNHMXP/SS3lcBoVKr6o4RBd5OOZ+9u0w3tQ0hzmNVcdW5DM9wVbziqnZd9Iy41IXdF8iox/lqWsQyJ6E+b3UMCQl8MPm6WW4BF5MrBR9ssIqreXs=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=KE1akkFEuJf75Kt6P5uZlGEjaUFqQNlIPt1KnGsOo0k=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 17945326710961011.2476114199859;
	Thu, 12 Nov 2026 17:17:51 -0800 (PST)
Date: Thu, 12 Nov 2026 18:17:50 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: sashiko-reviews@lists.linux.dev
Cc: Ke Sun <sunke@kylinos.cn>, dri-devel@lists.freedesktop.org,
	ojeda@kernel.org, gary@garyguo.net
Subject: Re: [PATCH v6 04/10] drm/tyr: add per-file VM pool
Message-ID: <avZlPvHqlxmu2hNO@um790>
References: <20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn>
 <20261109-tyr-ioctls-v6-4-b2896bf2b3c9@kylinos.cn>
 <sashiko-outbox-204259@kernel.org>
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
In-Reply-To: <sashiko-outbox-204259@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.520.76

On Mon, Nov 09, 2026 at 12:48:15AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] drm/tyr: off-by-one IdPool capacity in VmPool::new() on
>   32-bit builds
> --
> 
> commit 6b8d6be457daf3e5e905977c364059ce3d3249e4
> Author: Alvin Sun <alvin.sun@linux.dev>
> 
> drm/tyr: add per-file VM pool
> 
> This commit introduces VmPool to manage up to 32 GPU address spaces per open
> file using an IdPool and an XArray, tearing down remaining VMs when the pool
> is dropped.
> 
> > diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> > index 1dd11b2b12532..6f5518652a03f 100644
> > --- a/drivers/gpu/drm/tyr/vm.rs
> > +++ b/drivers/gpu/drm/tyr/vm.rs
> 
> [ ... ]
> 
> > @@ -947,3 +953,135 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
> >  
> >      Ok(())
> >  }
> > +
> > +/// Maximum number of VMs a single file may hold, matching panthor's
> > +/// `PANTHOR_MAX_VMS_PER_FILE`.
> > +const MAX_VMS_PER_FILE: usize = 32;
> 
> [ ... ]
> 
> > +impl<'drm> VmPool<'drm> {
> > +    /// Creates a new [`VmPool`].
> > +    #[expect(dead_code)]
> > +    pub(crate) fn new(dev: &'drm Device<Bound>) -> impl PinInit<Self> {
> > +        let ids = IdPool::new();
> > +        pin_init!(Self {
> > +            dev,
> > +            ids <- new_mutex!(ids),
> > +            vms <- XArray::new(AllocKind::Alloc),
> > +        })
> > +    }
> > +
> > +    /// Stores the VM and returns the allocated ID.
> > +    ///
> > +    /// On failure - ID space exhausted or a store failure - the VM is
> > +    /// returned in an [`AddError`] so the caller owns the teardown.
> > +    // TODO: allocate IDs with the XArray directly (once it grows range
> > +    // allocation, the equivalent of C's `XA_LIMIT`) and drop the IdPool.
> > +    #[expect(dead_code)]
> > +    pub(crate) fn add(&self, vm: Arc<Vm<'drm>>) -> Result<u32, AddError<'drm>> {
> > +        let id = (|| {
> > +            let mut ids = self.ids.lock();
> > +            let unused = ids.find_unused_id(1).ok_or(ENOSPC)?;
> > +            if unused.as_usize() > MAX_VMS_PER_FILE {
> > +                return Err(ENOSPC);
> > +            }
> > +            Ok(unused.acquire())
> > +        })();
> 
> [Severity: Medium]
> Can VmPool::add() fail with ENOSPC on the 32nd VM on 32-bit builds?
> 
> IdPool::new() creates an inline bitmap of length usize::BITS, which is 32 on
> 32-bit platforms (indices 0..=31).  Because find_unused_id(1) skips bit 0,
> allocating 32 VMs requires bit index 32, so only 31 VMs (IDs 1..=31) can be
> allocated before find_unused_id(1) returns None.  Searching from bit 0 and
> adding 1 to form the 1-based VM ID (subtracting 1 on release_id()) would fit
> all 32 VMs within indices 0..=31.

Yes, this makes sense, on 32-bit builds the bitmap will stop at bit 31
and since we won't use bit 0, this gives us only 31 possible vm ids.

Instead of adding an off-by-one offset which seems like it could add
more confusion, what do you think of using the IdPool::with_capacity()
function? Something like:
  let ids = IdPool::with_capacity(MAX_VMS_PER_FILE + 1, GFP_KERNEL)?;

We would need to adjust the error handlings since this
is fallible but it might be simpler overall.

Deborah

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn?part=4
