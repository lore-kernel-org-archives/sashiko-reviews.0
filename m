Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7D23D649C
	for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 17:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703928; cv=none; b=kejx9Vhj1yzPE+zsB5PLQWrntYNhsVRRSkv9w39k/Wkx7k16HpM4CPj/QXbXzzEt37eghcPBBNVlfajcCx+xWXvI3cNzrzRGlRKHBuZ8bXT5T9IRbuWEFfnROHiAi200N4lMqXlxnmKOTKAYC/2IJmFB6AY42Hykz7zOaZJRoIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703928; c=relaxed/simple;
	bh=kVcy16VRk+NdxqnWoUhi02A6dHlACtODyGa7wNIbzTo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZH+0hhN5bc8xZsZxxoz/xO55Zdo/jQI81Drc419qnS/oH0WSxcFsIKPlVFWYgBCfYzD9VLWpkl/CO+LKGkMOolVxhDPVf0otNAwCtJ6kDtwKeS75QDJzYM+WfO6WrOnJtaIn/4iB+jqLwhGRb1ReXtgMFq7+jDmGwu9uiJ/ypOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hIhbs/9h; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hIhbs/9h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1790703925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kVcy16VRk+NdxqnWoUhi02A6dHlACtODyGa7wNIbzTo=;
	b=hIhbs/9hCd8juY8Jj9Oy/O5OBmixe2IfIR8IXVUEylXJraXYrWeMT/6v6mcjjjOjcKoOIX
	NhoPxJmgktyRzIRiKc2TeVSBXMeiNSBDOFeKG1Eh6mFpQzqBPz6sUnLBQVlGsQQPb+1Pq0
	Ken7YMu/BxtlUbuPMK19E/CzxeFhMyA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-0yEOCctCMLCIJ-ZhjbW0hw-1; Tue, 29 Sep 2026 13:45:23 -0400
X-MC-Unique: 0yEOCctCMLCIJ-ZhjbW0hw-1
X-Mimecast-MFC-AGG-ID: 0yEOCctCMLCIJ-ZhjbW0hw_1790703923
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93c599e3d3bso721157385a.2
        for <sashiko-reviews@lists.linux.dev>; Tue, 29 Sep 2026 10:45:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703923; x=1791308723;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p+/ZhVDWLPZxvmMp9jtbl9VESILtaLIBrhjShuwTPLg=;
        b=W2r7pKDteHcdsaPumnnUz8Okj4c2S9WKGZ6ZV7f+KbWM14O7/xAabwuU+HxIhXFti2
         jtt859Ugdc7ODYCKlP8ODDyDoZclJCDv2oVltXytk7N46hwxIiwdXeNNE4Al4atEMR0L
         b8h5W4Ox0HrYVTkBywOR4yOB/PnF4+OPO2UnagbGw3PjMLevlITmaB6eRmyeoTXhenl7
         MTxesgjjy1rfftEDyN/cHifuZ2Esrb7rI7cPNSM8LmSX1RkAKja5BFOZ66pyCM8ay1mH
         IF08fd6eFxFEbX5sYn2Quj6QIIqeWUdN/7pIxPgPuS27tFrdG801ahsoASIJ+C9/KBgY
         EBRQ==
X-Gm-Message-State: AFuF++kGyhzCGlxTmTim+tBS3eKKLfr+gkx9cjtvNbHhLuXFeotZr+Y/
	ENoEXR//ooDhwoWOM6Y+Bk6QwZnKXC2W3NQkrHbJNYfHPE1kYMRa2JkIOywit3xpv3DPvUReJTH
	cgdCuvrvykME5eOvf2lvYY8EcXMQXRBhvlrmGPLYJx/WpdGCjNK/NRU6rjKsU5Y6Yq8+mW7FVuM
	tmUewlbmlz7YqGBLf+CaWpQNA+SwEj7IiJcIh1HFZ28rp0v0n/LBHutw==
X-Gm-Gg: AYBFou2WKpClqAJB6gPK4avNLImA1VJpoYKOOQa7Zfb2GlgajxFc8Qx91143LciQ/Sw
	oyLhYlIqXethi5kMHkM38sME1fqDArPoo0F2IQbgml03+aUav8tqKASCN+r9EHfNfSFdgmnNjEh
	Mr3wDHNjxKYRtN/0E21SRhhglhTD/X/TV3pozd5UNYjCmgccBmkVbLIhDAC3yt4WEI4ngoS4wjL
	ZFxRGoQAGickVgCDZZY9sCWm0KB5HAeVIi7uLkqZEMnqyrwaMYXQBvrThP1fUWGVAsGzAiCTASk
	uyni0CTLvnNWumNCmktU3Z0/TC5ex1eSjVUJSEPIXL9Jzx/P6dlUhbDsIunGh7l8WZnc3mYRsbo
	Eg+XACivO3Qjctb7EabhAYiIbme+328Q6Dgnt
X-Received: by 2002:a05:620a:40cf:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c9fb42879mr42482585a.19.1790703922531;
        Tue, 29 Sep 2026 10:45:22 -0700 (PDT)
