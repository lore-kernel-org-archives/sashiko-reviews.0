Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EA43CB2D2
	for <sashiko-reviews@lists.linux.dev>; Wed,  9 Sep 2026 10:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949284; cv=none; b=t7S1/D4bgoVb1Z3JDXVFR5V5LP8PtF+bjla7PN3JZEGyoF+tXbpDx12niCIZNiPETmWvGVxveP7FkCjz6GVEwip7tuQIAZB9mWsknDmCwdo8TBXemsjkWrigCW7HKIJrPTg+eP4emKQq9uQuDRf5beda7XZfRkfAnuLjpUOxuBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949284; c=relaxed/simple;
	bh=VLstWzBDA90Ll3KP/e7MAAdlmGR1TcA8A3ZIvFVZZWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qD5N1lSNCIvB3t8XB3C7BI3ePhzGxAPe8vxx/27Xl0nQw/oX2SLrSCV2I62jMFP08ZYBqhnT63Ewr4DE2U4JZ5Ap7vE4ijkZBwGJPVaxyJ80mbX/fnUPL5EEzbWEHMXhrbC7JSiLQUUZRsAkbwXUoM2eTs4fPPIvCbHvJOyqjCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=jP4i135q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="jP4i135q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so79516505e9.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 09 Sep 2026 03:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1788949280; x=1789554080; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QW7FwcI5CLpgkHE+mMHfthdjtYGSrqpt8xAnoW9r4Hs=;
        b=jP4i135qQmQkkgTj09HzMFsEdKWSiyMxwbfblQmrfW26ypiV8Qnd+ty5n/WpE3bxne
         dyF8RvLdMrEdsBbSrjb/0s7E0o2BLuSgtwmZZ3smvvdZddAPHx1V5d6szz1SOCCLhDYi
         XdB9Y18nef9iz6/dPPQfrwxPK1rDbCkHpsLm0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949280; x=1789554080;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QW7FwcI5CLpgkHE+mMHfthdjtYGSrqpt8xAnoW9r4Hs=;
        b=k3FGR5tobAZCAmwWb35e3JKNsroNcDOqM2ncysYb5Qg/5Vi2jbqoj0ZmxVfd1rU0px
         9WMI+5WsAr3C+xv3NtGPIwfip/bpx5SU8oo30EWKA4y8VfCnuhH5ar5flKB+jdQO9z3L
         xyJJqm/InsWyZYq+8985yTzr2gWzhH/aoo1MKpJtfFrPeXIOo2zq++WTYhJKb/As6CQ0
         gEHb6VzbKUNqiwpvmQSWLyKm03T1JhHk/FOVx1guclEoi7R0+hJfNhQ7pgVytXV+7dzw
         PwfoTuHiv9wfX2NZm1popvp3Na2vMi+DqEm05RdOCZTBINxli5nO3VeR03KALFpGDUS9
         DpIg==
X-Forwarded-Encrypted: i=1; AKwUvBzh4ioGyXK1nWtlJHQ34rN9sKmeOyGrdKiRPkAoZGIIrUTADtj1zIeTviDqnrWUBMsBJVtJ+PTMPIEK/Wv4vbg=@lists.linux.dev
X-Gm-Message-State: AFuF++k47UxQOsSiX8o7hRAYBhGLtIHGSp96ezNoYIn4rR3fgXsaPdNg
	qg4nbjkIrhDxIhwYshTPh6bwtPB/DAwRk1jmforaGuvlZIKdGaXQJbiljQEaojmqVX4=
