Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.230
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336604;
	b=TNwS9x8WtvaJQurKVtYQN1oIM41ReYpEfBZdFJO/8HTPNFROovA3LL/0eAOzsk2yhcI9
	 52OeWJ4dw+fXxUS+EGOzkSBKw2I9KqfIbPQu3kG1HMQBGuvZoUPAtSCISgg+3l0bB8xFA
	 Ze5ePqMB2sQcoNfIVhy0xP8JfOM2HOdn4ywBgCGWu7DnsAN2J15SyyL0kB7ChAtq+ibFC
	 S4xWaUJVkdDXyx0Y9i+/g6h+US/qOhXylko6TaWojxfm6w5E2fOfCBeSrSRb0m97rvBTK
	 1DRq553trXcJVlGDBjsxWUSdY4kZ1H+9Eb9Y0fJsxSETwUmSlSOUAVMMPbK19mPN7Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336604;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:X-DetectorID-Processed:
	 Content-Type;
	bh=oSeWmyvWMhzf1EUw04YJddzPAx3dmCGDjzbV5r2rfr4=;
	b=TjW0ZmmvSMVZBPeSW02dLzF2zZoqJFbwHMrPBtCeWWCnKSS1dSvIjA+7oeCE5AM/HYK4
	 bGuYCGgJDBGhroZz3ORfgF9qPhwDZban83QtMCqLDIKupdfx6fN4H0ilymugeHYgTBkLX
	 QVnD+G7MI5fJRzV0KljWm5/uxZo8BwJ1ami6P2Co5FcL1I3XvRKjNLXjPrAQo30QgP8c8
	 tltCGZ7NkBKrilwCklIDOFlTq3O/tgTQ6Yye9xWe5lgVwarq62g80WELEw3pSb0/2ORt8
	 TRhT0z8dRicDMv9/Bw2zyfYy1PTAOdWwYIHlYoqRtG/VuNpSEsYqUDNj+4UHrImXF8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P8eV3jYR;
	arc=none smtp.remote-ip=209.85.222.230
Received: from mail-qk1-f230.google.com (mail-qk1-f230.google.com [209.85.222.230])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9168B606A326
	for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 18:50:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9168B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=P8eV3jYR
Received: by mail-qk1-f230.google.com with SMTP id af79cd13be357-93f269e335eso275366485a.3
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 10:50:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794336602; x=1794941402;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oSeWmyvWMhzf1EUw04YJddzPAx3dmCGDjzbV5r2rfr4=;
        b=AdaOhiwnl6rx23nlQoXDOCOMcshuG7SCzcxSHRqIy1hfXbCfMJF3pR0bY8uzyqaj8L
         jA8a3RNarYm3g7kg2xZSyPPZkv+2EWD/8mTstmHu4wv7RWFlD94avKFXnp7q9kG4bAvI
         KgcrYPNVuziECwPTRSItAop67RUqXYd7kafGIJ7QoKwN1nWPugAny1+UxryIdye6zFrj
         1MIGDJmddWFEOEspIcTWDQ2sJBcxyCMto7spIKlN5b/5Wz6uHM20v0yxGn12cbyelE60
         Vop5cqkBIhewW5wtYoZH9WtpfT/kYGQ9zw3TqTTJl8CK+XlBhfibTBFm9sFflUO7CMb5
         M4KA==
X-Forwarded-Encrypted: i=1; AL+hErFfnOIhzOTaxc34juiHETpVsuetu77Dzm/jtatz967GY03aYJfB8+OW6YD5p/nDzS0QEorQV26IkHarmiAD51w=@lists.linux.dev
X-Gm-Message-State: APuU4Z8BK2OYTy+FrS3/hsnYPZ+S3GUmcyi3ENHiLVtASuVTBY7m2set
	wQRi87AhgxQCINLUD4jIy82UJxDKtN8odj5tDjWNfjjY31b2UOosc8mlhsJErTbp7IS6fEad3Mr
	6NZK296sP/47F9CYXE3tptyN/44NIPYgIt/edi4srvOdwxg+QNkV1B697dvygrcOBzij+OvIXFW
	GGyUOmyOwy7yspb9o3Khb5xIkNmosjYpsMJdpPmd9yK6RHnZEIzuRUZQpupxKBpqzLj7TcKnBQP
	phOVAVWURaG95IZrXMSFMQ=
