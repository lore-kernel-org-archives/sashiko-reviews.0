Received: from mail-oi1-f226.google.com (mail-oi1-f226.google.com [209.85.167.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB4414AD0D
	for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 08:23:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789547037; cv=none; b=YlGX0+umd1QFMt+6jdlMZpISwo/PPvLN+iqpYCUCuKrboLNdkI9qVn1q/o1DGrRxqNSghQBwH9rXtEs6N2dl9fGMm+kn+yUptkbL7/35RM0ugWn+a9qef7sCXr2Bq6K7sH1EUZ1735+RaoAVM+ZEB6gyklRztYfjWNSmJnv0djQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789547037; c=relaxed/simple;
	bh=56NxGvgvbJp1M2ZqJKrGzVbegZUSJ+KAItQyeChqr8Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mcxpvfsmg4ZlcAQxQXqsnH7BVzK1X5x4SIghjpBU7i2V7/I+yIoGa1pHjmgyH9EJ8qN5k+xclgBcCOhagv3jKZ5wO7qY6VtZDUPSzY7LUcw5sr7vpLZyNnIHAsW1re4+R5+okBzA81qJ1w0u1JkmO9ZbyX2DTqZzFgBEp1A9k08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=CsvsKHJQ; arc=none smtp.client-ip=209.85.167.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="CsvsKHJQ"
Received: by mail-oi1-f226.google.com with SMTP id 5614622812f47-4ab47c40e7eso769318b6e.3
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 01:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789547022; x=1790151822;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pSGBMBluoRGgJUucnXzE5+/uHCAGW9tc8I8TwGmjaeQ=;
        b=Nt0cCXRoTXenMP80TZiUMzpeZuhlqjD6maoJYXzaN8XF6aosV5bCElXGWqTKjhHaAY
         DpmN9bHR/N5ZhZ50n1QMks0V2pR89erDHOtqemN7EbpqV4pCafnWz4CaFEdUO43idVtn
         EJ2nwL/Z1xjv0CiH2e7FPAUvZLZPCSg9m7DZv26GHXRXQUDmfuIvlX0NmyruiLynFRfj
         1GtLOWg1jAgHmqrzNfsVmi/YZaVYFZsssTisf+ZJgQaqcJHY9Oa0y75bbDdG5qd9xckk
         q+x6nVXScxC30dg5CLvESRJxg5yVGiib1jDDvXwBXhvjfBbLv2z30Ot/1VSdPUSTnr1u
         PbIw==
X-Gm-Message-State: AFuF++kzEo4YR1vC3z8REQzKQFSJgeEjoMMuLEpPV+vXu4KcVZpM5WZk
	nPyM4R7ltguV/ix84Bjc0E01rwkFHD+c8GFWb1z4vuHw1/hKUEPmLaaHSZ0HloncQNNFfWL6IsM
	4jJdqoEVBiA6m3S/4q/zRdQ3oS2MEgM01hJLOkeBFYcqie2+b2ULGszbfcmr9gZ6d2EFAdjYrd3
	GepAZKTZ0yJhaPL0jW6rl+m9u/9AyMDLQcLxXC3nVV06dwn0HRzrl39zrjgsKhjSg3lzfSNkUjY
	wJNpbmmtOTiXxKD1SvU1g4=
X-Gm-Gg: AYBFou3x3MtDgQVB6UE7NxxBckBOHwkSvwjtLJDLD/sqBXsxUm6Ml15zoZ6pAg5Fo2M
	4atAdnLCOjtqU1ljgZndDaX2sQgNTHFZvs7NfeKnFf7e/SLPAwgLszZH01MVLGbOz8xswop+jvK
	WGHAvs8yF05vcD6d6IZ62pBg2BYcyqER/3NJnLDBZfBkG1s3U9dLo3V4PD4os8Keenmr8U1Ifq5
	RXOT4ePzh1710EOA+MYOnz4wx+gzlzn9/JFsF72jKGKTBZVD7meWmTpUK7dpMBvRll+BkpWdtbc
	bcZxoa0Cr48ZTJJee9mrHuzV7AcxAYXXB2eTPFH+B0PgGqSKjItc1Q4+X0Gw7pEmdfqvOcOtdhr
	kjx0kWo398RxwYdgTtH7mp7H7yDtB93MBzzKCe5SciNsq5S8annq4m/H8Wcyvo0GK911mhKRMHD
	VeOvRhf6VDrsX6mh8NoELtU1l6KOHfQblvAc4=
X-Received: by 2002:a05:6870:478c:b0:483:bdb3:a52b with SMTP id 586e51a60fabf-48476c51181mr2893932fac.11.1789547022041;
        Wed, 16 Sep 2026 01:23:42 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-25.dlp.protect.broadcom.com. [144.49.247.25])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-4842b2358d5sm78860fac.16.2026.09.16.01.23.40
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Sep 2026 01:23:42 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-6a125f5b317so6172843a12.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 16 Sep 2026 01:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1789547019; x=1790151819; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pSGBMBluoRGgJUucnXzE5+/uHCAGW9tc8I8TwGmjaeQ=;
        b=CsvsKHJQfGKf5eIH3N+LtqUdAssvYttns9TlP4W44fPiSm2NX9YSLKWrOXcBq0+J7K
         sMaaTywa6vkCWe59F/dpHLTPdXZg6REsL7Xx2FiWB0qyGe2jmSZ6o09kqBzENy75AsCo
         wC13tyJ/tw1ydkUjK0XCW8WWWPwhrmyHV95CQ=
X-Received: by 2002:a05:6402:46c3:b0:6a9:b520:5d63 with SMTP id 4fb4d7f45d1cf-6aa2244cff3mr864495a12.40.1789547019286;
        Wed, 16 Sep 2026 01:23:39 -0700 (PDT)
X-Received: by 2002:a05:6402:46c3:b0:6a9:b520:5d63 with SMTP id
 4fb4d7f45d1cf-6aa2244cff3mr864470a12.40.1789547018728; Wed, 16 Sep 2026
 01:23:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805110634.346670-1-ranjan.kumar@broadcom.com>
 <20260805110634.346670-2-ranjan.kumar@broadcom.com> <20260805113322.993BA1F000E9@smtp.kernel.org>
In-Reply-To: <20260805113322.993BA1F000E9@smtp.kernel.org>
From: Ranjan Kumar <ranjan.kumar@broadcom.com>
Date: Wed, 16 Sep 2026 13:53:26 +0530
X-Gm-Features: AcwNN1W9aPZ5JN-MSUs0A9u6UxH8leWeOsnanYSmQBZT6Rsyv0qKTVq8UZSiYI8
Message-ID: <CAMFBP8NxDqKzyC_tUSAnAs6XEHQ0x4wGb3p9X=-M6u99u0WmjA@mail.gmail.com>
Subject: Re: [PATCH v4 01/10] mpi3mr: Skip device shutdown during unload per
 controller configuration
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000069d8e0065b9562a1"

--00000000000069d8e0065b9562a1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the review.

Both findings are pre-existing issues in mpi3mr_alloc_trace_buffer(),
unrelated to the changes in this patch. I will address them in a
separate follow-up patch after further analysis and testing.

Thanks,
Ranjan


On Wed, Aug 5, 2026 at 5:03=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 2 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] The driver rounds down the trace buffer size internally when all=
ocating segmented buffer entries, but passes the original unrounded size to=
 the firmware, which can cause the firmware to read past the end of the seg=