X-Gm-Gg: AYBFou3YxiPnegODaFXYZdviZfr8ZMS58JRFS35L0D1Dqju6uAIYUgVC2V8xTV8yf1s
	J7EVsuT9+gtkhIIQdWT6EcCkk2W8VHkRGJIC9o0LneDz9JTVlN5IuPFWceCv8Zoe0cfB60OBOTS
	UYidgSSF+PED0AkknQmHmiItrJil6MNVdBdrK6xERSgg2yET0TJ1hTR5u8t5VpCuZPqe4Ss6rSs
	DQ7GeHOrkMk0QsdYvaoDfMBrK3+Jp0m45TTRBGUAokOLli5elQd5UmfHZgctF9lC+Li2B3qe6H1
	2aeftQHXPBWHRuw+5ym0FMuFSnCZgi42YWtGjHJVSBC5dma2ZMcBaJKyIJLucQSz5X1qAIusWhQ
	LEkxhjgIbF0+dTAvCJnd26KClfzg9qinCD1R7Brt69lgj0Gv4DpMl85veyu5c/oxjI/cWEDPYU4
	DotC2gzq1wD3EZQfWiqrksekII5wiNjWwcqS5+mWwuk59D/+vg7aEupphXz0ti+JZqGAchz/NAR
	1Gqh26UoHY=
X-Received: by 2002:a05:600c:3e06:b0:49d:99:1d98 with SMTP id 5b1f17b1804b1-49d00991db1mr277639155e9.9.1788949280007;
        Wed, 09 Sep 2026 03:21:20 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cf7740d44sm1008046105e9.15.2026.09.09.03.21.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 03:21:19 -0700 (PDT)
Date: Wed, 9 Sep 2026 12:21:17 +0200
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Miklos Szeredi <miklos@szeredi.hu>, Bernd Schubert <bernd@bsbernd.com>,
	Joanne Koong <joannelkoong@gmail.com>,
	Amir Goldstein <amir73il@gmail.com>, intel-xe@lists.freedesktop.org,
	fuse-devel@lists.linux.dev, sashiko-bot@kernel.org,
	sashiko-reviews@lists.linux.dev, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Srinivasan Shanmugam <srinivasan.shanmugam@amd.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
	dri-devel@lists.freedesktop.org,
	Mika Kuoppala <mika.kuoppala@linux.intel.com>
Subject: Re: FUSE deadlocks vs. copy_from_user() and locks (Was: Re: [PATCH
 v10 04/27] drm/xe/eudebug: Introduce discovery for resources)
Message-ID: <aqEzHQMrI8p9XVcu@phenom.ffwll.local>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com>
 <20260903145952.848051-5-mika.kuoppala@linux.intel.com>
 <20260903152224.AD48C1F00A3F@smtp.kernel.org>
 <178878748003.179185.16833574173741290547@jlahtine-mobl>
 <178894801687.37859.4186888279082797860@jlahtine-mobl>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <178894801687.37859.4186888279082797860@jlahtine-mobl>
X-Operating-System: Linux phenom 7.1.3+deb14-amd64 