X-Gm-Gg: AYBFou0SXR8hi8EH2Eo5wiH4RGm3zBi59r8mE1P53TEbxmC1vbub/Skfj5MWvLYjtqp
	sCmtuZnIPgfwlJPFi1W18o+17BbokVxaEZtfzLYuJmZfDxXXsBh8fMUdRvqVEYsqHly4QOwyD4a
	lk5f8wviHeEqIu8fTD/s+JpXZJ5C5mHpsd/5voLGBX259jMH2nPKZkHN3CmK98DjKzJPuNC4IFc
	LhYnxe2K7UYUry16qP7dxtlfKBxxlKI581huzWskQ6axpGoJGSeG9vZ+JgVzS0eCTFjGhqcrBcJ
	3RpQV6Z9JWm547lsm8YuimpbjMeBXpcavG9tks/yBW04JZKoptQDXJEzFJqF+OUPNT1LQCjHxj7
	u8OdW92chCBxSxYSnMMd+gG8B5ghq5AgM73bFiIfpenpPRiA5d/WUA2kMiteTe1+XIFmLdmdzwH
	SNDYkv1d6SuPgd8+9lb18e6JjZHD/DRPQs
X-Received: by 2002:a05:620a:4886:b0:946:2a0:a11b with SMTP id af79cd13be357-9479f32f250mr599089885a.35.1794336602337;
        Tue, 10 Nov 2026 10:50:02 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id af79cd13be357-9479ef8f02asm40490085a.8.2026.11.10.10.50.02
        for <sashiko-reviews@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Nov 2026 10:50:02 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-3763bd79663so379295eec.0
        for <sashiko-reviews@lists.linux.dev>; Tue, 10 Nov 2026 10:50:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794336601; x=1794941401; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oSeWmyvWMhzf1EUw04YJddzPAx3dmCGDjzbV5r2rfr4=;
        b=P8eV3jYRD1dOxom+iDFDYP1FR+awBhlD6NCQ9SZkWp9ZOnK632bdKHwP3r4BQSmz85
         76LEMT49NhqnRabA1cB4fLkzcdusToZJOTV3rhSo7hxsFDgFbGsSdXvoLs9TgVPYUcL2
         wWJgmvibTpnA1ypmW64tbLqo+w3aW8OPBUffs=
X-Forwarded-Encrypted: i=1; AL+hErFuTGCDPY07i3FnEjp6cbAQ5B9r8vDX3Fn1ZMLR1HoKrWnWUXJSLfzHcp2p+BdUmvfxKxvbuESH3NC817oyOAk=@lists.linux.dev
X-Received: by 2002:a05:7300:1486:b0:376:feb:2df3 with SMTP id 5a478bee46e88-376861801e9mr261489eec.20.1794336598043;
        Tue, 10 Nov 2026 10:49:58 -0800 (PST)
X-Received: by 2002:a05:7300:1486:b0:376:feb:2df3 with SMTP id
 5a478bee46e88-376861801e9mr261404eec.20.1794336596867; Tue, 10 Nov 2026
 10:49:56 -0800 (PST)
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261110084710.503870-1-tzimmermann@suse.de>
In-Reply-To: <20261110084710.503870-1-tzimmermann@suse.de>
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Tue, 10 Nov 2026 13:49:42 -0500
X-Gm-Features: AclHuK8-P0Cj-xUNZlNamFcxKz9crXduQgmI-OdXcagOmvIZ8CcpGbw7lqHvys0
Message-ID: <CABQX2QPwdFeeCHXKiFm0DDAo+URu4sXy1qGdxw5Wwit1hdX_OA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] drm/vblank: timer: Fix race condition in enable_vblank
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: ville.syrjala@linux.intel.com, maarten.lankhorst@linux.intel.com, 
	mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch, javierm@redhat.com, 
	louis.chauvet@bootlin.com, dri-devel@lists.freedesktop.org, 
	sashiko-reviews@lists.linux.dev
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000bd4020065ff08b92"

