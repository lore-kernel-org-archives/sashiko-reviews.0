Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C572429CD2
	for <sashiko-reviews@lists.linux.dev>; Mon,  5 Oct 2026 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791191227; cv=none; b=SWN7uQxAcUG95UFTdaTECioOBflR47+NgeX6UOSTpL8ua7mFaVUKPB5IvmXsnt4eQGnJbGJHk+szi9C041Nh+RRt2KHV2e+pGxyf5cc/4ytJr21A03+rpwQ9BLuvCSVGk8o/eJzaPoF6SqfqJxR1gl954IF4h6eIXXoJqCcbz1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791191227; c=relaxed/simple;
	bh=AcOLGf4v2rbS8shGlvVPEN+rZjREDTeoRFP79D6hClQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NEhiHl0egu4c2J3RVkPypTewHe0UVVSR46Vt8k6N7NpPtLDZMxpvKJfgHZp9NaB1kn0X17+bGUYrfL6gugs/0/Hv6CFmT45Rtu3JPtfhgKxKqk28BQmXw5TPwYzxp7q0c6isINeKJOCkLKZnmRH58li6BKTk/N2GPxmMEFFl2j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=imtTSJUW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="imtTSJUW"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-49d05d51553so10374975e9.2
        for <sashiko-reviews@lists.linux.dev>; Mon, 05 Oct 2026 02:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791191223; x=1791796023; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uWvBdfWTlWbNxYn1ui3rGPRWaxO6riK7kgAYX6piQTM=;
        b=imtTSJUWeTWMdtJkbOhHPSU+EeI9MD83MFqdXrO8XnKR4r6ufIJfxDiXh2lEKB7h9u
         /8wZ9RcobAlGLGpAtNUQV+P+ZD51MLQIGaaXKeZNwOujWD1GIASvgn39ABMVngXj3KeU
         sInFbF4DY0Dki67DLS9grRpK4JmkBzyZXsoRmM+tfFBcmxTHnFkbOxZYVCNs3j9zcH1r
         j/HW8kagoZrOA6d/gZT1uIUbFc2/zIev4TLnqDV21pbthbYk8LQ/6wTuoLpw/6PTGCBs
         nk/SZtoxqs5n56r/m+68h2bYXa4zzkt+jZrcL8tC7FCmFMsZfrJaCXjShgF2fwst26bF
         AaXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791191223; x=1791796023;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uWvBdfWTlWbNxYn1ui3rGPRWaxO6riK7kgAYX6piQTM=;
        b=NdBzjFr/EDT2bUwDRs/14FBxtB+B2SJnKhWlY5HO1idhDjZxnyLePa5RSn7iW0aQUh
         2Jh9XIGiUFJF3sW5/tWD8lY9Vw3RUU9UaSMXfbjqhP4ylOD/SQsX6a3PdTNJfMytqbXl
         bXNKrRWsKEZpLsV+QBtYCO1PrCzO7RQqp79bCw6tAvcekO+MEwlb3GREoqw/X0jid0n9
         zM6G7iPSb8L4VD9Bf36JNAY+WessQAEOt3Ka9UPFDkActcYiexOJuGynKkEmRMWV4FEO
         f8fvHCeAIQZbGyCa6AM/UA+qIa+s87ZGoQDm1PkR3He9+Z0mG99CzUlR1an3LZdD69DZ
         8EsQ==
X-Gm-Message-State: AFuF++kzA3Kb17x8Q0CVwHvR30XDN+yn5lrk3tb3WcDJrdsjvaSYi7v4
	YYyvvayefqiVdCaSvW4rD86p8RqYzsOdLGUS2CwXKEc8oywXXyZ4YKGfkQPZOXb0LJI=