On Wed, Sep 09, 2026 at 01:00:16PM +0300, Joonas Lahtinen wrote:
> (Adding bunch of FUSE folks and DRM folks in the hopes of coming to a
> resolution here.)
> 
> Quoting Joonas Lahtinen (2026-09-07 16:24:40)
> > Quoting sashiko-bot@kernel.org (2026-09-03 18:22:23)
> > > Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> > > - [High] Global ordered workqueue stall via copy_from_user block while holding ioctl_lock.
> > > - [Medium] Event sequence numbers (seqno) can be queued out-of-order in the event stream due to a race between seqno generation and event queuing.
> > > --
> > > 
> > > commit e2061e72d8e954a17bde35e9c970ee41bc2db0ad
> > > Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > > 
> > >     drm/xe/eudebug: Introduce discovery for resources
> > > 
> > > This commit introduces a resource discovery mechanism for debugger connections.
> > > When a debugger connects, all existing resources for the target client are
> > > relayed as events via an ordered workqueue, and DRM ioctls are blocked using
> > > an rw_semaphore until discovery is complete.
> > > 
> > > > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> > > > index 032a7ec5fbc8d..f10959b898297 100644
> > > > --- a/drivers/gpu/drm/xe/xe_device.c
> > > > +++ b/drivers/gpu/drm/xe/xe_device.c
> > > [ ... ]
> > > > @@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > >  
> > > >       ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> > > >       ret = ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
> > > > -     if (ret >= 0)
> > > > +     if (ret >= 0) {
> > > > +             bool lock = xe_eudebug_discovery_lock(file, cmd);
> > > >               ret = drm_ioctl(file, cmd, arg);
> > > 
> > > [Severity: High]
> > > Does holding the discovery lock across drm_ioctl() create a vector for a
> > > workqueue stall? 
> > > 
> > > If an unprivileged user maps the ioctl argument pointer to a blocking FUSE
> > > or userfaultfd region, drm_ioctl() can be stalled indefinitely during
> > > copy_from_user() while holding xef->eudebug.ioctl_lock for read.
> > 
> > Don't think this is a very realistic vector to address, as it would
> > also extend to every other copy_from_user() and also to userptr across
> > all drivers.
> > 
> > Having a malfunctioning FUSE driver and getting a malfunctioning system
> > as a result is probably somewhat expected.
> 
> Based on further chatting on this with Sima, I was volunteered to pull
> together the discussion here.
> 
> We seem to have Sashiko picking up on patterns about accessing userspace
> memory with locks held and potential for copy_from_user() (or userptr) to
> then take indefinitely long to resolve. And that spreads to deadlocks
> everywhere situation very fast.
> 
> Based on reading of [1] and [2], it seems pretty much expected FUSE
> drivers can trivially deadlock and ultimately in worst case the situation
> can only be solved by manually aborting those connections by sysadmin.
> 
> It also seems (from the Sashiko comments) that by design, there's no
> upper bound for how long an operation can take, so a bad FUSE driver
> may stall for however long it sees fit to serve page-fault or in the
> case of [3] it may decide to not actually populate the PTEs (or maybe
> invalidate them immediately).
> 
> Should we really be refactoring the whole kernel for the sake of
> knowingly allowing potentially malicious userspace driver to idefinitely
> stall or incorrectly resolve page faults? That'll be quite a lot of
> complexity added to all the other drivers.
> 
> Or should there be more protections on FUSE / uffd to ensure such
> idefinitive stall can't happen? Or maybe this is just an academic
> problem and we amend review-prompts not to bring it up?
> 
> Or maybe I missed some part of the FUSE docs and this isn't a real
> problem?

Thanks for typing this up, matches what I think is going on here.

> Regards, Joonas
> 
> PS. There is a related patch in [3] which tries to address the problem,
> but we'll quickly run into live-locks and other issues even if we
> refactored things into: pre-fault, take locks, do _nofault() access, and
> retry if that fails.

Yeah just quickly wanting to add here that in my opinion, trying to sort
this out in all the various subsystem is not how we should even start to
think about this issue. This would be a fundamental change in how
subsystems are allowed to nest locking with stuff that can trigger
userspace faults.

I did ponder a bit how this could be solved on the fuse side of things,
maybe with some seccomp style filters. Like maybe lockdep could be
enlisted to help catch deadlocks, with a special "this is a fuse process,
it all defacto runs in fault handler context. But that only catches bugs
in normal use, not malicious exploits. And given that userspace can choose
the timing and unblock at will (I think so at least), this is pretty
powerful tool for being nasty to the kernel.

But mostly I want to really, really stand back in awe about this issue and
not think too hard about it.

Cheers, Sima

> [1] https://www.kernel.org/doc/html/next/filesystems/fuse.html#kernel-userspace-interface
> [2] https://www.kernel.org/doc/html/next/filesystems/fuse.html#aborting-a-filesystem-connection
> [3] https://sashiko.dev/#/patchset/20260827062142.4038272-1-srinivasan.shanmugam%40amd.com

-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch
