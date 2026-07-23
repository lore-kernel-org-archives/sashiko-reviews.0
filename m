Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC93416841
	for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 15:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784821440; cv=none; b=rEmkF4M/aJXmb+H4NE4///jgjUuNG80BZqf1x0p6d1uMrieeN231MksPYcMeCJfjBJYQt6ZSQDblh1ZLZp85AGybq4gKaF1Qn6NnHgB/EE89zskRv8ukXCZV6xdXVruxiaNSpNorBdqjaP12F/QBNQw+JXLZEavAxCDvQ9tbigY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784821440; c=relaxed/simple;
	bh=cNa9g8IbxlINQn71x0nJxZmvr4n3/R5gi2Ef4pJH2Ao=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o34imYzJfk1RIosJwiYPeRGZtKJ96iWwx2ZgbTHiw/r2HrnqH3Yu1ETtiAXYKcmUFy4mi9hkXunJH6y/jnB27W5ROcvnHm55VwKR8rSRLtAJGCrg3rrj7X+Gfuq2RZ3AWmRbdQHHu3NnxDNxZ+5ACj3Skk9H+qp1O5ufDlzwqvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K9vEonxC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K9vEonxC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784821433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cNa9g8IbxlINQn71x0nJxZmvr4n3/R5gi2Ef4pJH2Ao=;
	b=K9vEonxCJF8NyQNB6FB5RY6EW3W/HIFJg7hu99eQkHOqyh+wuUH8Anr1E3tifpqIaVfOGj
	pAHndYjuDgjwQdW4J5g37RiFAf5qUU8dVLEP4Whi7nlrn0BbyqDq5s5AscvQXmKIeXJnd3
	umI6Lbxr0C2b0H1Iqn68w4YMeL8pNoc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-oDLUORiHNF2QGl3N2ErZLw-1; Thu, 23 Jul 2026 11:43:52 -0400
X-MC-Unique: oDLUORiHNF2QGl3N2ErZLw-1
X-Mimecast-MFC-AGG-ID: oDLUORiHNF2QGl3N2ErZLw_1784821431
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5fc4c7e9so100605985a.3
        for <sashiko-reviews@lists.linux.dev>; Thu, 23 Jul 2026 08:43:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784821431; x=1785426231;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a0f5FCY8RFaoWJvszTpojKDVKtO+UBE2lORQW5KPgAk=;
        b=aVdLBkEGjB70VDwQRLAud5ZmlF53ar/suPBhJU6EgxLfzEy+jWBfFddRN8dXZ6cZYT
         gv7CgN7FjCQm6MlvCpj35PgvsJ7XSak0hbZPUNpmzsciPqRsfCTj7eOyvPIGwnh5ou+S
         NIuIs5O2s0pAEmlIEB0fPhq3X+c8pVDj7Ln//rtw/GMobwt+nMQjya1RZHnJ7ef1LCsV
         b9xhsubqBtnmydCiEjWSTrugH3v2U2NLwq11lh6MEo6N2HBWVGpVyAvZQyZbamJbpEJ1
         uajn2bjZHXaTgLAjZhzXG571EZlyBMXcmQLDcHOeOrejODsQf9puEsTGUHZxxjq5FQN7
         I33A==
X-Gm-Message-State: AOJu0YzogkbOSEVOM5SnuTdPbdroEFbksUoP3iaMwvmWi1Rq93zshhqq
	/nvYuJHf10Cb0t+0H+ZY1W2wK6BCsIDoPtFn6eyjvKRJWvH/jlKaBXAm9oRlUJRiFNb5CGZU8XD
	AWcGSf6PUPp9S/baZHYD0Mv3DMldhDwp0ncm3rOrwr++aLY9RO4ZIlz2yYdQisDZ/CRllPRJZDe
	zrpfvBEyzzxg1x/e7xSf/Qg5wTMFR7T2MVzz7ccUiWTnQIS/n4aKGe7w==
X-Gm-Gg: AR+sD122zKLZUD+UhIpiCelsN6eutAQ1+GXjkJyanMsGaj+cedt0yfZNWZtdtbuL8RA
	/RIRfem4y0+pHkyMj52nVsy9tN2hkW9QIue3aUjk+a5H1qGit3c9hJ9pQVZFe3DKewWJzdQALb9
	im5cI6gqZGRQ/fKAvbqZL2IGfIBYbl6BriSR/i/I/gnw40eVgjEhA4H9CI7+VrqZ3fBoGd8Ww7g
	FgADmCey6xsuHOx5qHQQCuLYFJAXDAFaOnKebuf/FSxZc3b7UZkcou2PV4GTCZeknbzWVuRAhAK
	ix2IXaL5wWOykEcvEyWuzKIU+vA5CNSOZEIvLeys8btPZ1JTamH4P5OgPUiCo+tgRTx+TizqNUB
	OVQrFXlwtIyzCqI8FH+8jOaSbMk8M8fZIKQPr
X-Received: by 2002:a05:620a:2259:10b0:92e:b17d:3bd5 with SMTP id af79cd13be357-93103631f53mr275826185a.37.1784821431348;
        Thu, 23 Jul 2026 08:43:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2259:10b0:92e:b17d:3bd5 with SMTP id af79cd13be357-93103631f53mr275822385a.37.1784821430477;
        Thu, 23 Jul 2026 08:43:50 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:dbb1:97f1:a6e6:766b])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f687acdasm441727685a.1.2026.07.23.08.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 08:43:49 -0700 (PDT)
