Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 498633EB106
	for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 12:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.227
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787659465; cv=none; b=cJoV/exItzz5IWSbgy6sMpKSAcQukS6XR67VX8iMIvQ/jD2CEfxTU/HEcvkJh0JM+7f9+3Z+Trmnw9TkRF7moLTR39ty4TiDSlbHKeUi2Oic5PKGM1hh7G425plFkQixy5cZQHnoIGCj4LwZ5qhRb2oa82j/LqR9oGvr1MlDb0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787659465; c=relaxed/simple;
	bh=g6I/Orra56zWGx5yk7b2CX2N3Z6PN+67HjR06jQprPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TAqf0OYJAa8SSzcjvMn1PaLf3CiPelZosnlvjcZ+cZnFmeOLN9jgckuTogUfdW9BYOnMVtSqWOUu1q5ilFJcl3POPe+RLFoclfWrpteeeaYfR3KkDxd0RKcOcgZQuIMueH+2MWIRh3w1ih06TPtVUo1s5RnEY+mwmFbRNMuKajA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=d2cLURC0; arc=none smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="d2cLURC0"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-8565d77c277so2905477b3.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:04:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787659463; x=1788264263;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lcGsrF7wWIV1sZo1R5aNGez4WNHaaIfcQrPlf6yncLU=;
        b=dZYry3YWgtArR/KkecnQAYAYzAMqMtLMTLjMy3zFH64U1iLvY2LrAgGIMaOUghY8hi
         +fPJbjHFcjnVj7jR6zuKUeHQdmYTU6jmO6hEuaw92qR+uiCkq1ugePSKtLrbukezRXHK
         nMojBFQIr92h8yP0bL+TYtK4bd87fMsUr3pxB6kNXYBLnbpB9KgrqzyyIYAxleL1PJ2x
         zjX2CMwn5fCLv7i5E/ulounfs0OR0KopWQcU5L4eH62NOcV7SKTD+AQoNgwTGnu55tuL
         6/+KljDTONa6uTlXjNvfRvdxN/OCUEnVUoOgrGuPy/1k5IsTDhKVv++Zi8RQ7F/QOE53
         BdBg==
X-Gm-Message-State: AFuF++kafsbSVS2DEUbjxXxSA8n/HMsTzR2CEF4Ek2fA0H8nvfeVPGjp
	nYg95M3TTHwHbuFVpV69RaQwEyT4uHmPB26ecbVOrrB/8zVhfdvmlCyjGqJ72A8veEzlbTwQnzb
	MpCgqWWRJpAr00FXtwnp2I7/pmeTh2NUePpdDoN/VM8afEIBxs1BMrjM5iVTjMLC+s//18U9xXU
	8fkbRQTKvk94RWMT0iFY+SzEG99pns6mU7V8BOgZNLxpcMwELNuRdSXxn1nNop2NLrfJfFU231z
	VmDLLFzSYWuBNN8eSLxhwgqurGSJLc=
X-Gm-Gg: AR+sD11i8wA+Uqw5rLdTLreuK9J32hkzkOxOBxahtpgArgZdwyjapGX7TihH/hlYeLO
	SbJQbdKbs/YC4S4ynhA/oF5HP/18ha4C7llGhhEOQ5H8ENjDVZdAIxf1JmjqeYBUubVREjmmbY9
	qeMAEZSgIGPgVGtkczCKqqjQ0hUv5nSyUt7JaHxQYdDpPtlFGYXCywZtzj7rs3kIHAB3w1sQQqw
	DPHKy/sAFVdQuQr3JAoWazPE3zGeW8XNrx1sU4glvjDGUEjMfOAZUW1jDaaXCLcv8+Sln5Wgklz
	aEGG8OXjrFQ+PsdHKVhyKQFpLKhOnvkwtH6efjC4Q3G7SMDdDZAU/B8nmu4FLUmhs9g0kg6YBuO
	1VhCoYD5qOoUD02qTUvZP9dH2xuInxhoVtlJ2jjZwG6wcDVfFB2dZRvSib3omyjhfcyeIeSmYjW
	oz5UDJylQhLC3KS6PzDYV9FoYUsu9R2pk7ba8DV/YHp3I=
