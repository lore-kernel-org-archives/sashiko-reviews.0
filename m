Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BE12BEFF5
	for <sashiko-reviews@lists.linux.dev>; Tue, 22 Sep 2026 04:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790052008; cv=none; b=aTUrXpZlPIWlvNmAbDWLKvV4JxD+4QIjqyxY99VXsWArzIk0jAFi2c9+D6G5ABzMtzKNjpWw7EuPbQlsoFLY6IMyLuHBwGQBU1y3URFJKhVqtIm+OUeq6yWKEaRYn0h0K8UkK0Km/3sN4KC0cl3VXEcIieRD5Ami7DFQfT/Ky/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790052008; c=relaxed/simple;
	bh=oXD83cpmChatbGLQse04YpXGHjiz16E/1wpMgishcEI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mkJy6tccVzfRCvSC0Y/U9hNIIzQVPsjLOmf+67LNAJMb02mNixNnFCpKSSsklA2WVa0vcrhiHPeGOQ+1Y9yLU3hctsiiwYwH/FEJyZ8xGax8j7Vlbip6YVBE0U+qvil13F1boFpx/QVjX496Jcj3OSgdhPf6V+1O+9deAxcuAIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bZJ+xMpZ; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bZJ+xMpZ"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7f4dedd67b8so1412847a34.1
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 21:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790052005; x=1790656805;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QUSmEHc1CIQrVHmbkWj7qDAWaRiOMvAmZEbMgeUgHag=;
        b=eTulAtvtl4fQUJ1u3YgTPovVFU2u+y6WMwS7VT+8DJBLkdYfGeyQ7KIo3rqvp2DYwb
         MqT3+r/NpzWaiJ6GMN+MnqrWvU0i8qNr/UXlXNtHB45MXo/gOcdHZk3x7l+uMbSUwO7e
         yYN0FZGejK7dfxkpBfRiqQAMp4bx+NiWCSM2+3jehqcv5Y1UmMz6YEv9gXMazO3sZfnC
         W3qwsj6Z4tbZTyPV/nwctNDfDefqItUM8rbTJ+bmBC+s/LXkmCwrG0Xh6hzdCVOR96YI
         uCzY/+ra4qfubwbGJzibQWYmyGmjWj5fF0WqH7kwG14SxxJTSXhCzL3Ss70IgoKOrbuo
         uBrg==
X-Gm-Message-State: AFuF++m4mPsUIVRv31C3QplgKEnJnY36fVmn4iTL5MqZd3gvNQF9vrGH
	sVz9StXEvt+/wXOgP9lcclYhx1Mb0t7lPZPAaCXz2hqIhscbRa8Kh/1ydrlhOx9vwn4NS8RDu+k
	sakigs8z7xVMhbcANkmnsSTApHGTSWA9HTMgVc8p8TeAVmLqx/wgSoiNRrUfDiBF/Qq53ZUClI3
	xzl0i0QZ+/uNFpZRsUJ1j3kdkWB4lMo7Xd1et3dIrSLdme1lJ0hl4tXadv7h3tqwEUdXek9zO1r
	5FyQPj8Ysb2H6VXBB30T5I5
X-Gm-Gg: AYBFou3slP8oRojNvNcR5IrtlGoDpn17RIEl8H2TCGyx9l2+VtugHse5fu/JDU+xT67
	I8n1Np288Ii767lwx4OMJ3HQL/+r95gnurShuuOILq+Rsv7edONB5sYm8JyaIUdnniDPgqQaTgJ
	eX4rnmQZ/6WdP2FDGUcVeBLrZ4CM03soczdY5u4TK+dCfYIdx0Y0zkD5wcVeH+bK+763hKYqA+8
	7AytUVdHMg38Y1M/snle869ZjiJTZl0ywVhkVD4fA68CB1McLV3ek81X3ZTsPvA6R+XksF6NfUz
	UL0Ltduz0mMQPlUaZFtgOBzwtfrnK14zAZL5RzennVsx1qgwqJr0W68Y6Zxuo6pxm24KLfoJpSE
	Vey2hq0KeXkGXE57lxHCrts99hI2ZAGNPE9t0mHcAUSvQGZVN1vKetY2LISGhAxJOGgivKyyX+H
	nGUN6hCqXRkwUVgdmyM6betwHxkBMDkXiP/Lnx