Message-ID: <a95878ba0518d010ba4ca8243b82754f7755f7e8.camel@redhat.com>
Subject: Re: [PATCH] scsi: storvsc: Support manual scans for all Hyper-V
 targets
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org, linux-hyperv@vger.kernel.org
Date: Thu, 23 Jul 2026 11:43:48 -0400
In-Reply-To: <20260723153101.13F911F00A3A@smtp.kernel.org>
References: <20260723151458.872265-1-loberman@redhat.com>
	 <20260723153101.13F911F00A3A@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EkfyRE1jSU0Ks2cMmqSzdNH6OVOPlX2LOCJeVSnMuT0_1784821431
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-23 at 15:30 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> New issues:
> - [Low] The patch calls the unexported internal midlayer function
> `scsi_scan_host_selected()` and includes the private header
> `"scsi_priv.h"` from a hardware driver, which will break module
> builds.
>=20
> Pre-existing issues:
> - [High] Timeouts on targets scanned without an `fc_rport` parent
> will cause a NULL pointer dereference in the FC transport error
> handler.
> --
>=20
> --- Patch [1]: [PATCH] scsi: storvsc: Support manual scans for all
> Hyper-V targets ---
> commit ce267d7e85b7a51757a8afe1188939d3c5146d27
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: storvsc: Support manual scans for all Hyper-V targets
>=20
> This patch provides a storvsc-specific user_scan callback that
> directly
> invokes scsi_scan_host_selected(). This bypasses the single-rport
> lookup
> in fc_user_scan() to allow userspace to explicitly scan any target
> supported by storvsc. The goal is to avoid requiring storvsc to
> create
> and manage synthetic fc_rports for every Hyper-V target.
>=20
> > diff --git a/drivers/scsi/storvsc_drv.c
> > b/drivers/scsi/storvsc_drv.c
> > index f03dc03a42c35..eb40473a8aad6 100644
> > --- a/drivers/scsi/storvsc_drv.c
> > +++ b/drivers/scsi/storvsc_drv.c
> > @@ -43,6 +43,7 @@
> > =C2=A0#include <scsi/scsi_dbg.h>
> > =C2=A0#include <scsi/scsi_transport_fc.h>
> > =C2=A0#include <scsi/scsi_transport.h>
> > +#include "scsi_priv.h"
>=20
> [Severity: Low]
> Will this cause an architectural layering violation? Including a
> private
> midlayer header like scsi_priv.h from a low-level hardware driver
> normally
> breaks subsystem encapsulation.
>=20
> [ ... ]
>=20
> > @@ -550,6 +551,17 @@ static void storvsc_host_scan(struct
> > work_struct *work)
> > =C2=A0=09scsi_scan_host(host);
> > =C2=A0}
> > =C2=A0
> > +#if IS_ENABLED(CONFIG_SCSI_FC_ATTRS)
> > +static int storvsc_user_scan(struct Scsi_Host *host,
> > +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int channel,
> > +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int id,
> > +=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0 u64 lun)
> > +{
> > +=09return scsi_scan_host_selected(host, channel, id, lun,
> > +=09=09=09=09=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 SCSI_SCAN_MANUAL);
> > +}
>=20
> [Severity: Low]
> Does this cause a module build failure during the modpost link stage?
>=20
> The function scsi_scan_host_selected() in drivers/scsi/scsi_scan.c
> lacks an
> EXPORT_SYMBOL directive. If the kernel is configured to build storvsc
> as a
> module (CONFIG_HYPERV_STORAGE=3Dm), it seems it will fail to link.
>=20
> [Severity: High]
> This is a pre-existing issue, but does creating a topology without an
> fc_rport parent lead to a NULL pointer dereference during error
> handling?
>=20
> If a SCSI command times out on a target scanned directly under the
> SCSI host
> (which this manual scan facilitates), storvsc_eh_timed_out()
> delegates to
> the FC transport's fc_eh_timed_out(). Because the target was scanned
> under
> the host device instead of an fc_rport, starget_to_rport() evaluates
> to NULL.
>=20
> This NULL pointer is then unconditionally dereferenced in
> drivers/scsi/scsi_transport_fc.c:fc_eh_timed_out():
>=20
> fc_eh_timed_out()
> {
> =C2=A0=C2=A0=C2=A0 ...
> =C2=A0=C2=A0=C2=A0 struct fc_rport *rport =3D starget_to_rport(scsi_targe=
t(scmd-
> >device));
>=20
> =C2=A0=C2=A0=C2=A0 if (rport->port_state =3D=3D FC_PORTSTATE_BLOCKED)
> =C2=A0=C2=A0=C2=A0 ...
> }
>=20
> Can timeouts under hardware or network load on these targets trigger
> a
> kernel panic?
>=20
> > +#endif
> > +
>=20
> [ ... ]
Thanks for the review.

The module-build observation is correct. scsi_scan_host_selected() is
an internal SCSI midlayer helper and is not exported for use by a
modular storvsc driver. The successful built-in kernel build did not
expose that problem so I never caught it.

The callback should instead use the exported scsi_scan_target()
interface and should not include scsi_priv.h.

I am also reviewing the FC error-handler concern before posting a
revised patch. Devices discovered directly below the SCSI host do not
have an fc_rport parent, while the storvsc timeout path delegates to
fc_eh_timed_out(). A revised patch must ensure that this topology
cannot lead to a NULL rport dereference.

I will address both points in v2.

Thanks,
Laurence