--000000000000bd4020065ff08b92
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 3:47=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse=
.de> wrote:
>
> Busy-waiting in drm_crtc_vblank_start_timer() until a previous vblank
> timer has completed can deadlock. Rework how the vblank timer's start
> and cancel helpers interact with the timer function.
>
> Patch 1 fixes the possible deadlock by removing the busy-wait loop from
> drm_crtc_vblank_start_timer(). To avoid possible interference between
> _start_timer()'s hrtimer_start() and hrtimer_forward_now() in the timer
> function, extend the interval_lock around both. Both, _start_timer() and
> the timer function, can still overlap, but hrtimer initialization should
> work reliably. At most, the first vblank event after changing the interva=
l
> might be off.
>
> Fix the possible overlap by canceling the vblank timer's internal hrtimer=
.
> Do this outside of the vblank code's critical section after switching
> the vblank timer off. With the hrtimer being canceled, the next vblank
> event will be sent at the correct time.
>
> Tested with bochs on qemu.
>
> Additional notes: there have been reports about vblank timers not happeni=
ng
> in time, such as [1]. We suspected that might happen due to guest systems
> running under high CPU load. But the problem could also be caused by the
> deadlock fixed in patch 1.
>
> v2:
> - handle uninitialized timer in drm_crtc_vblank_cancel_timer()
>
> [1] https://lore.kernel.org/dri-devel/6a176ae6.d07c18fe.1069e4.0016.GAE@g=
oogle.com/
>
> Thomas Zimmermann (2):
>   drm/vblank: timer: Do not block within critical section
>   drm/vblank: Cancel vblank timer outside of critical section
>
>  drivers/gpu/drm/drm_vblank.c         | 90 ++++++++++++++++++----------
>  drivers/gpu/drm/drm_vblank_helper.c  | 16 +++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_ldu.c  |  3 +-
>  drivers/gpu/drm/vmwgfx/vmwgfx_scrn.c |  2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 +
>  drivers/gpu/drm/vmwgfx/vmwgfx_vkms.c |  2 +-
>  include/drm/drm_crtc.h               |  9 +++
>  include/drm/drm_vblank.h             | 16 +++++
>  include/drm/drm_vblank_helper.h      |  2 +
>  9 files changed, 108 insertions(+), 34 deletions(-)
>
>
> base-commit: 7d502136b31169f6b5575f7f89c3da60cdf7891d
> --
> 2.56.0
>

Thanks for doing this. Looks great.

For the series:
Reviewed-by: Zack Rusin <zack.rusin@broadcom.com>

z