X-Received: by 2002:a53:b211:0:b0:668:99f0:92f0 with SMTP id 956f58d0204a3-66cf223f5f1mr6099101d50.48.1787659462695;
        Tue, 25 Aug 2026 05:04:22 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-20.dlp.protect.broadcom.com. [144.49.247.20])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-84cb1c5eee9sm884037b3.5.2026.08.25.05.04.22
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Aug 2026 05:04:22 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15c6a68406so313368266b.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 25 Aug 2026 05:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1787659461; x=1788264261; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lcGsrF7wWIV1sZo1R5aNGez4WNHaaIfcQrPlf6yncLU=;
        b=d2cLURC0Hr0Xyflb6GKq/njiO7Sb4q5DhMObpbPbb4v0xwwhKf9nO1cqbHL77Yg9lF
         J1oN5PwpMH4l5jdojscLrJRsOvAlhgeHTKUeF+XNYr8hxX2sV9AWcXzGfWMRRfbdxSgu
         dCcPbcx/zJIcJbVYw03Ca+DAxc0nv5eoNiIyI=
X-Received: by 2002:a17:907:d0c:b0:c20:53c7:488d with SMTP id a640c23a62f3a-c24e5ade3a4mr674422466b.14.1787659460764;
        Tue, 25 Aug 2026 05:04:20 -0700 (PDT)
X-Received: by 2002:a17:907:d0c:b0:c20:53c7:488d with SMTP id
 a640c23a62f3a-c24e5ade3a4mr674411666b.14.1787659460085; Tue, 25 Aug 2026
 05:04:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260818231426.58105-1-chandrakanth.patil@broadcom.com>
 <20260818231426.58105-4-chandrakanth.patil@broadcom.com> <20260818181131.B7A541F000E9@smtp.kernel.org>
In-Reply-To: <20260818181131.B7A541F000E9@smtp.kernel.org>
From: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
Date: Tue, 25 Aug 2026 17:34:08 +0530
X-Gm-Features: AcwNN1XQsIL_k4kkB_41hzk8OMRP6ENZANiYMBGV0XWL9qsRT8zcNUxRiKSP9-4
Message-ID: <CABvwm=PWk07NjVmTCQzkU=rC53gGWdFSLttb_qBzb+f_3gBxKg@mail.gmail.com>
Subject: Re: [PATCH 03/17] mpi3mr: Fix I/O block counter leak on admin request
 post failure
To: sashiko-reviews@lists.linux.dev
Cc: linux-scsi@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002b37740659dde7a9"