ment list and DMA write to arbitrary physical memory.
> - [Medium] A trace buffer size smaller than 4KB results in a 0-byte DMA a=
llocation, triggering a WARN_ON_ONCE within the kernel DMA API.
> --
>
> --- Patch [1]: [PATCH v4 01/10] mpi3mr: Skip device shutdown during unloa=
d per controller configuration ---
> commit 9ac255a070f5df8da5fb46e54b2787eacb0b7c7c
> Author: Ranjan Kumar <ranjan.kumar@broadcom.com>
>
> mpi3mr: Skip device shutdown during unload per controller configuration
>
> This commit caches Driver Page 1 settings to suppress device shutdown dur=
ing
> driver unload. It adds endianness conversions for the diagnostic buffer s=
izes
> read from Driver Page 1 and hardens the allocation retry loops against in=
valid
> decrement sizes provided by the firmware.
>
> Closes: https://sashiko.dev/#/patchset/20260626114109.43685-1-ranjan.kuma=
r@broadcom.com?part=3D1
> Closes: https://sashiko.dev/#/patchset/20260708183305.244485-1-ranjan.kum=
ar@broadcom.com?part=3D1
> Closes: https://sashiko.dev/#/patchset/20260724102505.115136-1-ranjan.kum=
ar@broadcom.com?part=3D1
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_app.c b/drivers/scsi/mpi3mr/mpi=
3mr_app.c
> > index 1353a8ff9c85d..fca5357a515d1 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_app.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_app.c
> [ ... ]
> > @@ -179,6 +181,12 @@ void mpi3mr_alloc_diag_bufs(struct mpi3mr_ioc *mri=
oc)
> >                   mpi3mr_alloc_trace_buffer(mrioc, trace_size)) {
> >
> >                       retry =3D true;
> > +
> > +                     if (!trace_dec_size || trace_dec_size > trace_siz=
e) {
> > +                             retry =3D false;
> > +                             goto retry_fw;
> > +                     }
> > +
> >                       trace_size -=3D trace_dec_size;
>
> [Severity: High]
> This is a pre-existing issue, but does this lead to firmware reading
> out-of-bounds and potentially corrupting physical memory?
>
> The driver rounds down the trace buffer size internally when allocating
> segmented buffer entries in mpi3mr_alloc_trace_buffer():
>
>     seg_count =3D (trace_size) / MPI3MR_PAGE_SIZE_4K;
>     trace_size =3D seg_count * MPI3MR_PAGE_SIZE_4K;
>
> However, it does not update the caller's trace_size. Thus, the original
> unrounded trace_size is stored in mpi3mr_alloc_diag_bufs():
>
>     diag_buffer->size =3D trace_size;
>
> When posting the buffer to firmware in mpi3mr_issue_diag_buf_post():
>
>     diag_buf_post_req.length =3D le32_to_cpu(diag_buffer->size);
>
> The firmware calculates the required number of segments using the unround=
ed
> size (e.g., ceil(5120/4096) =3D 2), but only 1 segment was allocated (siz=
e 8
> bytes for the segment list). The firmware will read past the end of the
> segment list (16 bytes), leading to an out-of-bounds DMA read. It will th=
en
> use the arbitrary out-of-bounds value as a physical address to DMA-write
> trace data, leading to memory corruption.
>
> [Severity: Medium]
> This is a pre-existing issue, but can this retry loop cause a 0-byte DMA
> allocation warning?
>
> If the firmware-provided host_diag_trace_max_size (or the size after retr=
y
> decrements) is less than 4KB, trace_size will be less than 4096. When pas=
sed
> to mpi3mr_alloc_trace_buffer(), it calculates seg_count =3D trace_size / =
4096
> which evaluates to 0.
>
> This results in a 0-byte allocation in mpi3mr_alloc_trace_buffer():
>
>     diag_buffer_list =3D dma_alloc_coherent(&mrioc->pdev->dev,
>                                           sizeof(u64) * seg_count,
>                                           &diag_buffer_list_dma, GFP_KERN=
EL);
>
> Calling the DMA API with a 0 size triggers a WARN_ON_ONCE(!size) splat in
> dma_alloc_attrs(), which can crash systems with panic_on_warn enabled.
>
> >                       dprint_init(mrioc, "trace diag buffer allocation =
failed\n"
> >                       "retrying smaller size %dKB\n", trace_size / 1024=
);
> >                       goto retry_trace;
> >               } else
> >                       diag_buffer->size =3D trace_size;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260805110634.34=
6670-1-ranjan.kumar@broadcom.com?part=3D1

