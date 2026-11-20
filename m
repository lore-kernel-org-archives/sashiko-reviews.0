Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795163104;
	b=1xyVTHJt4n8mQSFVu1G16ABaYC8xDrMPmeI9wUZ4M3RZPQM981zooshvtTYB7KUydwOE
	 s6RlwgZhfhCr/AdjcTmBtpxpnf9//hGnUevx++66cIhkVt8HA/oUda8XS06dXohu2fS43
	 R46fE/8EbYyRSZHaDy6H7VY+k6uXq7UZSDy9WdQQV6o8qvAdYuQkoma/Bib0qkkhWvLQU
	 NVBTybGCeBkxiqzRxK7t27EXq1oAE+vvJtopoBX1O5VtLkOhXECfiJs1f89kji4FDZDpO
	 JHEoJ1y6xpEv9DjXpad6LDtv84VWSZX+2aCVrqHJlnKRP76x1XSz5fIEa4dA+2oPOTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795163104;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 X-DetectorID-Processed:Content-Type;
	bh=4VbgvEVtXcKMcQYhSIvPUnpaKkTg4RkxJoQgZsai4o0=;
	b=HZ3BawRHIPauWT+L3YlKxByQZ85xPKxfGF3cvFGXPnlBKpObS5+EjOB++QiCgegrpfpz
	 ugi7o7B4PkcnKKKMqRo05hK/5ZmzDiIhZjUgrqfu/h/bSzbkX+IAAnv4yWKMHcuQwMx4N
	 7y0uLPVOwTA1QF7dOwIodv6CU0JPltjsBR2okccJjw5P3e1UNrwLl0fTecHB8auRq2lbC
	 Fr1bVRyD/2Bpm1xcVSMSl0+fsn6rPb4bt6jh6EZH4DklK5W3dMLezQN7oo+8+CMPIIeTj
	 0crnO6rrfUEUD3bXiB/FI/dzZBVEuwYt4ehNJEwOwfRW+B00HCvnszMALSGV6hQ/8fg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vh32HZbj;
	arc=none smtp.remote-ip=209.85.222.99