--0000000000002b37740659dde7a9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 18, 2026 at 11:41=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
>
> Pre-existing issues:
> - [Critical] Dereferencing `stgt_priv` on the error and timeout/completio=
n paths leads to a Use-After-Free if the SCSI target is concurrently remove=
d.
> --
>
> --- Patch [3]: [PATCH 03/17] mpi3mr: Fix I/O block counter leak on admin =
request post failure ---
> commit 1533f8fc86e8eb7e7a5042ad5aab564671eb7b8c
> Author: Chandrakanth Patil <chandrakanth.patil@broadcom.com>
>
> mpi3mr: Fix I/O block counter leak on admin request post failure
>
> This commit addresses an issue where the per-device I/O block counter is =
not
> decremented if posting a task management request fails. It lowers the cou=
nter
> on the failure path to prevent I/O from remaining blocked.
>
> > diff --git a/drivers/scsi/mpi3mr/mpi3mr_app.c b/drivers/scsi/mpi3mr/mpi=
3mr_app.c
> > index 1cd1c38dcd565..a4fe10a05cb3a 100644
> > --- a/drivers/scsi/mpi3mr/mpi3mr_app.c
> > +++ b/drivers/scsi/mpi3mr/mpi3mr_app.c
> > @@ -2782,6 +2782,8 @@ static long mpi3mr_bsg_process_mpt_cmds(struct bs=
g_job *job)
> >               dprint_bsg_err(mrioc,
> >                   "%s: posting bsg request is failed\n", __func__);
> >               rval =3D -EAGAIN;
> > +             if (block_io && stgt_priv)
> > +                     atomic_dec(&stgt_priv->block_io);
>
> [Severity: Critical]
> This is a pre-existing issue, but does this add another path that can tri=
gger
> a use-after-free if the SCSI target is concurrently removed?
>
> Looking at mpi3mr_bsg_process_mpt_cmds(), stgt_priv is fetched from
> tgtdev->starget->hostdata, but the tgtdev reference is immediately droppe=
d
> before posting the bsg request:
>
>         if (block_io) {
>                 tgtdev =3D mpi3mr_get_tgtdev_by_handle(mrioc, dev_handle)=
;
>                 if (tgtdev) {
>                         if (tgtdev->starget && tgtdev->starget->hostdata)=
 {
>                                 stgt_priv =3D (struct mpi3mr_stgt_priv_da=
ta *)
>                                     tgtdev->starget->hostdata;
>                                 atomic_inc(&stgt_priv->block_io);
>                         }
>                         mpi3mr_tgtdev_put(tgtdev);
>                 }
>         }
>
> Because there are no references or locks held, if the device is concurren=
tly
> removed (e.g., via hot-unplug), the SCSI midlayer can invoke
> mpi3mr_target_destroy(), which unconditionally frees the hostdata memory:
>
> mpi3mr_target_destroy() {
>         ...
>         kfree(starget->hostdata);
>         ...
> }
>
> Since the original completion path also dereferences stgt_priv after slee=
ping
> in wait_for_completion_timeout(), both the timeout/completion path and th=
is
> newly added error path seem to potentially call
> atomic_dec(&stgt_priv->block_io) on freed memory.
>
> >               goto out_unlock;
> >       }
> >       wait_for_completion_timeout(&mrioc->bsg_cmds.done,
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818231426.58=
105-1-chandrakanth.patil@broadcom.com?part=3D3

Thanks for the review.

New issues:
- None. This patch specifically fixes an I/O block counter leak when
posting a task management request fails by decrementing
stgt_priv->block_io on the failure path.

Pre-existing issues:
- The stgt_priv lifecycle/UAF risk during concurrent target removal is
a pre-existing issue in mpi3mr_bsg_process_mpt_cmds() (also present on
the completion path)
  and will be addressed in a separate follow-up series.

--0000000000002b37740659dde7a9
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
oIHHMC8GCSqGSIb3DQEJBDEiBCAujwE1rZDmhaQlD+qiq4gP3cT8dV3KTX9QmgvNicRoyTAYBgkq
hkiG9w0BCQMxCwYJKoZIhvcNAQcBMBwGCSqGSIb3DQEJBTEPFw0yNjA4MjUxMjA0MjFaMFwGCSqG
SIb3DQEJDzFPME0wCwYJYIZIAWUDBAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZI
hvcNAwcwCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQA3yOULt/wq
WHRhcbpm1Y39Fo693WbKQjObc1A2sNHzh1HpEY1rjppuq5BQ0ql7NOEfKviU3Jh9Wf3MzKJxVwII
QYD1vKz/hUKKyCkjzdUJj3ONNOMAPSwI6P5CMsAoa302DJYsSOUMSuruIuEFO07dV6hefnjzFen5
LPiEmSPv3P9uSxugleAOWnGH3amtkBrhh1U128GXHOS77AFd+Tip3cdTwwwARwmZCntl9OdIJU5B
SWtrwJvIONTBGx27HsAa8uCKIaa00q1xzCZoXdPGX7zlRjDVJeBAZ0l6kLC/BFTXoqWNxg7YEypi
o7NOhSqDs/ITMEax/rwKz91C7hBz
--0000000000002b37740659dde7a9--
