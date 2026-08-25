Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633C93DAACC
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787660342; cv=none; b=JQrOvYybnAcEaeBYmd2Qipj3T8rXgFkVUniLz/KwgAGH5l392dvvu6gSTGEujE07cyW7WFkZ9FDTmDFnsBPRacazTbC9WZu66IJThPreEit9SHxytPP6OzbZkKByQ5fxhvKJQVqGJe6X6/0OgQc1Lm8j15E+jJH10cYj+V7zkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787660342; c=relaxed/simple;
	bh=rwFhuvEglLvCOv5UFfFArABaQQ+ozj8vezDx5JbImeI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BddBG5bQsFIUZy4Kqext0eHOE92KE1Y/RitvnnwjB5yFj4yyElOIDJkn3+H17G74X69UOhwrZswle2mz7S0bFqC2MUkRT3CEdmKlHG8+995o0FpxZidfDx18GNR/hqftc2OyiNn7wMhalh66csL9tmjrZqDkevc+Um3lTGpgdls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=F90Fo4Cg; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="F90Fo4Cg"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7eb4d532e65so2565209a34.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:18:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787660336; x=1788265136;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQT8a+A85aeMINOfaqFFQ2S5cC0pg98hJv0dFACq7ik=;
        b=TzgfFOzodtdo4Ox0AI2vKHbnrL2MtyWn/zPqaIhH76fT2lfIAzAq+ifU4cin9ijSdt
         Y2j/ibQ3KE3UniHXC8ALfa+Phjk2Yfa0yqfmnkX4GdSxsg+3uBzEx5c0hwobBBzGM9eU
         v50Y6jSeXV6eKCk5aceayxd1ZstyXm6TKkS9I9aXPyVPTs0oVQsszvHXF4SNK/yP+Mxu
         t/JE+RRfpIwuhHm29hj8HMLrwFECZyHHKkWeQE2JaqfO+Tusk1HtqBvEwLICEJo27ioq
         DlitYKX+vegDSKFgpvyEsp3bWhh7bFcG1Ja7TetnWm2gvF8iLxgUVBoepWMkMKMn7/s0
         LqFg==
X-Gm-Message-State: AFuF++l4d9fzbyJcsqdBa6/YiFkQpRJ2fRfX0i+a3joa6qk5Vqm654D0
	qszZEablfJHLG0R52ShKZOI6U/Q4qQibYvZdXXo2IScd5DCioQEIUl9ZH4c9yI6W/QVQnbX3ulc
	IRhLwXuYd+ylB2xzyCElq3XnT0O/E2hpjFq6fz1HDOswtq7Uo6XB9+sD+uz/p9G+4UAVvSu+VHu
	nP9j0JQxkiv/H5vJRBYQ9DJc8oJOkZ6DYkIUOe34nPnhSb5EVqH7BbGUV0ZcD+MEYIjsb4TbB4R
	Gr5suKS+xX2Jk67szd32B/1Le4TetQ=
X-Gm-Gg: AR+sD13v9p1h30R1n8K/Cx1C9wRMBjvaA+E/dvqIB5PR+HNUemR8xIY3V+jaL4S9Ghg
	WUydHKzUgYi5Smmd+NFXZ8PkPuK23Uh/5HhK4AeFsJswWNmxE4tn5ztBJc2uK71sDReeUGGXmex
	1A6xRJP3uFCnxzWvxypjWtFTW+/U1nb9czZUNY79alBypIdEb/02Q+MeNoxr853lE5gkoLu5U1S
	qanmpqf7Rj80P9R89OXb5grLosUkB/WacagJ6XOvvEUq7YPgnKhNLrEhVrswyqUmSzySuRyT42n
	thp3oi/kg9VVxWtEbDizb8ySoG/zc6+0wmd0mZv7ABzJnEmdAsAIOjIjRUBVbg40U9PTE6t5pkd
	FD+MexNgl/KmBcsFlXouIQkYe19KJ7rFOoYEe/cLqpgJM4RXXQc4q3tpDe6gwvSKJ9r6bHO7Z1E
	ZLU2QQGF+HXvcDhVMxN3QigSyJhaMVxhij+E5yhN3fh5o=
