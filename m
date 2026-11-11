Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.99
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794415817;
	b=tVU3YC1IbsEwGK3nA75ujisj+gqKiQt8bv/zyD7TirvMiMU+imEZ/zVWM1+EW8r0Vfjd
	 msa5296n6a0RLazvmt3oUQOLFVniY2KAqojvWKTg4/bvxRAAGX0E8xX+2pVRv0ErBtpfR
	 RgN1o1h+wsgiDWwV8AFmAse518ZbPZnoJjC5lK74Wv9T6Vn+ixg1zdpHy1QmjTN5Ld3xu
	 xCE1sXgxkLCeR50dpb1TJlstynULCYNiLMI5BvLCZkq+yqEwYDKHgn6Et+ZnTFz4BEjS9
	 VXrUxNa3e8sTqxe4kUgoeOz5IAgdiSTvSj81kA6lta6w27voH5FdgcONrEOM6NCTIkA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794415817;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
	 DKIM-Signature:X-Received:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 X-DetectorID-Processed:Content-Type;
	bh=5XjQr8wD3vYmZje9Rsb6CfsD4kwJ0czpWP9g7K9jxuA=;
	b=4arjOBwRaGCeXtErI/fYiht/DphT8QS2avcjis0hW9Tl8jLx86cFh5c+iedzTxDbRmdA
	 cOjPbRCMeI1WWwUokvYj2v9oZ8LIG0BlVdsxoo2ML6k0e3aJAQwiRrD/+ebg5MetQvc3+
	 L2MtvLp7lwx3B34G3emkDXj2EKB8+dJDl4m5PRxW/Ya5AIot2XybgCHyXwaMCmZW49od9
	 mJ/y8b83GR/J71whXRcp9X/l7qGxOnfZiG4ZwF6kGpcHnea7JULmt+7uyUI86ypX7u32V
	 pYN2tWb/YgnNq9HGomSnkaI/DjxyFJIQay8DZVTr6Bj6j0IsewiGy9T2/8CHL0d3YHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T2Go3ORI;
	arc=none smtp.remote-ip=209.85.161.99
Received: from mail-oo1-f99.google.com (mail-oo1-f99.google.com [209.85.161.99])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F69606A337
	for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 16:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 20F69606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T2Go3ORI
Received: by mail-oo1-f99.google.com with SMTP id 006d021491bc7-705cb6cedd5so10790eaf.1
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 08:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794415816; x=1795020616;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5XjQr8wD3vYmZje9Rsb6CfsD4kwJ0czpWP9g7K9jxuA=;
        b=VdFfBjiBt477YMuTEH4QzwICYBNHka+5N81CZueXpHrS6qMr9g9taTywhy1gEwOAgI
         N0mzsBoaqMd3dK9jeEd0wmbOX+FKKi7UHQDhsLWKbRXfNI3MIffL6ZOlyTfFBpjvnNxN
         fQ1h19AEys8vt01bb4NFCtMW2XVTvt92NcCfN/hriigQgwXeL7YWwPdFuY3aUkLyW8AD
         yWDNS0+XCAz42SCxBneQt8lc6X8SZAHWjjFBftbfz1y9URxAgzpRbBPp/ify7SxoDsQc
         f4abY/ww8SXuIx2/YaWip7xeJKNzPvLoZ68tAd2oQ0AogZEVZbQaXW5BV3hdofbkcb5F
         rw/A==
X-Gm-Message-State: APuU4Z8NvDeFjgKbo/7linFcJFihsmLMZKHf/j3cuVlzQyyKKD0fur98
	6/q71as6AELuWWjvu4qB4TRUXa9Z67UABugnIRW83YdVNFgMnfinceeC6oS/untO3AIZg2+bs9G
	kgGh5a0gXDDT013rxC0Ru2muhts97NSa4l8oAmRKLBEPyZcmJ4fHI69sSghIxKa4N9TyZGOgJC9
	KKgtTWJAG/HaT54JqUelsXffE0AGe6AX8Qv6nZDYVIqE++rTgXHwF4FAgR0DOBpjuWVYCy4fjIE
	5TeFAOY6nrPcKiBd8a4