Received: from mail-ua1-f99.google.com (mail-ua1-f99.google.com [209.85.222.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352FF606A325
	for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 08:25:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 352FF606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=Vh32HZbj
Received: by mail-ua1-f99.google.com with SMTP id a1e0cc1a2514c-99e1babd683so298441241.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 00:25:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795163103; x=1795767903;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4VbgvEVtXcKMcQYhSIvPUnpaKkTg4RkxJoQgZsai4o0=;
        b=KzkJ2Psa+opjd6Y7kSk9KaRHGSwo6geYiXznYDIpZFwKzfWdXDcDi9VoCYNcE7eRI3
         soSgHcuYX+jSF6SWfmdrEWAEOIGOgvXogM+GXU2sU5YuHk8SnGbua0IEMblQfR/SeX7P
         1mj7ZXIE4Fif/SyTob6AiUUe0DixmRiNicHgWkITqeWVJPrSH2bnDI07WihW1AQo1JVZ
         xpcH33zVHzoE2sb74g46muDP7SbDzLTG5sAyKzem8irUEzDxGdrsapZksuDPd6GJgqqY
         s4JBikaGpz24STZAnnZdS3mRJQmecjNtUq6niGXwpDG1aemIbNV4tw3gFWcN0tR+o2Nj
         igXw==
X-Gm-Message-State: APuU4Z/TUeh6qxzEQlY3AflmLU1x94OX1uTQEyXkCnVvEdaJkOAoNk1p
	KnasNmBYv+gzhM7j2pAMQQMevqea3L/evbY7psjmnx/JX1DPMY1ukScPQCZKvhkvEc6S+uOk+Um
	BEYHP5fCSjZcW++7rsy9B94O9N5O2/guI13MLiv284MoGkoIxF5C3rVzS0494nPx+B+X6ZbXxIo
	8dTiOh0ztGr0KJ/6LXoVZZqqvpFSFcKa29/vFYX5LE9rxUZNwWoxkDNFcc5Hr0t66gZcCJ2Lf6B
	9mLGIpQMmvWe6s+VPFBm5Q=
X-Gm-Gg: AZFdTZcSWPCqsvNRI2Aw2Msz10o6QxuB9jw1YrtnN3OnczKHCqb30FG7sTLi1AlD7xH
	EIAXqWhtg0NLtenbA6CWjehGxb6OBEqU672EywKovtHxcfh+zEBBNObsrvx7SgVOdg8dpCItbgS
	0Fg6aKDb7adZvlgTygaDDa6+o3Lt5jnW00+AGBrxqm9U7bOZ9mLqPRLdajFprQLFhZi47I5OvP5
	eiVWQoJ8kQrSk2+2+TBwGwmnds3/ZjegX2z2pf6nAYZbno9Aos542kLIWoIFbEn+HIG5rc1XuCp
	SVFIYE+kVyf4DfqAG9/5wrlBvBHrD4LWsLDybZujKtB+/mByfDCfDLOBe+zdhx6X3Z3VH4Sssfc
	z6036TS8grvKFZsqqMgUt0PE9kC4NROXjyqOdfWZw5zx76AnHeiU5DzBpCw0HFwaYJtJnDD6jHD
	tmOtqwqL9ahTgXPYMvZMpEgLYjaNXlUT4zTh0=
X-Received: by 2002:a05:6102:644e:b0:7ba:9a61:23eb with SMTP id ada2fe7eead31-7d7396e8971mr819521137.37.1795163102864;
        Fri, 20 Nov 2026 00:25:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-99e6e14451esm256257241.11.2026.11.20.00.25.02
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Nov 2026 00:25:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b8af15db8fso506884a12.2
        for <sashiko-reviews@lists.linux.dev>; Fri, 20 Nov 2026 00:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1795163101; x=1795767901; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4VbgvEVtXcKMcQYhSIvPUnpaKkTg4RkxJoQgZsai4o0=;
        b=Vh32HZbj88HsklPg6qzxHQiF5wOVwBl0gnLqYqm1mcSrDfEWEJzKZ43mU/1i2D1WD+
         z7uMNtioh02YlkZ/eEIXzBHLjtCIzNEFxo5Y9GMB9UdNbU0zIFEW/SbDoUQzgUuWcTmI
         vDBWmcMI0mQiFLD+XZEfjRR3ueZd9zjx1iO/c=
X-Received: by 2002:a05:6402:c509:20b0:6b7:83a4:415b with SMTP id 4fb4d7f45d1cf-6ba37e7c712mr1156158a12.21.1795163101318;
        Fri, 20 Nov 2026 00:25:01 -0800 (PST)
X-Received: by 2002:a05:6402:c509:20b0:6b7:83a4:415b with SMTP id
 4fb4d7f45d1cf-6ba37e7c712mr1156141a12.21.1795163100793; Fri, 20 Nov 2026
 00:25:00 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261119071133.127282-1-ranjan.kumar@broadcom.com>
 <20261119071133.127282-17-ranjan.kumar@broadcom.com> <sashiko-outbox-222605@kernel.org>
In-Reply-To: <sashiko-outbox-222605@kernel.org>
From: Ranjan Kumar <ranjan.kumar@broadcom.com>
Date: Fri, 20 Nov 2026 13:54:48 +0530
X-Gm-Features: AclHuK9oVjYLSAWCWL1CIsV_42Ojv-gLqCCDCCHMY1-dkEW42OdD0__eeVoQOeE
Message-ID: <CAMFBP8MFJCBC-2PK5H8nwLc1CA0HFeBYdT-v6EeP5O9nhRE9Ww@mail.gmail.com>
Subject: Re: [PATCH v2 16/20] scsi: mpi3mr: Fix sense buffer use after free on
 BSG command completion
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000fc7a250660b0fa39"

--000000000000fc7a250660b0fa39
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,
Thanks for the review.


On Thu, Nov 19, 2026 at 1:04=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential
> issue to consider:
> - [Medium] scsi: mpi3mr: race on bsg_cmds.done and reply in
>   mpi3mr_bsg_process_mpt_cmds()
> --
>
> commit 8590d021fe282f240b050a47484ba6f1b211d756
> Author: Ranjan Kumar <ranjan.kumar@broadcom.com>
>
> scsi: mpi3mr: Fix sense buffer use after free on BSG command completion
>
> This commit adds a spinlock to struct mpi3mr_drv_cmd to serialize access =
to
> command state, sense buffers, and completion callbacks between BSG comman=
d
> handling, admin reply processing, and controller resets.
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_app.c b/drivers/scsi/mpi3mr/mpi=
3mr_app.c
> > index 30a01b02a9fc6..fb54bd8093da5 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_app.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_app.c
> [ ... ]
> > @@ -2795,11 +2797,13 @@ static long mpi3mr_bsg_process_mpt_cmds(struct =
bsg_job *job)
> >                       block_seq =3D mpi3mr_tgtdev_block_io_inc(mrioc, t=
gtdev);
> >       }
> >
> > +     spin_lock_irqsave(&mrioc->bsg_cmds.state_lock, flags);
> >       mrioc->bsg_cmds.state =3D MPI3MR_CMD_PENDING;
> >       mrioc->bsg_cmds.is_waiting =3D 1;
> >       mrioc->bsg_cmds.callback =3D NULL;
> >       mrioc->bsg_cmds.is_sense =3D 0;
> >       mrioc->bsg_cmds.sensebuf =3D sense_buff_k;
> > +     spin_unlock_irqrestore(&mrioc->bsg_cmds.state_lock, flags);
> >       memset(mrioc->bsg_cmds.reply, 0, mrioc->reply_sz);
> >       mpi_header->host_tag =3D cpu_to_le16(MPI3MR_HOSTTAG_BSG_CMDS);
> >       if (mrioc->logging_level & MPI3_DEBUG_BSG_INFO) {
>
> [Severity: Medium]
> Should memset(mrioc->bsg_cmds.reply, ...) and
> init_completion(&mrioc->bsg_cmds.done) run before releasing
> mrioc->bsg_cmds.state_lock?
>
> Once state is set to MPI3MR_CMD_PENDING with is_waiting =3D 1 and state_l=
ock
> is released, a concurrent reset or a late reply from an earlier timed-out
> BSG command can acquire state_lock and complete bsg_cmds before
> init_completion(&mrioc->bsg_cmds.done) runs:
>
> CPU0                                  CPU1
> mpi3mr_bsg_process_mpt_cmds()
>   spin_lock_irqsave(&state_lock)
>   bsg_cmds.state =3D MPI3MR_CMD_PENDING
>   bsg_cmds.is_waiting =3D 1
>   spin_unlock_irqrestore(&state_lock)
>                                       mpi3mr_soft_reset_handler()
>                                         ...
>                                         mpi3mr_drv_cmd_comp_reset()
>                                           spin_lock_irqsave(&state_lock)
>                                           complete(&bsg_cmds.done)
>                                             <-- NULL pointer dereference
>                                           spin_unlock_irqrestore(&state_l=
ock)
>   init_completion(&bsg_cmds.done)
>
> Because mpi3mr_init_drv_cmd() does not initialize cmdptr->done, on the
> first BSG command after probe bsg_cmds.done is still all-zeroes and
> complete() dereferences NULL in swake_up_locked().  On later BSG commands=
,
> init_completion() outside state_lock races with complete() on
> done.wait.lock or resets done.done after the wakeup, and memset() on
> bsg_cmds.reply races with memcpy() in mpi3mr_process_admin_reply_desc().
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119071133.12=
7282-1-ranjan.kumar@broadcom.com?part=3D16

> This ordering is not new. In the current driver the memset() of the
reply and the init_completion() of done also come after the state is
set, and this patch does not touch those two lines, it only puts the
state, sense buffer and callback fields under the new lock.

I would rather not mix it into this fix, to keep one logical change per
patch. I will send a separate follow-up patch for it.

Thanks,
Ranjan

--000000000000fc7a250660b0fa39
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
zZSItX49nLoa4TBbzuCzoINrv59QeSCVlVdAYussUS3840ZjvcYHSQx3tqYcBN+an07lDASmGEM5
7PEXJPVInjl/Fva3ksL3r8anR4PWc3Xz5jLD8Xg6BU4zmIcR/t1GlqWuz8uTWmQtm40C9m91Q9a+
2alIIV6BTs8IG2ELtt4EfcVvi5af+Hu878sGeBtMx6Z9ljoKl3MfvDdtUNO4bkJ97a7PXy/CKxiy
TApQj4qg9SKQcsH0xzQan67XeXjkvk4frNDhRikCAwEAAaOCAd0wggHZMA4GA1UdDwEB/wQEAwIF
oDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3Nl
Y3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEF
BQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1Ud
IAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAy
hjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJAYDVR0R
BB0wG4EZcmFuamFuLmt1bWFyQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAfBgNV
HSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNVHQ4EFgQUfLdm66N7GfDsoL8cYp3s4YdO
isMwDQYJKoZIhvcNAQELBQADggIBAA/lnAxDb9jbesclnBxWIKUSxAMIrq4XKO5WKHUYIOOzd2sL
o59fH9AWg1AfVONfWIUNdWDrmNNLs0+drSKaZbGx2RWMbaL9ubo7+BTQV33ZRBxnnkmc9QszlOo5
m6FB9uPOGB9LvJMCkJ8S7hNc9G/p7dB79s1IKc8JGEDIrsgX3s4xSCJA20WdePHY5rLh5ySwXyI2
3sVTUC+oK0HJFRo+TpdMMtdpOetWzIkUbGceiOA2ur8372+0KOmvlIHA/jEnW3BRfmB2vmdk+raY
C/xbXY9JEfS6D881+X/90w+cCQ7nuA1OELebS1RbSdXT6YkRDPWYA/DPFhOYCAiMwVAPRaAH1AQc
8J8yTDigwRUCq4qKCYU9YnqQh3YZRbUYnW+i3+rAO2SUbKl0VM5y0tq+GOGLC7w+v6yGossZmy+6
3w72qp/Colr4r5ZaROb+L2FXqk4tL/HfkRhliyPPPNIjre2mIkvFuShk5A5FcvQYCzDtejAz9JHq
ZVJ1ZD+auQDbIUxT+Dn9bI5XkQnWJ9KrlcORtztdYTDafN8VQuweS3JY0X/VCNBNZkiYXd7fzOza
hvkw/S+v8cIfiakLKBREtiBHqWLdVf5CNDVYpd17yz0LGz0TKARbfuK/EiKflA10pnnnOB33Ru9D
WPp9aHW3szGYr3+H9AHS6IDwkIxyMYICVzCCAlMCAQEwYjBSMQswCQYDVQQGEwJCRTEZMBcGA1UE
ChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xvYmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0Eg
MjAyMwIMDcMaKRu9LrbAxERoMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAzGGXQ
xd2wwF1QAF0Fs5S0BJ4mqEneHIRVS+sX4g/v1jAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjExMjAwODI1MDFaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAuMEY2tyEpZtkx3zap/4RmJJuba2dr/BZa9buI66s7
CerI00fXylXK6VRWU+sA6MfGhrFtVqCr9kAyZChOBh5es32I1scngV+PBLLxd5W/40gS+7648GpY
aHsjWRIdp5TAu9cmmdtZ9qEUSAec2GjIa+G4xR8IDMf7mfdogShwT69+K6s9hy40nCuRpXXz4ZYf
FN9j48x7GJ+Q7/2YlvMsubMmmawCZNCVSOEYWRijOTawIgxXzgcGiujvVgUU7SLDIaXiys6vyN5P
5baUrf4UtdOa0xaTrCuUduVx2qAOX/Vd94MgqT772pPR2zuvRI4UrsieiDqLMdSUtQeoEIRG
--000000000000fc7a250660b0fa39--
