Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6960A4CDDEF
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 14:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790693512; cv=none; b=CcFCfFcAWGPAZc2JAJtyvjuSNEgVbQo0nT/C/TzmrGr313b741WVJ2ruK0NFEMMlvEsApMceWij/JTcZbBkMDXCb9Hl4Btgpi/bC+oUs07tANA+U5BvVEBgDPOpTSc50UUpAK3bc0QASU9X1mUEVNzt0H4jl1j9KaWoMNYE53WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790693512; c=relaxed/simple;
	bh=MRuyxQXJp40bL8dwNATYRFY1ijbLSnp0uV/0N1XZbr4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s04Z//+N0lJb15D24FYFmtSQQbrlkUZ6kpMEug7UJLm698bAfVwkR7U4dnz5/O+8k0am2u94ykj4I4Vz2urEktaXERylG1y+loZOKmmsZQXxgXB+jRAJkA56SSR/t4/bEeUkyMEMQ0XNxTurzLnQqccDJvrx5IrqSLQnWDIxLE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cNKhX3fQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cNKhX3fQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790693510; x=1822229510;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=MRuyxQXJp40bL8dwNATYRFY1ijbLSnp0uV/0N1XZbr4=;
  b=cNKhX3fQSxuTRzexVI3paYq6fIk8HiUyDgvCnhEt0E/RK2jYM9zdEeJp
   PbS4mYi/UzkWRiyXoI+VLumQpSpzz3D1BWWg88G8+UPmmQ75tUmmDTtAf
   VlzfeX4HFolilhiYgVFlOVUMaH0/RNDpHQFhWwz7HhCToQua8f7c+UrRv
   2yI8qhoMnzO3WojJVXYCd3iSvO/Ax8yijrCc/KUMH+0BSxFnZwi23d0mE
   E/ikFU4aA0/gzhbiF8h+LDls678+MA8Nv1JaPjooSk1bampZceAx+V4gk
   yINd6/lIqPNL5VxNSjRHXYJfciesaFP3NPelRcRieReMDmcv7z5IUtacc
   Q==;
X-CSE-ConnectionGUID: HuBgtQn3S82OHf4rPa9pBA==
X-CSE-MsgGUID: nqYkb1SGSmmSRDWwLr1ElQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="95227504"
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="95227504"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 07:51:50 -0700
X-CSE-ConnectionGUID: 5lNNmvaXR3GwIqXpUfPdBw==
X-CSE-MsgGUID: 9WrxSw64SeCt9TTbkKQkMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,130,1787036400"; 
   d="scan'208";a="278735337"
Received: from abityuts-desk1.ger.corp.intel.com (HELO [10.245.244.222]) ([10.245.244.222])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 07:51:49 -0700
Message-ID: <6783d40b1d6881ed8ea58ae15d5b83a1092544cc.camel@linux.intel.com>
Subject: Re: [PATCH v4 1/3] drm/xe: Don't unload the driver until all drm
 devices are freed
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: sashiko-reviews@lists.linux.dev
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Sep 2026 16:51:46 +0200
In-Reply-To: <20260929144106.68C6C1F000FF@smtp.kernel.org>
References: <20260929142910.47480-1-thomas.hellstrom@linux.intel.com>
	 <20260929142910.47480-2-thomas.hellstrom@linux.intel.com>
	 <20260929144106.68C6C1F000FF@smtp.kernel.org>
Organization: Intel Sweden AB, Registration Number: 556189-6027
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-09-29 at 14:41 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] xe: module unload race causing instruction page fault in
> xe_device_destroy()
> --
>=20
> commit 4a4203d8cd4165e1a99345416f131e7eafe530d1
> Author: Thomas Hellstr=C3=B6m <thomas.hellstrom@linux.intel.com>
>=20
> drm/xe: Don't unload the driver until all drm devices are freed
>=20
> This commit introduces a device count and a module exit hook to wait
> until all bare drm_device references are freed before unloading the
> xe
> module. It uses a 20-second timeout with wait_var_event_timeout() to
> block rmmod from unloading while devices remain active.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
>=20
> [ ... ]
>=20
> > @@ -391,6 +394,9 @@ static void xe_device_destroy(struct drm_device
> > *dev, void *dummy)
> > =C2=A0		destroy_workqueue(xe->destroy_wq);
> > =C2=A0
> > =C2=A0	ttm_device_fini(&xe->ttm);
> > +
> > +	if (atomic_dec_and_test(&xe_device_count))
> > +		wake_up_var(&xe_device_count);
>=20
> [Severity: High]
> Does this wake up the rmmod thread while still executing inside
> module text?
> If the thread executing xe_device_destroy() is preempted immediately
> after
> wake_up_var(), rmmod can complete the module exit sequence and unmap
> the
> xe module text. When the preempted thread resumes, it might attempt
> to
> execute the function epilogue in unmapped memory, potentially causing
> an
> instruction page fault.

This warning is a consequence of removing the first patch. But it's a
false positive. If the drm_dev_put() is executed within an xe module
workqueue we wait for that work item to complete later in the unload
sequence. If called from a driver hook the caller holds a module
reference around the drm_device reference.

/Thomas



>=20
> > =C2=A0}
> > =C2=A0
> > =C2=A0/**
>=20
> [ ... ]
>=20
> > @@ -1501,3 +1508,25 @@ struct xe_vm *xe_device_asid_to_vm(struct
> > xe_device *xe, u32 asid)
> > =C2=A0
> > =C2=A0	return vm;
> > =C2=A0}
> > +
> > +/**
> > + * xe_device_exit() - Device subsystem exit function.
> > + *
> > + * Exit function to be called at module unload time.
> > + */
> > +void xe_device_exit(void)
> > +{
> > +	/*
> > +	 * Wait for all devices to be freed. 20s is well above the
> > typical
> > +	 * maximum dma_fence signalling time, so warn and keep
> > waiting if
> > +	 * we're still not done by then, since it may indicate a
> > leaked
> > +	 * xe_device reference is stalling module unload.
> > +	 */
> > +	if (!wait_var_event_timeout(&xe_device_count,
> > +				=C2=A0=C2=A0=C2=A0
> > !atomic_read(&xe_device_count),
> > +				=C2=A0=C2=A0=C2=A0 HZ * 20)) {
>=20
> [Severity: High]
> Is there a risk that the rmmod thread waiting here proceeds to exit
> and unmap
> the module before the waker has safely exited xe_device_destroy()?
> Once
> awoken, this thread is unaware that the waker is still executing in
> module
> text.
>=20
> > +		pr_warn("%s: Waiting for %d xe device(s) to be
> > freed before unloading.\n",
> > +			DRIVER_NAME,
> > atomic_read(&xe_device_count));
> > +		wait_var_event(&xe_device_count,
> > !atomic_read(&xe_device_count));
> > +	}
> > +}