X-Gm-Gg: AYBFou2GqDOevWj+2dLYE0WXWCyC7CLkwO0i6IOPYw5Y2jp3Iy7soHVlpZlWY/ZsELP
	pGRN7f9cIr85KwQLwuHnqpfGCaVaLh20WYuILay6XUo3UwOr5LLuyLa8EKxm9GgUsBsVkb0Uyyd
	r/xxWJe4w7SbvjRUd+E3LDxuTzMlO67UBMTp/hg/DO/epP6qv6w6lqkOm1/PNAy6+9eAcMVfAXQ
	fMC8rk5Yw0TL9e4M8U6tGz0zNQK6WEIUroJKR8wq1fL42LlsJ+3A8afPlViI4aiB9i8lCkd3yRF
	SFqAyow7bv9ZjsXzH2hjOj9i0YkXrQriKFFonyI1TEczK7CjAxAmb0i8BHw+E3WH9fiHsKICp5g
	Nz/FnCOOLyRF+11O3KY4ZdGrrbGotxdqQ9jn87WOuC4Yc9ZAJMpBOlCmLttn1cxC+vVZ9FAP8bO
	hg7Up2K4L21li2dfqTYmLoMq9u4S1PLWkX
X-Received: by 2002:a05:6820:168a:b0:6d7:9b1f:6b87 with SMTP id 006d021491bc7-719741ab809mr16265eaf.23.1794415815832;
        Wed, 11 Nov 2026 08:50:15 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-22.dlp.protect.broadcom.com. [144.49.247.22])
        by smtp-relay.gmail.com with ESMTPS id 006d021491bc7-718a6a3814bsm47992eaf.3.2026.11.11.08.50.14
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 11 Nov 2026 08:50:15 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-6b763d2c2cdso1892296a12.2
        for <sashiko-reviews@lists.linux.dev>; Wed, 11 Nov 2026 08:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794415813; x=1795020613; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5XjQr8wD3vYmZje9Rsb6CfsD4kwJ0czpWP9g7K9jxuA=;
        b=T2Go3ORIxipN9fEtKfvvTQdg+/Vj5T00ah053IKGoNlEejYlnKDiVWkmq60CgJNqxl
         41wnzLLxAs3Gnzbl1Yv0fssTyIgmqICFXMGJM75kj5NiDWbuul3T8FMnIk9eOv711J9t
         fsOxY+04oEO15vcaSW7/hUFQ8NO04/fAb3KgY=
X-Received: by 2002:a17:907:961a:b0:c4d:4ce5:7733 with SMTP id a640c23a62f3a-c5066b47974mr231100166b.30.1794415813134;
        Wed, 11 Nov 2026 08:50:13 -0800 (PST)
X-Received: by 2002:a17:907:961a:b0:c4d:4ce5:7733 with SMTP id
 a640c23a62f3a-c5066b47974mr231098166b.30.1794415812536; Wed, 11 Nov 2026
 08:50:12 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109-uet-ib-core-v3-0-3e7e7ffed2e9@broadcom.com>
 <20261109-uet-ib-core-v3-13-3e7e7ffed2e9@broadcom.com> <sashiko-outbox-206403@kernel.org>
In-Reply-To: <sashiko-outbox-206403@kernel.org>
From: Eric Davis <eric.davis@broadcom.com>
Date: Wed, 11 Nov 2026 08:49:44 -0800
X-Gm-Features: AclHuK-9myP5sE6RQ76RXYDzKbis4jaL4liHUq7-Tg_ozYWMBDz1erRP_nxNphQ
Message-ID: <CAMouMYLToUfUx9Xqms8MHCQ=T1SB8s-3eTizrVz8j2Gm_X2quQ@mail.gmail.com>
Subject: Re: [PATCH rdma-next v3 13/13] RDMA/core: attach a memory region to a
 queue pair
