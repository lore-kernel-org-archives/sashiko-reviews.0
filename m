Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23259426D16
	for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785521495; cv=none; b=pKCoyZP66V01F9gv5CZu120qMzOq6yzjzODqkmsQHy2yfsiQsdhOiaUu83LoT9alk+0ag4UI2LXojj7N6YJqZPxzXiF4o6HDXMKXtLyMWLRZ/FlGpmqyZbRVYGHizEwOrWm/YRgxd19Cyv0KrpOySt4IBjkFbxuLRFyEnZf1ZTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785521495; c=relaxed/simple;
	bh=1wqT6fgguWPW4M9eF0kbyBrjvDXIuS6oN5OqwiNNiOA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YBN076/kZ7a3HAG9dU6p6GOI+N5zBRSifw/7n0iYAI9qzE+awHdoZ0xgrBDYgVGnKYgfA/JbylqEO9axTYJCGwZT/75oUgNa34iyVNIplZRFeLBnow7SMzhTKyt3cvHNzS8E7rFhXsugdN6yqrZletTJF7Tc1sJ1UgzpvX2yBpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VqOljwuE; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VqOljwuE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785521488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1wqT6fgguWPW4M9eF0kbyBrjvDXIuS6oN5OqwiNNiOA=;
	b=VqOljwuEhtV5CAFM2lsY3QNhUI5BXG4ITTZ7Zj5mqghCUHz/a5cuMb5KZi2WmsbavwI8nm
	7RakAXCP4QKeloMN3GCcUyvo3CFWw18dtqji2jwtBIs6BoiKkj9OEpqSEZKczV1alDiyzp
	eXGg6ix2rmyryDFN/3EXl8eHBZBVUpo=
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com
 [74.125.224.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-230-QeYuueICP26HbjDtcmHWpA-1; Fri, 31 Jul 2026 14:11:27 -0400
X-MC-Unique: QeYuueICP26HbjDtcmHWpA-1
X-Mimecast-MFC-AGG-ID: QeYuueICP26HbjDtcmHWpA_1785521487
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-667c0eadf4aso3427624d50.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 31 Jul 2026 11:11:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785521487; x=1786126287;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1wqT6fgguWPW4M9eF0kbyBrjvDXIuS6oN5OqwiNNiOA=;
        b=Fi4G4GwVT+fa2igJytNxm8pLEPek0tUCKsR2Y1u2K5TFiEh4H+qZcPlqpdvm0M/Fa8
         E3RWBJ44qWUO6Pe31BJz96e6tNwvIvSaX+2xZUs5PRZG4GsNzzYKSClgyNzBnnsk5ADw
         rU+c8UY5QfFEQ0/kgThvkadd5hIgSXpychMkPnXey/PU4j7Zh53fbTGnCqMDME3nVWJW
         Jva3xl1bZ5yQZa6KpZUGjXjY/NrVGMDYescUo7hZML1zeJIE2a1M9YMKQbl/zvI4pF1b
         vLK1q/5R8nk0jbhe4IF1cskxYKpoMhUitS9+NPCnS2a0fOho8bFzcwKSDrOcwoJcfx7Q
         82cw==
X-Gm-Message-State: AOJu0YwiEHhye/Sgh31ExCKBJODW7uBeHRCuEzUSZSmGJ2yzgtzicUuM
	DnnzbSZJwmAD5UIn+nFGONXCyrb/OzPKtNSUivcRvI0UskZVL6hdOgDi657g1So6SIrA0VC8C4J
	IjT0kM0U405XxlCjui968aM7z+uWHtI5OqbPUa4LVMUMTVqEnpzAGGKabrViThr9eDStzbud5XN
	+R/SujnWYCuAU3G27nqeixGjxMTl4Z+MjosLXssoA8FD+n5RrFsQTW+A==
X-Gm-Gg: AR+sD13+uMZLKIc99/suXGPiMHF9gxE8MEy8WJ7ehWFuNTgNDuupEEclPA1wi9RXOJw
	1781RAevO92Z3NzQ6fNPYea6vI+CQLsZpCd8mIe/KzXVRZHOAbOD/HUkYUcKBPnoaPdMzTgdKek
	b5RG8MhfA7LC7TXLgPQQzpiAw/dztC6RsjRg5INb/6QKNWB8CmBq6xGPrBqD73ELaeDeazv/koy
	VdWpE7fWA+d6brLJ9sc2iOjyPxfGgoWaWfE+mMjvu05b7NBNrZf1AK362IdneLN6pOcMvfjbwY1
	8Ny3U5Eg8I2Bzw1/ogGg8vDOhYnhhyGD7i30hFAFU4gQ9GRhQ/eMFXiRcukJqgWdFB26/Gg3L/3
	AQYXLdXiq8htAtCKA7PORAD82aYcWmOHprnEf
X-Received: by 2002:a53:a692:0:b0:668:9230:e271 with SMTP id 956f58d0204a3-6694f05de2amr854657d50.19.1785521486657;
        Fri, 31 Jul 2026 11:11:26 -0700 (PDT)
X-Received: by 2002:a53:a692:0:b0:668:9230:e271 with SMTP id 956f58d0204a3-6694f05de2amr854635d50.19.1785521486115;
        Fri, 31 Jul 2026 11:11:26 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:dbb1:97f1:a6e6:766b])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948e49c3csm1056816d50.7.2026.07.31.11.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:11:25 -0700 (PDT)
