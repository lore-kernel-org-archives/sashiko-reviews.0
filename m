Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59EFE51E42E
	for <sashiko-reviews@lists.linux.dev>; Tue,  8 Sep 2026 09:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788860144; cv=none; b=kQQ8JkSZzGit8/ITfTuCJrXVTmIZIgUmUdJ+HRhdrHPVXzdUVgsyPB0/CU/SRtNRqTdEH07SNlcifUy6FF4JVwvb70TzOLgO+CpwDldFYsWrb7MHmTnqLCWutqFGpiWRfAXAIuzXzcIpJazxzS+qZdCwi9LDwVf1Emso3oQIG+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788860144; c=relaxed/simple;
	bh=un38TU5iL/8xw2SNYVpohqlgfR9Mr+SbV4IeIeITIAk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=F+Hf/Y0uSkgAwXxZq0DZzEut4mLZvKE2gdRpETPaQnaettLL3F8l9v+a4SRhEPb1hL6qKLEjdFiwUL5AhEX1WG8H211iD5RNzUKshMNG8REnd7DDY3ChrHMMBpuCJ4CAJuczcct5V63EmFay/ENyzOeJbCnOolUwZksEVrBbgNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kTED3/vn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kTED3/vn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788860142; x=1820396142;
  h=mime-version:content-transfer-encoding:in-reply-to:
   references:subject:from:cc:to:date:message-id;
  bh=un38TU5iL/8xw2SNYVpohqlgfR9Mr+SbV4IeIeITIAk=;
  b=kTED3/vng0DR8yh+7X58ypucHHhCTN1QQ4fdBJ9sloQPBdV72zIQSdtU
   pfpAMJ6R/oOhE6mufLZtyG9LeQ+SKbRyd78cXk+SKTA3XydV1hbwo49ij
   1OmYDLmsub+fybRdq1+DjrDL/cYp/3GgAxXrCVc6BXsANFUQZ9pB8I3HO
   oWpTeAx9g96aLXoGjRMriswNRhXh2tway1dVRWi5RE6KPcD/enIcRfLky
   Nce9Cd3T1KNKhsVmiOoUzlogHtZJJzsHMviDQmHHB/omIbg5uQwoPcozw
   vPX/GcAiGHOwlblq94y8k2awMETF3/ZIIuC5ED/54i2/EneWNmyySH0UU
   Q==;
X-CSE-ConnectionGUID: 7C75IDBjRKulVxJ/Se2aKA==
X-CSE-MsgGUID: Tq6WSL0sTiqUcrvY8bKcqA==
X-IronPort-AV: E=McAfee;i="6800,10657,11899"; a="93076554"
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="93076554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:35:41 -0700
X-CSE-ConnectionGUID: jP9OETxiReufgnyk3/G7hw==
X-CSE-MsgGUID: Fdfuh+8pRZSB3O0a8FT52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,268,1779174000"; 
   d="scan'208";a="264745324"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.124])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2026 02:35:39 -0700
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260903154646.687761F000E9@smtp.kernel.org>
References: <20260903145952.848051-1-mika.kuoppala@linux.intel.com> <20260903145952.848051-28-mika.kuoppala@linux.intel.com> <20260903154646.687761F000E9@smtp.kernel.org>
Subject: Re: [PATCH v10 27/27] drm/xe/eudebug: Enable EU pagefault handling
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, sashiko-bot@kernel.org, sashiko-reviews@lists.linux.dev
Date: Tue, 08 Sep 2026 12:35:36 +0300
Message-ID: <178886013688.31673.13515073284471668217@jlahtine-mobl>
User-Agent: alot/0.13.dev2+g40c57d620

Quoting sashiko-bot@kernel.org (2026-09-03 18:46:45)
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
> - [High] Temporary NULL VMAs for subsequent eudebug pagefaults are destro=
yed immediately after ACKing the fault, creating a race condition that lead=
s to livelock.
> - [High] Successful SVM pagefaults bypass private tagging, which permanen=
tly stalls the finalization of the active eudebug session.
> - [High] Pagefault cache hits bypass eudebug tagging, permanently hanging=
 the debugger session.
> - [High] `xe_vm_svm_vma_subtract()` is called with unaligned address boun=
daries, corrupting the VM layout.
> --
>=20
> commit bd171058301961cced31067feb0527d9f0b38c87
> Author: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
>=20
> drm/xe/eudebug: Enable EU pagefault handling
>=20
> This commit enables EU pagefault handling for XE2/PVC hardware, allowing
> the driver to unhalt pagefaulted EU threads via SIP mode and a temporary
> null page.
>=20
> > diff --git a/drivers/gpu/drm/xe/xe_guc_pagefault.c b/drivers/gpu/drm/xe=
/xe_guc_pagefault.c
> > --- a/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > +++ b/drivers/gpu/drm/xe/xe_guc_pagefault.c
> > @@ -59,13 +60,14 @@ static void guc_ack_fault(struct xe_pagefault *pf, =
int err)
> >                             write_only);
> >  }
> > =20
> > -static void guc_ack_fault_end(void *private)
> > +static void guc_ack_fault_end(void *private, int err)
> >  {
> > -     struct xe_guc *guc =3D private;
> > +     struct xe_guc *guc =3D xe_eudebug_pagefault_get_private(private);
> > =20
> >       if ((guc->pagefault_ack_counter & (XE_GUC_PAGEFAULT_FLUSH_PERIOD =
- 1)) !=3D 1)
> >               xe_guc_ct_send_flush(&guc->ct);
> >       xe_guc_ct_unlock(&guc->ct);
> > +     xe_eudebug_pagefault_end(private, err);
>=20
> [Severity: High]
> Does this create a race condition that leads to a livelock?=20
>=20
> When this calls xe_eudebug_pagefault_end(), temporary null VMAs for
> subsequent pagefaults are destroyed immediately (destroy_pf =3D 1) after
> ACKing the fault and signaling the hardware to resume.=20
>=20
> Since there is no synchronization to guarantee the EU thread has re-execu=
ted=20
> the faulting instruction before the KMD unbinds the VMA, if the VMA is
> unbound before the EU thread accesses the address, won't the thread
> pagefault again on the same instruction and loop infinitely?

There's no re-execute of the faulting instruction. The thread is blocked
waiting for the PF to resolve. We resolve it by mapping a NULL page
(which will discard writes and read zeroes), once that PF reply is sent,
the blocked thread steps to next instruction. Due to also setting the HW
to interrupt on next instruction for all threads before resolving the PF,
the non-impacted threads will have entered the system routine before
resolving the PF and only the PF impacted threads will be blocked by HW
due to the PF and then ultimately enter the system routine on IP+1 after
we resolve the PF. So there is no re-execute of command on IP, and no
infinite loop.

Regards, Joonas