--00000000000069d8e0065b9562a1
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
MjAyMwIMDcMaKRu9LrbAxERoMA0GCWCGSAFlAwQCAQUAoIHHMC8GCSqGSIb3DQEJBDEiBCAsnh+O
m+AiKiugFqaQmiVgRhm72upBm5e9gpqY9NFrIDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwG
CSqGSIb3DQEJBTEPFw0yNjA5MTYwODIzMzlaMFwGCSqGSIb3DQEJDzFPME0wCwYJYIZIAWUDBAEq
MAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCG
SAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQDCIoyKN78/x0CXuuoc7Lr+bvG4cfysxLUQiiMjSSZi
zqBGRKPiv1Iy0QFi8NF21wFOmIW6k3jyxTr+trDTnfGSAd2sZL3aFzyG5KAs2rRaZBX275qVVIUp
flynYClgb8Xtmpk4BQXtA0jnlv6kaCD+MzmOACphuVk+Z/cIHNPoJU3dIbwVgJfaNW4BELsUffxb
jbSNuTYEhi1DYFx4V5hj7IdwSDbNkgosrrbx1qW/dcIyau4LrPBdawh+YS53ZXjiAhL/ubX24CBD
qSFnP2egWzTPUVCbugMAXtVLkWq9l6RhjUdZ+mee6GkbOdJmSMjAQfMrrAtcqkDXyCUnkf/9
--00000000000069d8e0065b9562a1--