X-Received: by 2002:a05:6830:82cc:b0:7f3:7686:3f7 with SMTP id 46e09a7af769-7f476516b1bmr27426416a34.13.1787660335657;
        Tue, 25 Aug 2026 05:18:55 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-7f48fc4ba4bsm1045186a34.6.2026.08.25.05.18.55
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:18:55 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c15c6a68406so314531266b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787660334; x=1788265134; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fQT8a+A85aeMINOfaqFFQ2S5cC0pg98hJv0dFACq7ik=;
        b=F90Fo4Cg8tckwsnqH25k27NCx3JR//ulh4ePJR7cbwLtNYmvBw3eKCUPAVs57+gsiO
         APoPdGdrhMLZI21y62vtSqgW3hTUUKnKsMf68icBThYWIN7Qu1s5E2t6OlHvxnjK1c4n
         aGF6LCj3ZAdDTY+WQ6HRyOtJPu21nrfDgNpdI=
X-Received: by 2002:a17:907:9814:b0:c21:792:8257 with SMTP id a640c23a62f3a-c24e5ad9556mr685265366b.15.1787660333729;
        Tue, 25 Aug 2026 05:18:53 -0700 (PDT)
X-Received: by 2002:a17:907:9814:b0:c21:792:8257 with SMTP id
 a640c23a62f3a-c24e5ad9556mr685258966b.15.1787660333235; Tue, 25 Aug 2026
 05:18:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818231426.58105-1-chandrakanth.patil@broadcom.com>
 <20260818231426.58105-16-chandrakanth.patil@broadcom.com> <20260818182113.87AB51F000E9@smtp.kernel.org>
In-Reply-To: <20260818182113.87AB51F000E9@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Tue, 25 Aug 2026 17:48:41 +0530
X-Gm-Features: AcwNN1XkQGQuLfaz-UIJhGXKKDnlqy0-3fcVPcLuKUO5yXgp_qhpfANSELUcxkw
Message-ID: <CABvwm=Nx8Skq+1eTcE09G8byqd_FXnSRZLFrCOdcdALKYiLtTA@mail.gmail.com>
Subject: Re: [PATCH 15/17] mpi3mr: zero out diagnostic buffer status memory
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000327da50659de1bb7"