Message-ID: <80785a3bccc6505c28c71271b004e0b5f3fd3b3f.camel@redhat.com>
Subject: Re: [PATCH v2] scsi: storvsc: Support manual scans for all Hyper-V
 targets
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hyperv@vger.kernel.org, linux-scsi@vger.kernel.org
Date: Fri, 31 Jul 2026 14:11:24 -0400
In-Reply-To: <20260723165134.618071F000E9@smtp.kernel.org>
References: <20260723163743.1274830-1-loberman@redhat.com>
	 <20260723165134.618071F000E9@smtp.kernel.org>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tYZOi5f-MYJ3dPuLa7vtK5ZousCXvv_VY6VYoUEffAA_1785521487
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2026-07-23 at 16:51 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issue(s) to consider:
>=20
> Pre-existing issues:
> - [High] Kernel panic in fc_eh_timed_out() due to missing NULL check
> for fc_rport, contradicting the v2 changelog claim.
> - [High] Use-After-Free race condition in fc_user_scan_tgt due to
> unpinned rport pointer.
> --
>=20
> --- Patch [1]: [PATCH v2] scsi: storvsc: Support manual scans for all
> Hyper-V targets ---
> commit 7a84d34942989f4df1a7195141939c24f221c9ea
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: storvsc: Support manual scans for all Hyper-V targets
>=20
> This patch provides a storvsc-specific user_scan callback that uses
> the
> exported scsi_scan_target() interface to allow explicit scanning of
> targets
> without requiring synthetic fc_rports for each target.
>=20
> > ---
> > Changes in v2:
> > - Replace the private, unexported scsi_scan_host_selected() helper
> > with
> > =C2=A0 the exported scsi_scan_target() interface.
> > - Preserve wildcard channel and target scan behavior.
> > - Verify that storvsc_eh_timed_out() does not use the FC error-
> > handler
> > =C2=A0 helpers; the reported missing-rport dereference is not present.
>=20
> [Severity: High]
> This isn't a bug introduced by this patch, but is the v2 changelog
> accurate
> regarding storvsc_eh_timed_out()?
>=20
> Looking at storvsc_eh_timed_out() in drivers/scsi/storvsc_drv.c, it
> appears
> to explicitly route I/O timeouts to the FC transport error handler:
>=20
> if (scmnd->device->host->transportt =3D=3D fc_transport_template)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return fc_eh_timed_out(scmnd);
>=20
> When fc_eh_timed_out() handles this, it extracts the fc_rport
> pointer:
>=20
> struct fc_rport *rport =3D starget_to_rport(scsi_target(scmd->device));
> if (rport->port_state =3D=3D FC_PORTSTATE_BLOCKED)
>=20
> Because storvsc targets are created without an intermediate fc_rport
> parent,
> starget_to_rport() returns NULL. Does this mean fc_eh_timed_out()
> will
> immediately dereference a NULL pointer during an I/O timeout?
>=20
>=20
> As a related observation on the FC transport layer scan paths:
>=20
> [Severity: High]
> This is a pre-existing issue, but does fc_user_scan_tgt() have a race
> condition that could lead to a use-after-free?
>=20
> In drivers/scsi/scsi_transport_fc.c:fc_user_scan_tgt(), the host lock
> is
> dropped before scanning the target:
>=20
> spin_unlock_irqrestore(shost->host_lock, flags);
> scsi_scan_target(&rport->dev, channel, id, lun,
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 SCSI_SCAN_MANUAL);
>=20
> If a concurrent FC link down event or port removal triggers
> fc_rport_final_delete(), can the rport device be removed and freed
> before
> or during the scsi_scan_target() execution? If so, should a reference
> be
> acquired on rport->dev prior to dropping the lock?

I do not see any of F/C related calls in what I modified or in the code
I worked on so for me v2 is the correct and final version of this.

Thanks
Laurence