X-Received: by 2002:a05:6830:7009:b0:805:b3e5:18d9 with SMTP id 46e09a7af769-80ddff697ddmr13639085a34.10.1790052005597;
        Mon, 21 Sep 2026 21:40:05 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-29.dlp.protect.broadcom.com. [144.49.247.29])
        by smtp-relay.gmail.com with ESMTPS id 46e09a7af769-814e567f2a7sm276932a34.3.2026.09.21.21.40.05
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 21 Sep 2026 21:40:05 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-46a12cfc288so8292294fac.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 21 Sep 2026 21:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790052004; x=1790656804; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QUSmEHc1CIQrVHmbkWj7qDAWaRiOMvAmZEbMgeUgHag=;
        b=bZJ+xMpZDVVzaO0Uh4TtGI7ZZX6XTksZD0KuD9yD1QhA3yOo2g8x53Tb2ElAr2XNHE
         xtTIEbE2ph/NY9+Gz4MyGQ5RdUvkSe+kWVQQ6nmzCldQg0k/5IY+kt4xGFTF+vmYSCgv
         s5BDwQ/HovjkzAwSxOOwhXR6qRSK6ur5/INJs=
X-Received: by 2002:a05:6820:4ccb:b0:6cd:3fdc:5ff8 with SMTP id 006d021491bc7-6cd3fdc6046mr8789351eaf.73.1790052004581;
        Mon, 21 Sep 2026 21:40:04 -0700 (PDT)
X-Received: by 2002:a05:6820:4ccb:b0:6cd:3fdc:5ff8 with SMTP id
 006d021491bc7-6cd3fdc6046mr8789344eaf.73.1790052004107; Mon, 21 Sep 2026
 21:40:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260922061230.7909-1-selvin.xavier@broadcom.com>
 <20260922061230.7909-6-selvin.xavier@broadcom.com> <20260922010711.3E3C21F000FF@smtp.kernel.org>
In-Reply-To: <20260922010711.3E3C21F000FF@smtp.kernel.org>
From: Selvin Xavier <selvin.xavier@broadcom.com>
Date: Tue, 22 Sep 2026 10:09:52 +0530
X-Gm-Features: AclHuK_DYnOYvxdn7DRe5shee3Soyaw3bjEm4zMayIpzKQDGhi2gHrR0qEHa3lQ
Message-ID: <CA+sbYW0A0gS2dhgLF18etO9mnMzhxvLbDmru6v17t+7qQ4Hizw@mail.gmail.com>
Subject: Re: [PATCH for-rc v3 5/8] RDMA/bnxt_re: Validate num_sge in bnxt_re_post_srq_recv()
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000e0ee35065c0af53f"