--000000000000bd4020065ff08b92
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
6U6qgI8F5eiKsQyE0HgYrQJx/sDs9LLVZlaNiA3U8M8CgEnb8VhuH3BN/yXphhEQdJXb1TyaJA60
SmHcZdEQZbl4EjwUcs3UIowmI/Mhi7ADQB7VNsO/BaOVBEQk53xH+4djY/cg7jvqTTeliY05j2Yx
uwwXcDC4mWjGzxAT5DVqC8fKQvon1uc2heorHb555+sLdwYxAgMBAAGjggHYMIIB1DAOBgNVHQ8B
Af8EBAMCBaAwgZMGCCsGAQUFBwEBBIGGMIGDMEYGCCsGAQUFBzAChjpodHRwOi8vc2VjdXJlLmds
b2JhbHNpZ24uY29tL2NhY2VydC9nc2djY3I2c21pbWVjYTIwMjMuY3J0MDkGCCsGAQUFBzABhi1o
dHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMwZQYDVR0gBF4wXDAJ
BgdngQwBBQMBMAsGCSsGAQQBoDIBKDBCBgorBgEEAaAyCgMCMDQwMgYIKwYBBQUHAgEWJmh0dHBz
Oi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAkGA1UdEwQCMAAwQQYDVR0fBDowODA2
oDSgMoYwaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9nc2djY3I2c21pbWVjYTIwMjMuY3JsMCIG
A1UdEQQbMBmBF3phY2sucnVzaW5AYnJvYWRjb20uY29tMBMGA1UdJQQMMAoGCCsGAQUFBwMEMB8G
A1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1UdDgQWBBQNDn2m/OLuDx9YjEqPLCDB
s/VKNTANBgkqhkiG9w0BAQsFAAOCAgEAF463syOLTQkWZmEyyR60W1sM3J1cbnMRrBFUBt3S2NTY
SJ2NAvkTAxbPoOhK6IQdaTyrWi8xdg2tftr5FC1bOSUdxudY6dipq2txe7mEoUE6VlpJid/56Mo4
QJRb6YiykQeIfoJiYMKsyuXWsTB1rhQxlxfnaFxi8Xy3+xKAeX68DcsHG3ZU0h1beBURA44tXcz6
fFDNPQ2k6rWDFz+XNN2YOPqfse2wEm3DXpqNT79ycU7Uva7e51b8XdbmJ6XVzUFmWzhjXy5hvV8z
iF+DvP+KT1/bjO6aNL2/3PWiy1u6xjnWvobHuAYVrXxQ5wzk8aPOnED9Q8pt2nqk/UIzw2f67Cn9
3CxrVqXUKm93J+rupyKVTGgKO9T1ODVPo665aIbM72RxSI9Wsofatm2fo8DWOkrfs29pYfy6eECl
91qfFMl+IzIVfDgIrEX6gSngJ2ZLaG6L+/iNrUxHxxsaUmyDwBbTfjYwr10H6NKES3JaxVRslnpF
06HTTciJNx2wowbYF1c+BFY4r/19LHygijIVa+hZEgNuMrVLyAamaAKZ1AWxTdv8Q/eeNN3Myq61
b1ykTSPCXjBq/03CMF/wT1wly16jYjLDXZ6II/HYyJt34QeqnBENU9zXTc9RopqcuHD2g+ROT7lI
VLi5ffzC8rVliltTltbYPc7F0lAvGKAxggJXMIICUwIBATBiMFIxCzAJBgNVBAYTAkJFMRkwFwYD
VQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBD
QSAyMDIzAgxhPxw+eieHWB40hPkwDQYJYIZIAWUDBAIBBQCggccwLwYJKoZIhvcNAQkEMSIEICgv
ZBt9WZJVNoCzgxosl65W33PyV/4ppwnoRykG9x4gMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEw
HAYJKoZIhvcNAQkFMQ8XDTI2MTExMDE4NTAwMVowXAYJKoZIhvcNAQkPMU8wTTALBglghkgBZQME
ASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQcwCwYJ
YIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAHzNbrCSQaSHtmEh4uzC5spY1kmS/RDbuIHrZ5I8
qJZiQu7wPzW6KSwaH4lm6Ngpx8GeZ9z5PeDzYPaCnf74wEBPIooa+WFkGE1tzV4pXbrjGyWHJ8V5
qIvOjgxkB+Gb3vQYWJbuR3eWEyH3hEAa0x/LgJ2IAdTOcagPDUIhKrsjsmuqXI2xmdd2L5QkLtWq
3uZ2yXl8sl5TsV4/Mlgia4N/ubnyxUe5qFGB093e6W7VjuJpYQEjQcvc0Kdmluh1+8OhfR+yjdpP
5RfTs40mOcnL27K59zwpMFzlmUiq0PYbGWLlyYLG30uUYzt4rHHdAKq96TvPURWZQHpPnUmjLhU=
--000000000000bd4020065ff08b92--
