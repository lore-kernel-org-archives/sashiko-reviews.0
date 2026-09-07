Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA834F6465
	for <sashiko-reviews@lists.linux.dev>; Mon,  7 Sep 2026 13:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788787494; cv=none; b=DYcS2JrcuIKnXMeux6BCfJhDZ0+2BcmEE2HMyMy0Q0mmZhapXGjlXUPrAQHueN9dJVM7tZG7kHUS6tOTQdsKi2UnwioIVmyhpTkePpFWPDKUXvWqLd/iuShWsu5TMA8alZw2MyVf2oEeajpuTUZ2ah3xlnV6v/AeXBdCQbGduTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788787494; c=relaxed/simple;
	bh=jXcUem++54xjhIYdXSyZ4JYYIyEfiX3kBtjmOOIvrAI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZHiEIyoW0aFQe81ZcF0AFEiEJL9uoiT9byKpM8qn2KQjYo3XjsFdIXm7zIUA4UyHO2cNYC+5NlnfG6PFfd/bCOCigsBhZ1ENBWnm5z7WxX+QfHbkKNInun064AClABAcowaqZ+oLm3rVzibhDNZ19A57d/5lYuMQJe4II8WwrfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W71AJpkX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W71AJpkX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788787489; x=1820323489;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=jXcUem++54xjhIYdXSyZ4JYYIyEfiX3kBtjmOOIvrAI=;
  b=W71AJpkXBR/5ezTzjzpE2Zuj1ViQvaYcSu3X2jPcD9dPk6zWwdIBVuFS
   sTitl4QtuWC6ZL11KVNrBl8Xw1/z9KJjWiLoRjdlVw+ZRvxE21a+O6Deg
   Iijl8uFgmvil0A8Ura+fY8RFNp1OHDp4OhbFJ+BeF710vWth3+ymz0EXg
   nyjW/XMNdfEYyo+SPrCyfrBHCILpL8JkqocL7jWqYyuV6vTzq3BLCVNGZ
   TMxodOlKFEN3GaZwOFxc6zR4FJaobc2Ah4gFLNVchpTWiAq3ADfUhifHm
   WGHtBxQtcwH1H2aLo1EqIh8CYgresvCHmEFEYSlfEt/Fu762VO3wGu6Ki
   w==;
X-CSE-ConnectionGUID: a0kHOtOyTp6e0GmWfEu8og==
X-CSE-MsgGUID: kTL3Jnm5TuyHHm4hC7/wsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="100712401"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="100712401"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 06:24:45 -0700
X-CSE-ConnectionGUID: wA33RQEMSwinpFLzwJLb/A==
X-CSE-MsgGUID: oUfhni57TIauRg2+3Gxl3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; 
   d="scan'208";a="294186705"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.184])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Sep 2026 06:24:44 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260903152224.AD48C1F00A3F@smtp.kernel.org>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com> <20260903145952.848051-5-mika.kuoppala@linux.intel.com> <20260903152224.AD48C1F00A3F@smtp.kernel.org>
Subject: Re: [PATCH v10 04/27] drm/xe/eudebug: Introduce discovery for resources
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev
Date: Mon, 07 Sep 2026 16:24:40 +0300
Message-ID: <178878748003.179185.16833574173741290547@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting sashiko-bot@kernel.org (2026-09-03 18:22:23)
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
> - [High] Global ordered workqueue stall via copy_from_user block while ho=
lding ioctl_lock.
> - [Medium] Event sequence numbers (seqno) can be queued out-of-order in t=
he event stream due to a race between seqno generation and event queuing.
> --
>=20
> commit e2061e72d8e954a17bde35e9c970ee41bc2db0ad
> Author: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>=20
>     drm/xe/eudebug: Introduce discovery for resources
>=20
> This commit introduces a resource discovery mechanism for debugger connec=
tions.
> When a debugger connects, all existing resources for the target client are
> relayed as events via an ordered workqueue, and DRM ioctls are blocked us=
ing
> an rw_semaphore until discovery is complete.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_dev=
ice.c
> > index 032a7ec5fbc8d..f10959b898297 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> [ ... ]
> > @@ -238,8 +239,12 @@ static long xe_drm_ioctl(struct file *file, unsign=
ed int cmd, unsigned long arg)
> > =20
> >       ACQUIRE(xe_pm_runtime_ioctl, pm)(xe);
> >       ret =3D ACQUIRE_ERR(xe_pm_runtime_ioctl, &pm);
> > -     if (ret >=3D 0)
> > +     if (ret >=3D 0) {
> > +             bool lock =3D xe_eudebug_discovery_lock(file, cmd);
> >               ret =3D drm_ioctl(file, cmd, arg);
>=20
> [Severity: High]
> Does holding the discovery lock across drm_ioctl() create a vector for a
> workqueue stall?=20
>=20
> If an unprivileged user maps the ioctl argument pointer to a blocking FUSE
> or userfaultfd region, drm_ioctl() can be stalled indefinitely during
> copy_from_user() while holding xef->eudebug.ioctl_lock for read.

Don't think this is a very realistic vector to address, as it would
also extend to every other copy_from_user() and also to userptr across
all drivers.

Having a malfunctioning FUSE driver and getting a malfunctioning system
as a result is probably somewhat expected.

<SNIP>

> > +     if (IS_ERR(wq)) {
> > +             err =3D PTR_ERR(wq);
> > +             goto out_err;
> > +     }
> > +     xe->eudebug.discovery_wq =3D wq;
> > +
> >       err =3D sysfs_create_file(&dev->dev->kobj,
> >                               &dev_attr_enable_eudebug.attr);
> >       if (err)
> [ ... ]
>=20
> [Severity: Medium]
> Can sequence numbers be queued out-of-order in the event stream?
>=20
> Looking at send_vm_bind_event() in xe_eudebug.c:
>=20
>         *seqno =3D atomic_long_inc_return(&d->events.seqno);
>=20
>         spin_lock(&d->events.lock);
>         event =3D xe_eudebug_prepare_event(d, DRM_XE_EUDEBUG_EVENT_VM_BIN=
D,
>                                          *seqno, base_flags, sz);
>=20
> Since the sequence number is incremented atomically outside of the FIFO
> spinlock, could two threads acquire sequence numbers N and N+1, but acqui=
re
> the FIFO lock in reverse order?
>=20
> This same pattern appears in _xe_eudebug_add_handle(). Pushing N+1 before
> N would break the expected monotonicity of the event stream and could cau=
se
> the debugger to drop events.

There is no expected monotonicity of the event stream, the seqno exists
exactly to address the non-linear nature of the event stream. It's up to
userspace to queue events and re-order them.

We should probably try to add this to kerneldoc to avoid false positives
in future.

Regards, Joonas