X-Received: by 2002:a05:620a:40cf:b0:936:77d7:55a4 with SMTP id af79cd13be357-93c9fb42879mr42473785a.19.1790703921777;
        Tue, 29 Sep 2026 10:45:21 -0700 (PDT)
Received: from loberman-thinkpadp16gen3.rmtusma.csb ([2600:6c65:2440:d8c:aa2b:ddff:fe88:da74])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93c9f2e00d1sm25614685a.6.2026.09.29.10.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:45:20 -0700 (PDT)
Message-ID: <9a9da14629887529cbdc7efbe5809f19ed140d23.camel@redhat.com>
Subject: Re: [PATCH v3 1/4] scsi: st: Restore changed drive settings after
 reset also for MTLOAD and MTRETEN
From: Laurence Oberman <loberman@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
Date: Tue, 29 Sep 2026 13:45:19 -0400
In-Reply-To: <20260929173335.0562F1F000FF@smtp.kernel.org>
References: <20260929171813.844733-1-loberman@redhat.com>
	 <20260929171813.844733-2-loberman@redhat.com>
	 <20260929173335.0562F1F000FF@smtp.kernel.org>
User-Agent: Evolution 3.60.2 (3.60.2-2.fc44)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: l3CSVPL8iMzVobrwioi4p_MBmYZxXrvYghYX4ZX1aP4_1790703923
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2026-09-29 at 17:33 +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue(s) to consider:
> - [High] scsi: st: MTLOAD in immediate mode attempts premature
> settings restore
> --
>=20
> commit 17d984b3de3a58216a78afa696892ddd4aea0bbd
> Author: Laurence Oberman <loberman@redhat.com>
>=20
> scsi: st: Restore changed drive settings after reset also for MTLOAD
> and MTRETEN
>=20
> A device reset returns the drive's density and block size to their
> defaults.
> This patch attempts to re-apply values changed by the user when
> recovering
> with MTLOAD or MTRETEN.
>=20
> > diff --git a/drivers/scsi/st.c b/drivers/scsi/st.c
> > index f1c3c49466379..0a4263bef9cbb 100644
> > --- a/drivers/scsi/st.c
> > +++ b/drivers/scsi/st.c
> [ ... ]
> > @@ -3819,6 +3848,9 @@ static long st_ioctl(struct file *file,
> > unsigned int cmd_in, unsigned long arg)
> > =C2=A0
> > =C2=A0=09=09if (mtc.mt_op =3D=3D MTLOAD) {
> > =C2=A0=09=09=09retval =3D do_load_unload(STp, file, max(1,
> > mtc.mt_count));
> > +=09=09=09if (!retval)
> > +=09=09=09=09st_restore_changed_settings(STp,
> > restore_density,
> > +=09=09=09=09=09=09=09=C2=A0=C2=A0=C2=A0
> > restore_blksize);
>=20
> [Severity: High]
> Does this code attempt a premature settings restore if MTLOAD is
> called
> in immediate mode?
>=20
> If a user application issues MTLOAD with O_NONBLOCK and STp-
> >immediate
> set to recover after a drive reset, do_load_unload() will issue the
> load
> command and return immediately. This unconditional call to
> st_restore_changed_settings() would then cause MODE SELECT commands
> to
> fail because the drive is still asynchronously loading.
>=20
> Later, when the drive is accessed, check_tape() detects the new
> session
> and clears the changed flags, causing the drive to silently revert to
> its default density and block size. Subsequent writes might then
> produce
> incorrectly formatted tapes without errors.
>=20
> For MTRETEN, this patch correctly checks for !STp->immediate before
> restoring
> the settings:
>=20
> > =C2=A0=09=09=09goto out;
> > =C2=A0=09=09}
> [ ... ]
> > @@ -3837,6 +3869,19 @@ static long st_ioctl(struct file *file,
> > unsigned int cmd_in, unsigned long arg)
> > =C2=A0=09=09=09retval =3D st_compression(STp, (mtc.mt_count
> > & 1));
> > =C2=A0=09=09else
> > =C2=A0=09=09=09retval =3D st_int_ioctl(STp, mtc.mt_op,
> > mtc.mt_count);
> > +=09=09if (!retval && mtc.mt_op =3D=3D MTRETEN && !STp-
> > >immediate &&
> > +=09=09=C2=A0=C2=A0=C2=A0 (restore_density >=3D 0 || restore_blksize >=
=3D
> > 0)) {
>=20
> Should MTLOAD also verify !STp->immediate before calling
> st_restore_changed_settings() in st_ioctl()? Note that follow-up
> patches
> in this series do not correct this omission.
>=20
>=20
Hello Sashiko,=20

This only affects MTLOAD in immediate mode with an O_NONBLOCK open;
with a blocking open check_tape() waits for the drive and the restore
works. In the non-blocking case the MODE SELECTs fail and the settings
stay at the drive defaults, which is the current behaviour without the
patch, so it is not a regression. I can add a "STp->ready =3D=3D ST_READY"
check before the restore in a follow-up and leave v3 as is.

Thanks
Laurence