--000000000000327da50659de1bb7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:51=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [High] An integer overflow in the bounds check of `mpi3mr_bsg_upload_hd=
b` allows a malicious user to bypass the check and read arbitrary kernel me=
mory.
> --
>
> --- Patch [15]: [PATCH 15/17] mpi3mr: zero out diagnostic buffer status m=
emory ---
> commit 76872b40f16cd1ab1c93f0a03cc6bd1fb6b3db94
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> mpi3mr: zero out diagnostic buffer status memory
>
> Memory allocated for the BSG diagnostic buffer status is not zero'd
> before it is copied back to user space. Several fields in this
> structure are reserved and never written by the driver. Use kzalloc
> instead of kmalloc to zero out the allocated memory.
>
> Fixes: 78b506984ebe ("scsi: mpi3mr: Add ioctl support for HDB")
> Signed-off-by: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_app.c b/drivers/scsi/mpi3mr/mpi=
3mr_app.c
> > index f5b48c95cf055..0cdcb8d236d37 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_app.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_app.c
> > @@ -1244,7 +1244,7 @@ static long mpi3mr_bsg_query_hdb(struct mpi3mr_io=
c *mrioc,
> >
> >       length =3D (sizeof(*hbd_status) + ((MPI3MR_MAX_NUM_HDB - 1) *
> >                   sizeof(*hbd_status_entry)));
> > -     hbd_status =3D kmalloc(length, GFP_KERNEL);
> > +     hbd_status =3D kzalloc(length, GFP_KERNEL);
> >       if (!hbd_status)
> >               return -ENOMEM;
> >       hbd_status_entry =3D &hbd_status->entry[0];
>
> [Severity: High]
> This is a pre-existing issue, but while reviewing this file I noticed a
> potential integer overflow in mpi3mr_bsg_upload_hdb():
>
> drivers/scsi/mpi3mr/mpi3mr_app.c:mpi3mr_bsg_upload_hdb() {
>     ...
>         if ((upload_hdb.start_offset + upload_hdb.length) > diag_buffer->=
size) {
>                 dprint_bsg_err(mrioc,
>                     "%s: invalid start offset %d, length %d for type %d\n=
",
>                     __func__, upload_hdb.start_offset, upload_hdb.length,
>                     upload_hdb.buf_type);
>                 return -EINVAL;
>         }
>     ...
> }
>
> Can upload_hdb.start_offset and upload_hdb.length wrap around during addi=
tion?
>
> Since they are 32-bit unsigned integers controlled by user space via the =
BSG
> interface, a large start_offset (e.g. 0xFFFFFFF0) and a small length
> (e.g. 0x20) could wrap to a sum that passes the bounds check against
> diag_buffer->size.
>
> Would this allow a malicious user to bypass the check and read arbitrary =
kernel
> memory when the subsequent copy occurs?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231426.58=
105-1-chandrakanth.patil@broadcom.com?part=3D15

Thanks for the review.

New issues:
- None. This patch specifically ensures diagnostic buffer status
memory is zeroed out using kzalloc() before copying to user space.

Pre-existing issues:
- The potential integer overflow in mpi3mr_bsg_upload_hdb() is a
pre-existing issue in the driver and will be addressed in a separate
follow-up patch series.

--000000000000327da50659de1bb7
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVcQYJKoZIhvcNAQcCoIIVYjCCFV4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghLeMIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNTNaFw0yOTA0MTkwMDAwMDBaMFIxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBS
NiBTTUlNRSBDQSAyMDIzMIICIjANBgkqhkiG9w0BAQEFAAOCAg8AMIICCgKCAgEAwjAEbSkPcSyn
26Zn9VtoE/xBvzYmNW29bW1pJZ7jrzKwPJm/GakCvy0IIgObMsx9bpFaq30X1kEJZnLUzuE1/hlc
hatYqyORVBeHlv5V0QRSXY4faR0dCkIhXhoGknZ2O0bUJithcN1IsEADNizZ1AJIaWsWbQ4tYEYj
ytEdvfkxz1WtX3SjtecZR+9wLJLt6HNa4sC//QKdjyfr/NhDCzYrdIzAssoXFnp4t+HcMyQTrj0r
pD8KkPj96sy9axzegLbzte7wgTHbWBeJGp0sKg7BAu+G0Rk6teO1yPd75arbCvfY/NaRRQHk6tmG
71gpLdB1ZhP9IcNYyeTKXIgfMh2tVK9DnXGaksYCyi6WisJa1Oa+poUroX2ESXO6o03lVxiA1xyf
G8lUzpUNZonGVrUjhG5+MdY16/6b0uKejZCLbgu6HLPvIyqdTb9XqF4XWWKu+OMDs/rWyQ64v3mv
Sa0te5Q5tchm4m9K0Pe9LlIKBk/gsgfaOHJDp4hYx4wocDr8DeCZe5d5wCFkxoGc1ckM8ZoMgpUc
4pgkQE5ShxYMmKbPvNRPa5YFzbFtcFn5RMr1Mju8gt8J0c+dxYco2hi7dEW391KKxGhv7MJBcc+0
x3FFTnmhU+5t6+CnkKMlrmzyaoeVryRTvOiH4FnTNHtVKUYDsCM0CLDdMNgoxgkCAwEAAaOCAX4w
ggF6MA4GA1UdDwEB/wQEAwIBhjBMBgNVHSUERTBDBggrBgEFBQcDAgYIKwYBBQUHAwQGCisGAQQB
gjcUAgIGCisGAQQBgjcKAwwGCisGAQQBgjcKAwQGCSsGAQQBgjcVBjASBgNVHRMBAf8ECDAGAQH/
AgEAMB0GA1UdDgQWBBQAKTaeXHq6D68tUC3boCOFGLCgkjAfBgNVHSMEGDAWgBSubAWjkxPioufi
1xzWx/B/yGdToDB7BggrBgEFBQcBAQRvMG0wLgYIKwYBBQUHMAGGImh0dHA6Ly9vY3NwMi5nbG9i
YWxzaWduLmNvbS9yb290cjYwOwYIKwYBBQUHMAKGL2h0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5j
b20vY2FjZXJ0L3Jvb3QtcjYuY3J0MDYGA1UdHwQvMC0wK6ApoCeGJWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vcm9vdC1yNi5jcmwwEQYDVR0gBAowCDAGBgRVHSAAMA0GCSqGSIb3DQEBDAUAA4IC
AQCRkUdr1aIDRmkNI5jx5ggapGUThq0KcM2dzpMu314mJne8yKVXwzfKBtqbBjbUNMODnBkhvZcn
bHUStur2/nt1tP3ee8KyNhYxzv4DkI0NbV93JChXipfsan7YjdfEk5vI2Fq+wpbGALyyWBgfy79Y
IgbYWATB158tvEh5UO8kpGpjY95xv+070X3FYuGyeZyIvao26mN872FuxRxYhNLwGHIy38N9ASa1
Q3BTNKSrHrZngadofHglG5W3TMFR11JOEOAUHhUgpbVVvgCYgGA6dSX0y5z7k3rXVyjFOs7KBSXr
dJPKadpl4vqYphH7+P40nzBRcxJHrv5FeXlTrb+drjyXNjZSCmzfkOuCqPspBuJ7vab0/9oeNERg
nz6SLCjLKcDXbMbKcRXgNhFBlzN4OUBqieSBXk80w2Nzx12KvNj758WavxOsXIbX0Zxwo1h3uw75
AI2v8qwFWXNclO8qW2VXoq6kihWpeiuvDmFfSAwRLxwwIjgUuzG9SaQ+pOomuaC7QTKWMI0hL0b4
mEPq9GsPPQq1UmwkcYFJ/Z4I93DZuKcXmKMmuANTS6wxwIEw8Q5MQ6y9fbJxGEOgOgYL4QIqNULb
5CYPnt2LeiIiEnh8Uuh8tawqSjnR0h7Bv5q4mgo3L1Z9QQuexUntWD96t4o0q1jXWLyrpgP7Zcnu
CzCCBYMwggNroAMCAQICDkXmuwODM8OFZUjm/0VRMA0GCSqGSIb3DQEBDAUAMEwxIDAeBgNVBAsT
F0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMwEQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpH
bG9iYWxTaWduMB4XDTE0MTIxMDAwMDAwMFoXDTM0MTIxMDAwMDAwMFowTDEgMB4GA1UECxMXR2xv
YmFsU2lnbiBSb290IENBIC0gUjYxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzARBgNVBAMTCkdsb2Jh
bFNpZ24wggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQCVB+hzymb57BTKezz3DQjxtEUL
LIK0SMbrWzyug7hBkjMUpG9/6SrMxrCIa8W2idHGsv8UzlEUIexK3RtaxtaH7k06FQbtZGYLkoDK
RN5zlE7zp4l/T3hjCMgSUG1CZi9NuXkoTVIaihqAtxmBDn7EirxkTCEcQ2jXPTyKxbJm1ZCatzEG
xb7ibTIGph75ueuqo7i/voJjUNDwGInf5A959eqiHyrScC5757yTu21T4kh8jBAHOP9msndhfuDq
jDyqtKT285VKEgdt/Yyyic/QoGF3yFh0sNQjOvddOsqi250J3l1ELZDxgc1Xkvp+vFAEYzTfa5MY
vms2sjnkrCQ2t/DvthwTV5O23rL44oW3c6K4NapF8uCdNqFvVIrxclZuLojFUUJEFZTuo8U4lptO
TloLR/MGNkl3MLxxN+Wm7CEIdfzmYRY/d9XZkZeECmzUAk10wBTt/Tn7g/JeFKEEsAvp/u6P4W4L
sgizYWYJarEGOmWWWcDwNf3J2iiNGhGHcIEKqJp1HZ46hgUAntuA1iX53AWeJ1lMdjlb6vmlodiD
D9H/3zAR+YXPM0j1ym1kFCx6WE/TSwhJxZVkGmMOeT31s4zKWK2cQkV5bg6HGVxUsWW2v4yb3BPp
DW+4LtxnbsmLEbWEFIoAGXCDeZGXkdQaJ783HjIH2BRjPChMrwIDAQABo2MwYTAOBgNVHQ8BAf8E
BAMCAQYwDwYDVR0TAQH/BAUwAwEB/zAdBgNVHQ4EFgQUrmwFo5MT4qLn4tcc1sfwf8hnU6AwHwYD
VR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwDQYJKoZIhvcNAQEMBQADggIBAIMl7ejR/ZVS
zZ7ABKCRaeZc0ITe3K2iT+hHeNZlmKlbqDyHfAKK0W63FnPmX8BUmNV0vsHN4hGRrSMYPd3hckSW
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
oIHHMC8GCSqGSIb3DQEJBDEiBCCkvFQFQzHbteOogCBf5h9UF0zyzRqqiWGOzpu73nQ+LjAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MjUxMjE4NTRaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAQjdHv5Qx/
HdMReiJW+IAiJUa9aIyfhOsqjY4KHDeJzXRIl35eINVaqKsRt6AfE5Y9Ao2gHoN271TTE9peOXjR
sewvyC1077HD9CNOYmoCYGL9wbdy0I+PZH1CL7lXD7KMa6fRdsH5UD6KmkoucFMisomqIJXW93cO
BLL/0YFvqdgfpDemtFAOgyEW/q6I/LlKzLVLMO/bah3WIBjpmZkw2JMS0sidINPgrye7hSHXDgpY
zKz15cT8dbEMNfoMjo/WXXbfaoPeUQQ8IX8pLyhnvv0ye6oOQokPMA0lt/tu494jxCE6TopBHDn6
n+kdmNrEBEThYxXSVkyreW2XXBzj
--000000000000327da50659de1bb7--