To: sashiko-reviews@lists.linux.dev
Cc: linux-rdma@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000253487066002fd0a"

--000000000000253487066002fd0a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 9, 2026 at 10:20=E2=80=AFPM <sashiko-bot@kernel.org> wrote:
> Can uverbs_free_mr() observe a stale non-zero mr->usecnt after
> UVERBS_METHOD_QP_DETACH_MR or ib_destroy_qp_user() detaches the region an=
d
> spuriously fail with -EBUSY?

It can, but only for a dereg racing the detach. That dereg has no way
to know the detach finished, and -EBUSY is what it would get had it
run a moment earlier. If userspace orders the dereg after the detach
returns, whatever orders them also orders the decrement. Nothing is
freed early: the detach holds the MR with READ for its whole run.
Attach needs the barrier after its increment because there the other
outcome, a dereg reading 0 for an attached region, frees it in use.

> In addition, both UVERBS_METHOD_QP_DETACH_MR and ib_destroy_qp_user()
> clear mr->attached_qp before decrementing mr->usecnt.

On the destroy path this can happen, since QP destroy holds no lock on
the MR. Again the outcome is a spurious -EBUSY in a race of the
application with itself; the count never reads 0 early. Decrementing
first would be worse there: once usecnt is 0 the region can be freed
before attached_qp is cleared, the use-after-free found on v2.

> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261109-uet-ib-c=
ore-v3-0-3e7e7ffed2e9@broadcom.com?part=3D13

Thanks,
- eric

