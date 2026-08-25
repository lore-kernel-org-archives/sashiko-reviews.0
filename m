Received: from mail-oa1-f99.google.com (mail-oa1-f99.google.com [209.85.160.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601F23D525F
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659411; cv=none; b=qreXQRCNuAw0qNyUOAr9HR70XTWPZzNX3yUR+hQv20Dv3+cCHRinWZUf4wawsooMwTHy/uXfE9UaUsMuWrKBxQqL3LNbX2YJRHIb8vTIh1jVrSzn309ynl1eqdfcuDot1udSlEY6T/RcTrDb7rFWfzG14QIQJOd0nX9m9kDmSDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659411; c=relaxed/simple;
	bh=WzIzAlMJXGhgQlTL8o3nyWFBg0lbRz9p678p4+dnpZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bi2zCZ37pQMXz6Rh0wtPnlon++RcxR51dpkc7hlvG3gAbkaEvq5weP6ySnIm/4/jjMhJl4TklVCT7xb5i8DGW7RcNa7UknvCe3gjQQXa9Devn2jH2eK3Ien+2shLgvZYMwD/nNiwTsSILPvGUvjTX5fIMsDYtdtO26zRWtgZzzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Ib8FI+oh; arc=none smtp.client-ip=209.85.160.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Ib8FI+oh"
Received: by mail-oa1-f99.google.com with SMTP id 586e51a60fabf-4560d6f82edso4433709fac.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659408; x=1788264208;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JE/ZOPxsdEwwiv+1vnBN6Pw2uRHGM/YXmkBGXBQWYro=;
        b=L42BcA7h3ZjvnE7/FOWW7cRz2NQdlUndxJk/Gnko20yEAl71mjeRfoN+c+iInZ0qkD
         gJYwjNOmS6+N1au4tbhdneHlQMJljBtaZ6dvEU1U5AtLwefva6mUdWzMrcikq7lzRJfe
         L8XW0TCjmu4T0FogP+dqEL7WDSl4GXX18J2ZRxS7iMD1WjOPXJJa+sD40qDgm1AcFAPp
         zmN6p2SAiR6N6AFVQUwEtxL8oB7LkuYuirogJUrr8bzQCqWFC/rrXzsvo3CZuzpKkikx
         +0SV6drLCczUhVETONUPnVv5PQOurwvRd0hLDb7RJYGB8CPYhCiP7TKfV5GQU054BYQN
         vHPA==
X-Gm-Message-State: AFuF++nelvcpzL19ji25r5OgsTsddRb1PJkJLi8aTVKzep/1lpUkBFm7
	QsRULQJc7EiBrr9IUFcfP085h1JH+peR7qv2EQQg9+6qtl0O2GB8tfL3SuQiVCdj0mChfVzFDY4
	L1QA3/PDn7rs/12E2iq/d48qKoaVaeXbjeD8L+42WMTtdm6kknEGNEw90Uz0NuwLdomMKbeenZ5
	KDZn0RawNxI7ugc8ay655cuiI9UC84YPuF+foOAjXWgDAgiZX3Tx7GCPmS9KeEfqLNeVWTJeWjT
	4NdCnNFg9rgZKZ+mPGnEKMLvSNxhhU=
X-Gm-Gg: AR+sD13SMOwrzRZA0f0n9OCENu6aaG8Khdjv+GXWSiuTsR2GwkcsGXunQB2MoTDVyNg
	Td5FERdiQxuYzLkXxbN7KoCYqs9Sl/tyKj1xkp6yVxLkXrbBCiY5cCTEUF+FjJzxzHjtB8oHPeR
	hf5qE7iPiFCU9r0N80tdhwbRsj4HCs6E3UfJsKyIWKuCKpgKDukKh/Kknki9DHEOVJtQQN9WJGe
	3Nq0+GZ9WFHFeF0uhxZZQ88GPzRPCMAFYuTkrbj/akr18zcTE+AV6qtvQnhbKc70xlPCrqZ/F5O
	WCaWw8XKGVGtOmpXeUVWQYuF1dmYMwEmwgtv5rf/hjJxU/uIYEN3u3IEhhXSy1E0FsuGwIKBO4K
	l2fsW7gsvf3h2R+N60Kl6wyWypXRPZWVMS+5L/3nCg4ND/UmNvKfY0MziHZGYq1dPMtq48nB5Pq
	k4JuD8UR+2uurxhWlJVswsZKn4yCbe0KQpUDHQaCRCzCc=
X-Received: by 2002:a4a:ec4b:0:b0:69d:e4c8:86f6 with SMTP id 006d021491bc7-6b1592b8c96mr32484565eaf.15.1787659394137;
        Tue, 25 Aug 2026 05:03:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id a92af1059eb24-141860b860dsm578861c88.6.2026.08.25.05.03.13
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:03:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15dfd34e4cso308457966b.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787659392; x=1788264192; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JE/ZOPxsdEwwiv+1vnBN6Pw2uRHGM/YXmkBGXBQWYro=;
        b=Ib8FI+oh3DcccSB3AqSGezcH9JqtnVgtFQmcd2JH417hGJsUXcNUCQ3QWh6Rr7ZdHN
         ruGGBPpW8DLPoQupiodUY1P91totb45K15Vior7oaaSGuG4y6XcxROgccCmiB14TzPFD
         X+GhVc9ce7MP61vuFJ5J+pvdT4M/A5xuwR8cY=
X-Received: by 2002:a17:906:81d8:b0:c16:12ff:dc93 with SMTP id a640c23a62f3a-c246a6ca584mr3089111766b.18.1787659391513;
        Tue, 25 Aug 2026 05:03:11 -0700 (PDT)
X-Received: by 2002:a17:906:81d8:b0:c16:12ff:dc93 with SMTP id
 a640c23a62f3a-c246a6ca584mr3088936766b.18.1787659377959; Tue, 25 Aug 2026
 05:02:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818231426.58105-1-chandrakanth.patil@broadcom.com>
 <20260818231426.58105-3-chandrakanth.patil@broadcom.com> <20260818181511.75BDB1F000E9@smtp.kernel.org>
In-Reply-To: <20260818181511.75BDB1F000E9@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Tue, 25 Aug 2026 17:32:45 +0530
X-Gm-Features: AcwNN1XSCYKA_lTmPmP4hry_7_KUZ2M0Z9aRq9LVID3g4DN2NmTwJ_TzVVVVtRo
Message-ID: <CABvwm=OM7-iDg33KL8TksqjUjEZx1yk_oJhwAayvKznrLjuADA@mail.gmail.com>
Subject: Re: [PATCH 02/17] mpi3mr: Fix out-of-bounds read when copying BSG MPI requests
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000000a4f5e0659dde3da"

--0000000000000a4f5e0659dde3da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:45=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 4 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] On 32-bit architectures, pointer wrap-around and integer tru=
ncation bypass buffer bounds checks, leading to arbitrary kernel memory rea=
d/write.
> - [Critical] The driver fails to validate the user-provided `job->request=
_len` before casting and parsing the BSG request packet, leading to an out-=
of-bounds heap read and a kernel panic.
> - [High] Failure to decrement `stgt_priv->block_io` on early failure of `=
mpi3mr_admin_request_post`.
> - [High] DMA coherent memory allocated for PRP lists is leaked on command=
 timeout or post failure.
> --
>
> --- Patch [2]: [PATCH 02/17] mpi3mr: Fix out-of-bounds read when copying =
BSG MPI requests ---
> commit 0259dbaa420364e7270c5c71574f90668291edf7
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> mpi3mr: Fix out-of-bounds read when copying BSG MPI requests
>
> The MPI request is copied out of the caller supplied payload without
> first checking that the requested amount is actually present, so the
> copy can read past the end of the payload buffer.
>
> Check the range before copying.
>
> Fixes: 506bc1a0d6ba ("scsi: mpi3mr: Add support for MPT commands")
> Signed-off-by: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_app.c b/drivers/scsi/mpi3mr/mpi=
3mr_app.c
> > index 8e5d24793efd0..1cd1c38dcd565 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_app.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_app.c
> > @@ -2538,6 +2538,14 @@ static long mpi3mr_bsg_process_mpt_cmds(struct b=
sg_job *job)
> >                               rval =3D -EINVAL;
> >                               goto out;
> >                       }
> > +                     if (sgl_iter + mpi_msg_size >
> > +                         dout_buf + job->request_payload.payload_len) =
{
>
> [Severity: Critical]
> This is a pre-existing issue, but can pointer arithmetic wrap around on 3=
2-bit
> architectures and bypass this new bounds check?
>
> If a userspace application sends an MPI3MR_MPT_CMD BSG request with a cra=
fted
> buf_len (e.g., 0x10001000) such that the sum modulo 2^32 remains small, t=
he
> sgl_iter pointer wrap-around could mathematically bypass both the end-of-=
buffer
> limit check and this newly added check.
>
> Concurrently, can kern_buf_len / MPI3MR_IOCTL_SGE_SIZE truncate from 0x10=
001
> to 1 in the u16 needed_desc variable in mpi3mr_map_data_buffer_dma()?
>
> This would bypass the descriptor limits, allowing the driver to create DM=
A
> mappings for arbitrary kernel addresses.
>
> > +                             dprint_bsg_err(mrioc, "%s: MPI request bu=
f exceeds dout_buf\n",
> > +                                            __func__);
> > +                             mutex_unlock(&mrioc->bsg_cmds.mutex);
> > +                             rval =3D -EINVAL;
> > +                             goto out;
> > +                     }
> >                       memcpy(mpi_req, sgl_iter, mpi_msg_size);
> >                       break;
> >               default:
>
> [Severity: Critical]
> This is a pre-existing issue, but does the driver validate job->request_l=
en
> before casting and parsing the BSG request packet?
>
> If a userspace application submits a BSG request with request_len set to =
0,
> the BSG core invokes memdup_user(), which returns ZERO_SIZE_PTR (0x10).
>
> Will the driver unconditionally dereference this pointer here?
>
> drivers/scsi/mpi3mr/mpi3mr_app.c:mpi3mr_bsg_request() {
>         ...
>         switch (bsg_req->cmd_type) {
>         ...
> }
>
> Could this lead to an immediate unhandled kernel panic?  Additionally, if=
 a
> small non-zero length is provided, does the driver read bufcnt from the
> unvalidated payload in mpi3mr_bsg_process_mpt_cmds() and loop over unallo=
cated
> heap memory?
>
> [Severity: High]
> This is a pre-existing issue, but is there a missing decrement of
> stgt_priv->block_io on early failure of mpi3mr_admin_request_post()?
>
> When processing a SCSI task management request that specifies blocking I/=
O,
> stgt_priv->block_io is incremented. If mpi3mr_admin_request_post() fails,
> the code jumps directly to out_unlock:
>
> drivers/scsi/mpi3mr/mpi3mr_app.c:mpi3mr_bsg_process_mpt_cmds() {
>         ...
>                 goto out_unlock;
>         ...
> }
>
> Does this skip the atomic_dec(&stgt_priv->block_io) matching the earlier
> increment, permanently blocking all future I/O to the affected SCSI targe=
t?
>
> [Severity: High]
> This is a pre-existing issue, but is DMA coherent memory allocated for PR=
P
> lists leaked on command timeout or post failure?
>
> When an NVMe encapsulated request utilizes a PRP list, mpi3mr_build_nvme_=
prp()
> allocates a DMA coherent buffer in mrioc->prp_list_virt.
>
> If mpi3mr_admin_request_post() fails, or if wait_for_completion_timeout()
> times out, the code branches to out_unlock without freeing the memory:
>
> drivers/scsi/mpi3mr/mpi3mr_app.c:mpi3mr_bsg_process_mpt_cmds() {
>         ...
>         if (mrioc->prp_list_virt) {
>                 dma_free_coherent(&mrioc->pdev->dev, mrioc->prp_sz,
>         ...
> }
>
> Would a subsequent NVMe command blindly overwrite mrioc->prp_list_virt wi=
th a
> new allocation, permanently leaking the previous DMA buffer?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231426.58=
105-1-chandrakanth.patil@broadcom.com?part=3D2

Thanks for the review.

New issues:
- None. This patch specifically fixes an out-of-bounds read during BSG
MPI request copy by checking that sgl_iter + mpi_msg_size does not
exceed the payload length.

Pre-existing issues:
- The block_io counter leak on post failure is already addressed by
Patch 3/17 in this series.
- The pointer wrap-around on 32-bit, job->request_len validation, and
PRP DMA memory leaks are pre-existing in the driver and will be
addressed in a separate follow-up series.

--0000000000000a4f5e0659dde3da
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGpzCCBI+g
AwIBAgIMAgfxQ1Z7DrZKmCE/MA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEwMzUwNFoXDTI3MDYyMTEwMzUwNFowgekxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFUGF0aWwxFTATBgNVBCoTDENoYW5kcmFrYW50aDEWMBQGA1UEChMNQlJP
QURDT00gSU5DLjEoMCYGA1UEAwwfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTEuMCwG
CSqGSIb3DQEJARYfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcN
AQEBBQADggEPADCCAQoCggEBAJwyF5qSHwwr1zJWkKvkMnY7V/sVFYYjTpjgxS4XA76pD6eLsZvS
4J73HkKSNEzORxBE7OyZSnuBJ9zeeRcypuItG9YrHm+0OSF0psIWsH15FBYJ0nvsUnlFbCSNvOdr
Co0WJ1KTe/7caj014uRZM2j7zH1vC+9fjEgrJdDRZakZXarl8M7k9okvVj1N+EuHiYUMvsAuMadE
a3p31Z6QdvMpr+30UdJXHshV1mXca+UBpCx26GbY6NgxhHM2LtHiaCK8Vn4HMofDkFg4nQ6eK4ai
uCiTtPj5aNlkdpcCzcZ+j1eCu6ZfPIq2ycwDaHi8d6Dwcgm+XoxDmD97Ehp2FOkCAwEAAaOCAeMw
ggHfMA4GA1UdDwEB/wQEAwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggr
BgEFBQcwAoY6aHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1l
Y2EyMDIzLmNydDA5BggrBgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2Ny
NnNtaW1lY2EyMDIzMGUGA1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGg
MgoDAjA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5
LzBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKgYDVR0RBCMwIYEfY2hhbmRyYWthbnRoLnBhdGlsQGJyb2FkY29tLmNvbTAT
BgNVHSUEDDAKBggrBgEFBQcDBDAfBgNVHSMEGDAWgBQAKTaeXHq6D68tUC3boCOFGLCgkjAdBgNV
HQ4EFgQUyqNnwId/JCbRPslVl3nm48YRek0wDQYJKoZIhvcNAQELBQADggIBAKPmllSh8cRXzNRs
3OATCVDgrdOfIsZMB9UVXcYQ+HtR1fu9bafeyuuupF9gcCmi+onLsANYRKaEDjC8h+V5FMAgm6TI
bww4EFGpWvP/XEVKrpcpMkYNMLw89lagx9ZZDhx9DmfQMI9gG9MPpCkSMEPnJvEs7gqtOo08aL1+
ts10tGfePsHF/I42Da21hJIJ01XN+Z91y//1cJkHwCBvDmoB8gdMXp3g4sjzahTxRZ25BdZB9W+n
0jfWJXFKtp9MYS1SaVo17usfrlTeyaH3zPyDvfAfGoLB5+i8vyVL6wta2vgVpfsL9iwhbJnAIxr+
ljECWkh1weDJw3UnV6nooG1RztnwqbG4eAG/KSCToXgVH9qSDv5S1lve5mvhv9AHzLjGLs+QtMeg
WEdMM4G0PWyibzGgNrmVgKaLjV6EMo/IZW7KjBtvjyKQZhes90D4GyxXv+/mrTo2rruz53+FoSc/
nuyLmg/SxnnZRaf7JGHFvu0IbwkeINwdHynAanOg9AD4zits7k7jjQ0fwIdhCaoRA3ao7PXUL1t8
LfSp/K5DCYsrXNqitPmQaAAGAiG4d4WDxBev6vtoyH7ejLcuCKkxCefrLO5qYnuDHsMNCObdslAe
tMVer+USn6AqB//6EwmqdiLr4o20UQ79jxNFMAEKdwyNkA8mVCVUAtTe3mPrMYICVzCCAlMCAQEw
YjBSMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQR2xvYmFsU2lnbiBudi1zYTEoMCYGA1UEAxMfR2xv
YmFsU2lnbiBHQ0MgUjYgU01JTUUgQ0EgMjAyMwIMAgfxQ1Z7DrZKmCE/MA0GCWCGSAFlAwQCAQUA
oIHHMC8GCSqGSIb3DQEJBDEiBCBk/h3MlnUzOqrlOFBCWlH+DGjtHg/Ma6qf5vCsP0Yi4zAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MjUxMjAzMTJaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQALVAnWBqxi
oPm2c+veyKMuf1901xgaq1clxcSYxTT7Mk2fFzS8bgC65EguM8P8mjfpsjbYOYV/3uySc0so/qu1
QNNJfCXOPOYOTIO5JK6M0yp6TF27/UjYRvsHfI4tND4VNKFMsViNAN9+0w6Kna9koqlGZ0T42i+0
zJLIwslcvm0IyM6V3CSLeYZvclWjK6jn0wjW4l283MERLaVYlbkI4jKyGxj6563cBEA2YwWXWabg
a2NmVaaRZdPRddA2OMxrpSO6oTs0pb7IaaXu+T8+0z7Twx3gQe5GTz6XpguqVx2UpItQ7xrzTo5r
ATdn4nO+yfynK6Bm8HU188YUpvO7
--0000000000000a4f5e0659dde3da--