--000000000000e0ee35065c0af53f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 22, 2026 at 6:37=E2=80=AFAM <sashiko-bot@kernel.org> wrote:
>
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] rdma/bnxt_re: un-ratelimited error log in spinlock allows DoS
> --
>
> commit bb7479cd7b3a22e9b0e6b2862ab2b9133790528b
> Author: Selvin Xavier <selvin.xavier@broadcom.com>
>
> RDMA/bnxt_re: Validate num_sge in bnxt_re_post_srq_recv()
>
> Add a check if max sge for SRQ is exceeding the device maximum.
>
> > diff --git a/drivers/infiniband/hw/bnxt_re/ib_verbs.c b/drivers/infinib=
and/hw/bnxt_re/ib_verbs.c
> > index c35ed6ed03516..3cccef8e2e837 100644
> > --- a/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> > +++ b/drivers/infiniband/hw/bnxt_re/ib_verbs.c
> > @@ -2399,6 +2399,13 @@ int bnxt_re_post_srq_recv(struct ib_srq *ib_srq,=
 const struct ib_recv_wr *wr,
> >               /* Transcribe each ib_recv_wr to qplib_swqe */
> >               wqe.flags =3D 0;
> >               wqe.num_sge =3D wr->num_sge;
> > +             if (wr->num_sge > srq->qplib_srq.max_sge) {
> > +                     ibdev_err(&srq->rdev->ibdev,
> > +                               "Limit exceeded for SRQ Receive SGEs");
>
> [Severity: High]
> Is it safe to use an un-ratelimited ibdev_err() here while holding the
> srq->lock spinlock with interrupts disabled in bnxt_re_post_srq_recv()?
>
> Since an unprivileged user can repeatedly invoke the RDMA uverbs API with=
 a
> wr->num_sge larger than srq->qplib_srq.max_sge, could this regression all=
ow a
> local user to flood the kernel log buffer and potentially cause soft lock=
ups?
 It is possible to reach the kernel driver using an under privilaged
user, but there is no support in rdma-core/libbnxt_re to call
ibv_cmd_post_srq_recv and this code path will not be reached as of
now. So I think this can be ignored.
>
> > +                     rc =3D -EINVAL;
> > +                     *bad_wr =3D wr;
> > +                     break;
> > +             }
> >               bnxt_re_build_sgl(wr->sg_list, wqe.sg_list, wr->num_sge);
> >               wqe.wr_id =3D wr->wr_id;
> >               wqe.type =3D BNXT_QPLIB_SWQE_TYPE_RECV;
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260922061230.79=
09-1-selvin.xavier@broadcom.com?part=3D5

--000000000000e0ee35065c0af53f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
zJH6Ivyz2skA36zh/px/UmF2ORX4Y0CY6GtU8/vxuN2j4rd2medlyifwALUm+KI3SsD782IwKLCf
8bNhYGiw4YxsbyX7dV7O4SNQc5U9ktrSKH3D4SuTnK/xdjca5PiNI2NTcBVmP7+u2bvVLdRqISop
9dpRkJ6xxhGJjxakljIxHdcZLXltxX4YM0Onf3agcjY3boIqnVlDjBwSZX674ZU+YVrcIlcRcqs/
W83e6PmIRFwpkKOhuLNKSpW5mZoEQdpnxGwE9U7qLGECAwEAAaOCAd4wggHaMA4GA1UdDwEB/wQE
AwIFoDAMBgNVHRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDov
L3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5Bggr
BgEFBQcwAYYtaHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUG
A1UdIAReMFwwCQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUF
BwIBFiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDag
NKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwJQYD
VR0RBB4wHIEac2VsdmluLnhhdmllckBicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQw
HwYDVR0jBBgwFoAUACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFJA9fV7cOoiN64ws5XPC
J5qtayo5MA0GCSqGSIb3DQEBCwUAA4ICAQBFCIF4AxAiXVz6gX5YfFEbIYtbGFifcfe+QGc5cfac
CSzIrQWUPXAYAef3G5WouD2AKwa2tPGJgK2L7n1r2W4NIvr93588EDVnGgfMfWaFsB8VlLsPlH8Y
fLfaTdN3OQPnFFp54yK9wv8AtTIiTQcailMw7QX5x5GE6HVZElxf0V0Ljc2NrUQLoYzHzAU+sysl
6JQzomxjIfuXiIiUfmnWQdhO95kQchRdOUAaguLTV+RRfPZ1p54dRmgGEpJtzjGLdsrLkZ2rCN5j
cOTTXyxJmvlgm9jfT0Uy5SOPHdq1jtZbQyXrNT4fQ07Odmq3xQCUTi+a59IiC+6V7nFJ8zyCSk+p
n/iGouvun/owYzTmFxB6sVLWZcaWz2Ufcm7b6nOYV+pwUS/n6+6oFRKmGLrl0CRCF0AOph5p81aV
kgKuS5oXBoDefJfjKHuu5lJVelBx3n++iMGMW9FWFmXErCHy2d+L42Raai5X2PL8jAmh+lpPRDX4
CT9jL6xWM5QkCBtxyVKuxGxxUY2wczmVcQ1nGh9mGghI04Scs4OtE8Qh9LMOe2PXzxcV6lpF+yay
B3fwJWxl7miwNFjWuu9M6Z+rcjm3JF5srcAu2fp/VzQD4AE5Kq7ywukMvlU4Y3X2t+D2eU1DH8pk
c8mM1CtQWfWUboaoLABVmYmYfihDvTURkzGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAX
BgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1F
IENBIDIwMjMCDDy76dRYp65lyF2c4zANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg
xol5MY2Y1cpaXqZznt/4eK9eLY1D4TlydbuNCTfXLF8wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEH
ATAcBgkqhkiG9w0BCQUxDxcNMjYwOTIyMDQ0MDA0WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFl
AwQBKjALBglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzAL
BglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEArNr+cxNQ0h83xF4sF8Try8HhSGq9TA2J6HYI
VOFQ9V/sJQEIMOlQ7D+Gv1p69aalJ0adlg6fcaGvBBY/I0sHfzqnES1/Ee9bsy541GDePJYNU+Kd
lgeuFGq5ykRTJONQRtzNC9JHaTc2FGgq21DkfK7cLIic7xSHW3nxpZQswLMliqDtQ+vsztzLV+0N
guyDxa3A9sT+PA75ia/YD2KCuZTnwcibFk9I88qIfVDItfreNHCxlwHWQ4efmlldgYj723bno5cd
yKqKV6j2UqJXoekqxiyaUx2YARnXPvt8MhQN8zaJ+D6WKf/HLTgr6CMgyL5cq84/fR9afvDujQgz
Ng==
--000000000000e0ee35065c0af53f--
