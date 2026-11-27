Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795808505;
	b=K4AVqTA4wQvLQb09QV6//jsbDrTm1uLnVWJilaAF5rFsWLW+EsAuup8k88a+3QIeD6qw
	 ZQ+4m0ML57hzYL5sJccD4NHIfQT5THzilziNCPjyOzWAbBre0sfnKzsaE1fPh9L+BBR76
	 x7/PAtpBYfhbfRFA5kLqxE2XDtikW/EFNdLp6PZzGuhNX7oHx8spXbw4o2Dpg9eUwSHWN
	 0Q3LwdyxIOv8rZxYIM0p24CF//6Qrsx4DvtMwPGvVtRArunlWeZRaCIM35VsFxSMtJxuM
	 BRbk32jtQfn9SB/FGmU+0OH7A4XzvYLl7zQJBzGiRVQQF4fDTq/xhLyZTq5Rv6iu4eA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795808505;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Subject:
	 From:To:Cc:Date:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=6NlbtvLkK0tgXcaycQQR/bKkLqj97Yphah1S3Bta7cY=;
	b=EZSIeUSa6kJMpmE+t7ImidlRXCXFQj6XzZ2fhgoWyblJISTC0nzzgxSZ2DXR34DwijmY
	 Ae4GmWZHHW+3uKeY57684kf/FQ8I/tlCHxYSBTjl7k7kiw102Wr8fRiTIo45DCiEFtpMW
	 DSJsaWtSfi9VaGGMO3H9VbIC/AYrNsozbwPpZ+kBKJT6JzWP7jQOHLleOgAq/wvjFq2Mu
	 gL4fbZY7tjq9eT4gptcojM3jurNGJsiOwm/7fk/zu2FdsXypWpgRq2t8e+j8T3JG6ySzG
	 GB2XrcosIbOBejmucowEdbipS5PDvYFClm3QWI0we4Fi67Su9+4N4cJcOoJ/RwbjK+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wfHy3Lfl;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 691E9606A31F
	for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 19:41:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 691E9606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=wfHy3Lfl
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-492f0a1b685so6050528f8f.0
        for <sashiko-reviews@lists.linux.dev>; Fri, 27 Nov 2026 11:41:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795808504; x=1796413304; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=6NlbtvLkK0tgXcaycQQR/bKkLqj97Yphah1S3Bta7cY=;
        b=wfHy3LflWfbA+3j2hUr129CB0u9fsmKnDLoZzLHNfgtIRF1krJlD4PHNKQEFxMYcFa
         Qa2iQFkAdxt5vCIUcRqzGaz1HyeO3/X42fELHv6ev4JdQ1hAQ+4oKFdQdECTpsnL3YlU
         SVKX+/To8oytAaE0sXGVG/aH7p2XIINJjkYoEloBi6KbKIS/EjgYyigFMo+p/T5/zpcg
         yYKt+0aQG5LZRFlGg5sQ5xj7BEzflFQKGeCc7zLN7YtVLNvRO4wY/AZ+xPbrJ2ikG7o/
         zGOJ0JuG4F+z8ucXFSIOW3wL9QaDasr2yJEq7V8zvYvekKdjb3d2fx/aWgkVnvyTBzsS
         1/1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795808504; x=1796413304;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6NlbtvLkK0tgXcaycQQR/bKkLqj97Yphah1S3Bta7cY=;
        b=2TNBeNkyx0ZdKIU1AE3NUym7tNQJNx3c1fsca9+kIzber+B86jazAE9bHrIeAMPHBk
         sLXJDFsXeom5IxeBcu5QR8E/ed2Ed6VZ4XA1mHr0o8Tp+MWdle8YbNxkfPTZXJ5l5Ung
         7gbuKDpKJlFIklx2PVe/C5VXDZR8LJiGZjk30kgRw/00v68OgvXV8fUWicXCIXd3TmPg
         t7W1KK4bswb9Xhafus8wNnbdNS57kDXul9TnnLtPQmNVevbIEljA/VfUPoiSbEh+xpkW
         jtpmujtO/JaIKbdXCEw28qsNpF1dIInq8y/z5W12opV2Nsn++NYhCLznCAXB7rK2hGzQ
         iUow==
X-Gm-Message-State: APuU4Z8zLD50ONS2JVnmqdJrauZOQ/wlhtAGMEaqeJQKb4WkAf2sNo30
	wkd8VmtjED2Hd/bBmnBbm5tG8xoh8LcdoNlgtn7j8XQkwohZU/TYFBGhQo+eEnsuibT8zs9UKmj
	/todJXwrIlw==