--000000000000253487066002fd0a
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIVUQYJKoZIhvcNAQcCoIIVQjCCFT4CAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghK+MIIGqDCCBJCgAwIBAgIQfofDCS7XZu8vIeKo0KeY9DANBgkqhkiG9w0BAQwFADBMMSAwHgYD
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
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGhzCCBG+g
AwIBAgIMV+ot3F/3fQjMh7yLMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI1MDYyMDEzNTIwOFoXDTI3MDYyMTEzNTIwOFowgdExCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEOMAwGA1UEBBMFRGF2aXMxDTALBgNVBCoTBEVyaWMxFjAUBgNVBAoTDUJST0FEQ09NIElO
Qy4xIDAeBgNVBAMMF2VyaWMuZGF2aXNAYnJvYWRjb20uY29tMSYwJAYJKoZIhvcNAQkBFhdlcmlj
LmRhdmlzQGJyb2FkY29tLmNvbTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBANfEH6AC
+LxMFQKtBM+3IIkk3y79FdNJ0aSEtx7ylIALY2Cy+w4cZ2mnTQBz8I/fcvc+7Nu4+C82MEouggu7
THSLCC9N61nO6/woOMp7U0lttATSMIeibGPNnU8AizWyI5DxXKkIG5jv1EosjdJwBsJ8ZntvpfIx
+KplEkYfqN7Sy+7LOzXXkl5KhTkDELRuftv+sahPNzVHW1cJgj0HjMb1sCrFjzcAuO27JA4geQXW
cl+gyZDv53xtHnMSNmIoqDEINo4yoSHYPGK+cTtGC4K9a6yCXdP2zyLkkSQtZ+hEUOru4dQ1gIZf
4bWVHOILQGaMbqVAVA1OrjpUNGktgz0CAwEAAaOCAdswggHXMA4GA1UdDwEB/wQEAwIFoDAMBgNV
HRMBAf8EAjAAMIGTBggrBgEFBQcBAQSBhjCBgzBGBggrBgEFBQcwAoY6aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyNnNtaW1lY2EyMDIzLmNydDA5BggrBgEFBQcwAYYt
aHR0cDovL29jc3AuZ2xvYmFsc2lnbi5jb20vZ3NnY2NyNnNtaW1lY2EyMDIzMGUGA1UdIAReMFww
CQYHZ4EMAQUDAzALBgkrBgEEAaAyASgwQgYKKwYBBAGgMgoDAjA0MDIGCCsGAQUFBwIBFiZodHRw
czovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzBBBgNVHR8EOjA4MDagNKAyhjBodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAyMy5jcmwwIgYDVR0RBBswGYEX
ZXJpYy5kYXZpc0Bicm9hZGNvbS5jb20wEwYDVR0lBAwwCgYIKwYBBQUHAwQwHwYDVR0jBBgwFoAU
ACk2nlx6ug+vLVAt26AjhRiwoJIwHQYDVR0OBBYEFIjgxJwMJZ5pkTAB1796PUvJ+W7DMA0GCSqG
SIb3DQEBCwUAA4ICAQCM/INVouXcD/gHdJNCPtF31BpLUwHGTj4BlO4083w8xuxt0iSjyb0EKv7S
LBz29Dw9scSTMRS/sY9dotjJ03vVvzceiGB4FbMIZNSKHTy1PTNu0oZR7TwhBEEZHC4RtST9S2hU
MvDagOAWRM/56PG6FH2i7dnhwtcnsBX8CMeVJQc6SB21LuxJVqgULli/kbrkr1DBVMh2f7oCFHVu
0VgtvRtACeQVi7ny8wspKNV/WXN2IqT06c0vtUmFUPkidlgGxMzYCfQXbXcE3YvA7+xYqmCY0zdQ
f/ira3VJoAytznhfRSBRV4gmlChdSg8yoaM6LHNE7igDDqhVFT2QCqkRkIcPOCQYxNE4kViiDKKo
3VFnREnYmLzRbJkdGY4X3m+N7HOU8R99Zeatx6hN02eJQH1vZ1J9cH4SqxuqDxKi05n3SGE7J4Wc
oNsgfaIDL28JX+2JBG+gKr/vvjocja5y9G43gvIOs9yEzGBt91FCuuwPedXIIREUcqJtq6+MOvAq
ZMEsct9jQXibihTD7z9wLTIkXqOHumCc6f53zhsQCRofr8m7Tm0YrckGCHd0BowU12A6oVax5xEQ
6j1hyszkhFPrlLKAlaFU7VuIwlcjKvN9XYrmOfXfTnYoVV6f1IDwhgbtJNlKnJksqoCzfsbAVd0e
usA704DOznTCfAYJqjGCAlcwggJTAgEBMGIwUjELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2Jh
bFNpZ24gbnYtc2ExKDAmBgNVBAMTH0dsb2JhbFNpZ24gR0NDIFI2IFNNSU1FIENBIDIwMjMCDFfq
Ldxf930IzIe8izANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgtkaha8Fgk/SBveY7
7UWytyktVmDek+pnF+dIi43nW0AwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0B
CQUxDxcNMjYxMTExMTY1MDEzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgB
ZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEw
DQYJKoZIhvcNAQEBBQAEggEAyeh9n2dlyVZovgrzD/AUPjy9dnyAauGAFMMGiDNHA/gf4ePzFR5V
MGhsQLt6mvRJfbJmD533Lj/XxmSrgrRBVO91UDu8tbsCrFuF1Vi4sJb8LNDRIyfydkNsU9oIGzxy
+msLVfoA263hH+68ChAY+QPlxay6XWFW7wQWRS1HMFKda1J7BSCWOfiavksTj0Vpbqaua7XP+6fj
3z6O3OtF8COUQHzwttg7mN95XcHAHdIOeMwVMXCixTjNtez2Ep+6baLvuSbYgH0EJG2zClQYEZ/F
YDT1RoCKRMFOohMlfCyFqWgyvROCKZjt2pie7Y9XnlZNJn3XIak8JZ8ZRFx9pg==
--000000000000253487066002fd0a--