X-Gm-Gg: AYBFou2/YsjlM5q6PfXKCOOP5Kx69etWyKt0731Zuy1qf+35JVmWsi8g2ijVR/WrHgB
	vaIU7UKYNvcYuR4JCga6ITQK8aKmTZ3eSmIO8ZmbRzQwRsGU9ky6cfGWfbF8BtnoSXE5I8LULmG
	eZNbpCWgXMM+Ux7xHYAHVrWxusAm4kvKZtbObnrHBRLW4rAHATh+SB7bIC9wQUnbrBtKXf9t2yD
	dUuMPn872629V8FveFycDnX/E5LjRX7HYUfdSgc6HWBJufOWFM9pf1JQw0LZ5BKGTmHUxEZoERo
	9e+DGvPvccxOhVFk7hqfz8btcyZsGu7mUW9PVdZS3gmgoQv1YROotRM64cB/6Xw8HhlrXDFVqTX
	wmUy6ThgZ8XEiGl9+5qsnYLo7o/wZGCWMbofmfQevm1spGl3V2rLcUpeJQwn8P3TyfNa1BuW2X6
	HPcR61PQbPlH1angLcB+B8WZChHpmhK7NcEZ8y0wyvQbcWP3SbcUxqWsSpssbW5bQJMc/uSozoa
	QM2/iZBJCb2/SdmBhxwee3dgA==
X-Received: by 2002:a05:600c:6212:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a1680e9466mr100424735e9.10.1791191222643;
        Mon, 05 Oct 2026 02:07:02 -0700 (PDT)
Received: from localhost (90-182-211-1.rcp.o2.cz. [90.182.211.1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a0394c937csm189528695e9.1.2026.10.05.02.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 02:07:00 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
Subject: Re: [PATCH v8 3/7] clk: nuvoton: ma35d1: Retrieve HXT/LXT from DT
 when possible
In-Reply-To: <875wzhjhe6.fsf@bootlin.com>
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
 <20261004-perso-ma35d1-upstream-clk-v8-3-e1a106a128c0@bootlin.com>
 <20261004205903.E62F91F000FF@smtp.kernel.org> <875wzhjhe6.fsf@bootlin.com>
Date: Mon, 05 Oct 2026 11:06:50 +0200
Message-ID: <1jmrss7byt.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: sashiko-reviews@lists.linux.dev
List-Id: <sashiko-reviews.lists.linux.dev>
List-Subscribe: <mailto:sashiko-reviews+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:sashiko-reviews+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sun 04 Oct 2026 at 23:16, Miquel Raynal <miquel.raynal@bootlin.com> wrot=
e:

>> This commit modifies the clock driver to retrieve the external HXT and L=
XT
>> clocks from the device tree instead of registering them directly. It fal=
ls
>> back to registering LXT for backward compatibility with older device tre=
es.
>>
>>> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk=
-ma35d1.c
>>> index ceebcbd8c18b3..ed61a990870e4 100644
>>> --- a/drivers/clk/nuvoton/clk-ma35d1.c
>>> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
>> [ ... ]
>>> @@ -240,12 +257,18 @@ static int ma35d1_clocks_probe(struct platform_de=
vice *pdev)
>>>  		return -EINVAL;
>>>  	}
>>>=20=20
>>> -	hws[HXT] =3D ma35d1_clk_fixed("hxt", 24000000);
>>
>> [Severity: Critical]
>> Does this unconditional removal break ABI compatibility with older device
>> trees?
>>
>> Because HXT (index 0) is exported as a public ABI in the DT bindings,
>> removing its explicit registration leaves hws[HXT] as NULL in the provid=
er's
>> clock array. If an existing downstream or older device tree consumer exp=
licitly
>> references this clock via clocks =3D <&clk HXT>, won't the provider's
>> of_clk_hw_onecell_get() fail to resolve the clock and return an error?
>
> Jerome, your wisdom matters here :-) For me this is a false positive,
> because nobody outside this driver should access hws[HXT] and the clock
> is still referenced through the DT, just not provided by this
> driver. For me this is not an issue we should consider, let me know
> otherwise.

Strictly speaking there is (used to be) a clock at this index so it is
not a false positive. Someone crazy enough could have gone through here
to get the OSC even if does not make a lot of sense.

This clock should never have existed to start with but it got in the
bindings ... and that is the pain of dealing with bad bindings :/

You've got 2 options:
* Removing the ID from the bindings explaining clearly that it conflicts
  with the fact this clock is actually an input according to the same
  bindings. I suspect the DT maintainers won't like this much ...

* Keep the bad support binding in the driver: You'll need a pass-through
  clock element where the parent data is the fw_name and a fallback to
  an `hxt-fake-internal' fixed clock. Feel free to add a comment
  explaining how bad it is to use that clock and what user should be
  doing instead.

You'll probably need to play that last trick with the lxt anyway ?

>
> Miqu=C3=A8l

--=20
Jerome