X-Gm-Gg: AZFdTZcajDBdC9sepf8bu8bxd+UPnCwE38BEZWW9ebznC7E0ihZLeCU9C+y3xyLF08j
	cWkQKC0ob/xV0bmlr+Eh4U5zJLOKwEtnostgcSdXuLXJY7pCvwm4um1ZS9FoAPmNU+A802Z2MNh
	Ufi8Un8PinjF6LgssepR+riEUkDKbWMU52oFkrRrCW+mNehZORCU9+cLjI0/JKeWu0SkMyzdEIb
	kDpdDhHIUHmydcv9cJbTLZ94dt3vtpY3NEFBfcgfZySUAKxaIItkfsIlxCQ0K1UBXsBVWlf2BI6
	MK9CnC5pb4lfvyg7yRTQApAbvt+f8temWH/zi9jTpfuowdkt5TwlKZ6owzKEIstdefi4GL2+oCD
	fD1t3fGgCFvMW7ak1gFfo0kPoZhuCzfRV9bKI37Vr+HAOIO60X81joCaT55RjqzUs+/JUOh8h7u
	ZWw0zKHqI1cF1Eo1k5VRJrsf5Bqc3pGbI0wkVafOc6lbhnF/DmGWRZDYlne/4B9DTUUT72eV+Mr
	CGASpfPIC4WXql/isbuq2v+VWyXsf0R2XeF2ZGe+4GnU+BpWqwinF0tIuNDL88P0W9vG0kZLRIf
	Y8XRwyP7NfmsU/KO3jdsKH64bArIA18geA==
X-Received: by 2002:a05:600c:1d8c:b0:4a1:c5eb:b445 with SMTP id 5b1f17b1804b1-4bb88820436mr532823045e9.35.1795808503757;
        Fri, 27 Nov 2026 11:41:43 -0800 (PST)
Received: from draszik.lan ([109.255.181.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bbb39dd4e7sm77524985e9.0.2026.11.27.11.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 11:41:43 -0800 (PST)
Message-ID: <d92561fd6eaea337c6bc3502bcd3df0bc30d0e60.camel@linaro.org>
Subject: Re: [PATCH 6/6] power: supply: max77759: follow the supplier from DT
From: =?ISO-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
To: sashiko-reviews@lists.linux.dev
Cc: mfd@lists.linux.dev, lee@kernel.org
Date: Fri, 27 Nov 2026 19:42:00 +0000
In-Reply-To: <sashiko-outbox-238159@kernel.org>
References: <20261127-max77759-charger-fixes-v1-0-b364a0862d72@linaro.org>
	 <20261127-max77759-charger-fixes-v1-6-b364a0862d72@linaro.org>
	 <sashiko-outbox-238159@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-9+build1 
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Post: <mailto:sashiko-reviews@lists.linux.dev>
List-Help: <mailto:sashiko-reviews+help@lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
List-Owner: <mailto:sashiko-reviews+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Hi,

On Fri, 2026-11-27 at 19:30 +0000, sashiko-bot@kernel.org wrote:
>=20
>=20
>=20
> [Severity: Medium]
> Does calling max77759_charger_external_power_changed() directly from
> probe and from power_supply_external_power_changed() trigger a lockdep
> warning between chg->sync_lock and &psy->epc_sem?
>=20

[...]

> CPU0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 CPU1
> ----=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ----
> lock(&chg->sync_lock)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 down_read(&psy->epc_sem=
)
> down_read(&psy->epc_sem)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 lock(&chg->sync_lock)
>=20
> =C2=A0*** DEADLOCK ***
>=20
> CPU0: max77759_charger_probe() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max77759_charger_external_power_changed() =
->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_get_property_from_supplier() =
->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_get_property()
> CPU1: power_supply_changed_work() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 power_supply_external_power_changed() ->
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 max77759_charger_external_power_changed()
>=20
> In addition, even without the unlocked call in probe, calling
> power_supply_get_property() on the supplier inside
> .external_power_changed nests down_read(&supplier_psy->epc_sem) inside
> down_read(&chg->psy->epc_sem), which lockdep rejects as recursive
> same-class locking because down_read() is not annotated with
> down_read_nested().

Both lockdep warnings are caused by the shared &psy->epc_sem lockdep
class in the unpatched base tree, not by a real deadlock: the two
semaphores belong to different power_supply instances (the charger
consumer and its supplier), so the actual lock order is acyclic:

  [chg->psy->epc_sem] -> chg->sync_lock -> supplier_psy->epc_sem

As noted in the cover letter, this patch depends on:

  power: supply: core: give each supply's epc_sem its own lockdep class
  https://lore.kernel.org/r/20261125-power-supply-epc-lockdep-key-v1-1-c8a4=
1b8a4470@gmail.com

With that prerequisite applied, consumer and supplier supplies have
separate lockdep classes for epc_sem and neither the AB-BA nor the
recursive-locking warning triggers (verified on Pixel 6 with
CONFIG_PROVE_LOCKING=3Dy across boot, supplier unload/reload, and
charger module reload).

Cheers,
Andre'
